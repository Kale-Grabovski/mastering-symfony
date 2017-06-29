<?php

namespace AppBundle\DataFixtures\ORM;

use AppBundle\Entity\Users;
use Doctrine\Common\DataFixtures\FixtureInterface;
use Doctrine\Common\Persistence\ObjectManager;

class LoadUsers implements FixtureInterface
{
    /**
     * Load data fixtures with the passed EntityManager
     *
     * @param ObjectManager $manager
     */
    public function load(ObjectManager $manager)
    {
        $user1 = new Users();
        $user1->setName('John');
        $user1->setBio('He is a cool guy');
        $user1->setEmail('john@mava.info');
        $manager->persist($user1);

        $user2 = new Users();
        $user2->setName('Jack');
        $user2->setBio('He is a cool guy too');
        $user2->setEmail('jack@mava.info');
        $manager->persist($user2);

        $manager->flush();
    }
}
