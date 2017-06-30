<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Project;
use AppBundle\Entity\Workspace;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Response;

class WorkspaceController extends Controller
{
    /**
     * @Route("/workspace/{name}", name="workspace_show")
     * @param $name
     * @return Response
     */
    public function showAction($name)
    {
        // find the workspace id from the given name
        $repo = $this->getDoctrine()->getRepository(Workspace::class);
        $workspace = $repo->findOneBy(['name' => $name]);
        $workspaceId = $workspace->getId();

        // find all projects which have the given workspace id
        $repo = $this->getDoctrine()->getRepository(Project::class);
        $projects = $repo->findBy(['workspace' => $workspaceId]);

        if ($projects == null) {
            throw $this->createNotFoundException('Not found!');
        }

        return $this->render('workspace/show.html.twig', ['projects' => $projects]);
    }
}
