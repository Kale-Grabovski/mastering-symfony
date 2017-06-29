<?php

class DefaultControllerCest
{
    public function _before(FunctionalTester $I)
    {
    }

    public function _after(FunctionalTester $I)
    {
    }

    // tests
    public function tryToTest(FunctionalTester $I)
    {
    	$I->wantTo('to see the welcome message on the main page');
    	$I->amOnPage('/');
    	$I->see('Welcome');
    }
}
