<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of BaseTest
 *
 * @author my
 */
class BaseTest extends PHPUnit_Framework_TestCase {

    /**
     * @var \RemoteWebDriver
     */
    protected $webDriver;

    public function setUp() {
        $capabilities = array(\WebDriverCapabilityType::BROWSER_NAME => 'firefox');
        $this->webDriver = RemoteWebDriver::create('http:www.google.com', $capabilities);
    }

    public function tearDown() {
        $this->webDriver->close();
    }

    protected $url = 'http:www.google.com';

    public function testSimple() {
        $this->webDriver->get($this->url);
        // checking that page title contains word 'NetBeans'
        $this->assertContains('sepcuniajc', $this->webDriver->getTitle());
    }

}
