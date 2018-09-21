<?php

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use App\Repository\EbookRepository;
use App\Entity\Ebook;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Core\Role\Role;
use Symfony\Flex\Downloader;
use App\Entity\Download;
use App\Form\ContactType;
use Doctrine\Common\Persistence\ObjectManager;
use App\Repository\DownloadRepository;
use Symfony\Component\Security\Core\Authorization\AuthorizationCheckerInterface;
use Symfony\Component\Security\Core\Exception\AccessDeniedException;

class MainController extends Controller
{
    /**
     * @Route("/", name="home")
     */
    public function index(EbookRepository $er)
    {
        // prend la date du jour, met l'heure à zéro pour la comparer avec la date de programmation du livre enregistrée en base de données
        $datenow = date('Y-m-d H:i:s', mktime(0,0,0));
        
        // va chercher le livre correspondant à la date du jour en appelant une fonction findEbookByDiplayDate dans le Ebook Repository
        $todaysEbook = $er->findEbookByDisplayDate($datenow);
       
        // if there is no ebook for today, sets to the default ebook
        $defaultId = 3;
        if ($todaysEbook == null ) { 
            $todaysEbook = $er->findEbookById($defaultId);}    

        // va chercher les témoignages et convertit le résultat en tableau
        $mixedTestimonials = $todaysEbook->getTestimonials()->toArray();
        // mélange le tableau des témoignages de manière aléatoire
        shuffle($mixedTestimonials);
        // prend les trois premiers témoignages aléatoires et les sauvegarde
        $mixedTestimonials = array_slice($mixedTestimonials, 0, 3);
        
        //rendu du template en passant en paramètres le livre du jour et les témoignages
        return $this->render('index.html.twig', [
            'ebook' => $todaysEbook,
            'mixedTestimonials' => $mixedTestimonials
        ]);
    }
    
    /**
     * @Route("/upgrade", name="upgrade")
     */
    public function upgrade(){
        return $this->render('upgrade.html.twig');
    }
    
   /**
     * @Route("/download/{ebook}", name="download")
     */
    public function download(Request $request, AuthorizationCheckerInterface $authChecker, DownloadRepository $dr, ObjectManager $manager, Ebook $ebook) {
        // interdit l'accès si l'utilisateur n'est pas authentifié
        $this->denyAccessUnlessGranted('IS_AUTHENTICATED_FULLY');
        // va chercher la date et l'heure du jour, la convertit en chaîne de caractères et l'enregistre dans une variable $datenow
        $datenow = strtotime(date('Y-m-d H:i:s'));    
        // si l'utilisateur est connecté, va vérifier s'il existe un téléchargement pour cet utilisateur
        // cherche l'utilisateur
        $user = $this->getUser();
        //cherche le nom de l'utilisateur
        $username = $user->getUsername();
        // va chercher le dernier téléchargement (un seul, trié par ordre décroissant, donc le plus récent) et en extrait le champ date
        $lastDownload = $dr->findOneBy(
            ['username' => $username],
            ['date' => 'DESC']
        );
        // vérifie si un téléchargement passé a été trouvé
        if (!is_null(($lastDownload ))) {
            // convertit en string puis en secondes
            $lastDownload = strtotime($lastDownload->getDate()->format('Y-m-d H:i:s')); 
            // calcule la différence entre la date (et l'heure) d'aujourd'hui et le dernier téléchargement
            $timeSinceLastDownload = $datenow - $lastDownload;
            // conversion d'une semaine en secondes :
            $week = 3600 *24*7;
            // conversion d'un mois de 30 jours en secondes :
            $month = 3600 * 24 * 30;
            // attribution du temps interdit avant le prochain téléchargement par rôle, 7 jours pour DECOUVERTE et 30 pour STANDARD
            if ((TRUE === $authChecker->isGranted('ROLE_BIBLIVORE')) ) {
                $restrictedTime = 0;  //dump("admin ou biblivore ");
            } else if (TRUE === $authChecker->isGranted('ROLE_STANDARD')) {
                $restrictedTime = $week; //dump("standard ");
            } else if (TRUE === $authChecker->isGranted('ROLE_DECOUVERTE')) {
                $restrictedTime = $month; //dump("découverte ");
            }
            // compare le temps écoulé depuis le dernier téléchargement. 
            $timeRemaining = $restrictedTime - $timeSinceLastDownload;
            //Si le temps de restriction n'est pas fini, redirige vers la page upgrade en lui passant en paramètre le temps restant 
            //avant qu'il puisse de nouveau télécharger.
            if ($timeSinceLastDownload < $restrictedTime) {
                $timeRemaining = $restrictedTime - $timeSinceLastDownload;
                return $this->redirectToRoute('upgrade', ['timeRemaining' => $timeRemaining]);
            } 
        }   
        // si le téléchargement n'existe pas et s'il n'y a pas de temps de restriction, autorise le téléchargement
        $download = new Download();
        // assigne les propriétés pour inscrire le téléchargement en db
        $download->setUsername($username);
        $download->setEbook($ebook);
        $download->setDate(new \DateTime());
        // ajoute un au compteur de téléchargements
        $ebook->setActiveReaders($ebook->getActiveReaders() + 1);
        // appelle l'entity manager
        $em = $this->getDoctrine()->getManager();
        // prépare les données à être enregistrées
        $em->persist($download);
        $em->persist($ebook);
        // enregistre
        $em->flush();
        
        // définit le chemin du téléchargement basé sur 'download_dir' défini dans config/services.yaml
        $filePath = $this->getParameter('download_dir'). '/'.$request->request->get('fileName');
        return $this->file($filePath);  
    } // ferme la fonction download
    
    /**
     * @Route("/contact", name="contact")
     */
    public function contact(Request $request, \Swift_Mailer $mailer)
    {
        // crée un formulaire de la classe ContactType
        $form = $this->createForm(ContactType::class);
        // occupe toi de la requête
        $form->handleRequest($request);
        //si le formulaire a été soumis et est valide 
        if ($form->isSubmitted() && $form->isValid()) {
            // stocke les données reçues du formulaire dans une variable
            $contactFormData = $form->getData();
            //envoie un email
            $message = (new \Swift_Message('from the Kindle Contact Form: ' . $contactFormData['name'] .' '. $contactFormData['email']))
            // adresse de l'expéditeur
            ->setFrom($contactFormData['email'])
            // adresse du destinataire
            ->setTo('raphaelpinel8@gmail.com')
            // corps du message
            ->setBody(
                $contactFormData['message'],
                'text/html'
                );
                // ordonne de l'envoyer
            $mailer->send($message);
            // flash message pour prévenir l'utilisateur de l'envoi réussi
            $this->addFlash('success', 'Votre email a été envoyé avec succès. Nous allons vous répondre rapidement');
            // redirige vers la page d'accueil
            return $this->redirectToRoute('home', [
                'contactform' => $form->createView(),
            ]);
            
        }
        // si le formulaire n'est pas soumis, crée le rendu du formulaire avec le template twig
        // et passe la variable contactform
        return $this->render('contactform.html.twig', [
            'contactform' => $form->createView(),
        ]);
    }
}

