<?php 

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends Controller {
    /**
     * @Route("/login", name="login")
     */
    public function login(AuthenticationUtils $authenticationUtils) {
        // stocke une éventuelle erreur
        $error = $authenticationUtils->getLastAuthenticationError();
        
        // définit le dernier nom d'utilisateur utilisé
        $lastUsername = $authenticationUtils->getLastUsername();
        
        // effectue un rendu du template login.html.twig en lui passant des paramètres
        return $this->render('login.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error,
        ]);     
    }
    //Routes pour tester l'accès des différents rôles
    /**
     * @Route("/admin", name="admin")
     */
    public function admin() {
        return new Response('<html><body>Admin page</body></html>');
    }

    /**
     * @Route("/decouverte", name="decouverte")
     */
    public function decouverte() {
        return new Response('<html><body>page réservée à un abonné découverte ou supérieur</body></html>');
    }

    /**
     * @Route("/standard", name="standard")
     */
    public function standard() {
        return new Response('<html><body>page réservée à un abonné standard ou supérieur</body></html>');
    }
    
    /**
     * @Route("/biblivore", name="biblivore")
     */
    public function biblivore() {
        return new Response('<html><body>page réservée à un abonné biblivore ou admin</body></html>');
    }
}
?>