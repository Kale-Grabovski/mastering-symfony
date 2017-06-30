<?php

class WorkspaceControllerTest extends \Codeception\Test\Unit
{
    /**
     * @var \UnitTester
     */
    protected $tester;

    protected function _before()
    {
    }

    protected function _after()
    {
    }

    public function testShowAction()
    {
        $this->tester->amOnRoute('workspace_show', ['name' => 'Writing']);
        $this->tester->seeResponseContains('Symfony book');
    }
}
