<?php

namespace App\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        // constructing the form // on construit le formulaire
        // it is important to specify the action because the controller is called with a render(controller) without any route // il est important de spécifier l'action car on appelle le controller avec un render(controller) sans route
        // each field has its own type. By default fields are of TextType. // chaque champ a son type. Par défaut, les champs sont en TextType.
        $builder
            ->setAction('/contact')
            ->add('name')
            ->add('email', EmailType::class)
            ->add('message', TextareaType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        // configuration options, here by default // options de configuration, ici par défaut
        $resolver->setDefaults([
        ]);
    }
}
