<?php


class WorkspaceControllerCest
{
    public function _before(FunctionalTester $I)
    {
    }

    public function _after(FunctionalTester $I)
    {
    }

    public function testShowAction(FunctionalTester $I)
    {
        $I->wantTo('too see inside the \"Writing\" workspace');
        $I->amOnPage('/workspace/Writing');
        $I->see('Symfony book');
    }
}
