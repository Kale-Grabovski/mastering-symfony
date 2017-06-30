<?php

namespace AppBundle\DataFixtures\ORM;

use AppBundle\Entity\Workspace;
use Doctrine\Common\DataFixtures\OrderedFixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\AbstractFixture;

class LoadWorkspaces extends AbstractFixture implements OrderedFixtureInterface
{
    /**
     * Load data fixtures with the passed EntityManager
     *
     * @param ObjectManager $manager
     */
    public function load(ObjectManager $manager)
    {
        $workspace1 = new Workspace();
        $workspace1->setName('Writing');
        $workspace1->setDescription('info for writing Workspace');
        $manager->persist($workspace1);

        $manager->flush();

        $this->addReference('workspace-writing', $workspace1);
    }

    public function getOrder()
    {
        return 10;
    }
}
