<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Users;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('default/index.html.twig', [
            'base_dir' => realpath($this->getParameter('kernel.project_dir')).DIRECTORY_SEPARATOR,
        ]);
    }

    /**
     * @Route("/about/{name}", name="about", defaults={"name": null})
     */
    public function aboutAction($name)
    {
        if ($name) {
            $user = $this->getDoctrine()->getRepository(Users::class)->findOneBy(['name' => $name]);
            if (!$user) {
                throw $this->createNotFoundException("No user named $name found!");
            }
        }

        return $this->render('about/index.html.twig', ['user' => $user]);
    }
}
