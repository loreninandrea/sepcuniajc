<?php
defined('BASEPATH') or exit('No direct script access allowed');
require_once APPPATH . 'libraries/composer/autoload.php';
use Doctrine\Common\Annotations\AnnotationRegistry as Doctrine_AnnotationRegistry;
use Doctrine\Common\Cache\ApcCache as Doctrine_ApcCache;
use Doctrine\Common\Cache\ArrayCache as Doctrine_ArrayCache;
use Doctrine\Common\ClassLoader as Doctrine_ClassLoader;
use Doctrine\Common\EventManager as Doctrine_EventManager;
use Doctrine\ORM\Configuration as Doctrine_Configuration;
use Doctrine\ORM\EntityManager as Doctrine_EntityManager;
use Doctrine\ORM\Events as Doctrine_Events;
use Doctrine\ORM\Mapping\Driver\DriverChain as Doctrine_DriverChain;
use Doctrine\ORM\Mapping\Driver\YamlDriver as Doctrine_YamlDriver;
use Doctrine\ORM\Tools\Setup as Doctrine_Setup;
use Doctrine\Plugins\TablePrefix as Doctrine_TablePrefix;
use Gedmo\Timestampable\TimestampableListener as Gedmo_TimestampableListener;
use Gedmo\Translatable\TranslatableListener as Gedmo_TranslatableListener;
use Gedmo\SoftDeleteable\SoftDeleteableListener as Gedmo_SoftDeleteableListener;
use Gedmo\DoctrineExtensions as DoctrineExtensions;
use Doctrine\Common\Annotations\AnnotationReader as Doctrine_AnnotationReader;
use Doctrine\Common\Annotations\CachedReader as Doctrine_CachedReader;
use Doctrine\Common\Persistence\Mapping\Driver\MappingDriverChain as Doctrine_MappingDriverChain;
use Doctrine\ORM\Mapping\Driver\AnnotationDriver as Doctrine_AnnotationDriver;
class Doctrine
{
    // the Doctrine entity manager
    public $em = null;
    protected $namespace;
    public function __construct() {
        $this->namespace = '\\';
        // include our CodeIgniter application's database configuration
        require APPPATH . 'config/database.php';
        // Database connection information
        $connectionOptions = array(
            'driver' => 'pdo_pgsql',
            'user' => $db['default']['username'],
            'password' => $db['default']['password'],
            'host' => $db['default']['hostname'],
            'dbname' => $db['default']['database']
        );
        // Languages information
        require APPPATH . 'config/config.php';

        // include Doctrine's fancy ClassLoader class
        // load the Doctrine classes
        $doctrineClassLoader = new Doctrine_ClassLoader('Doctrine', APPPATH . 'libraries');
        $doctrineClassLoader->register();
        // Don't be alarmed, this is necessary for YAML mapping files
        $symfonyClassLoader = new Doctrine_ClassLoader('Symfony', APPPATH . 'libraries/Doctrine');
        $symfonyClassLoader->register();
        // load the entities
        $entityClassLoader = new Doctrine_ClassLoader($this->namespace, APPPATH . 'models');
        $entityClassLoader->register();
        // load the entities
        $repositoriesClassLoader = new Doctrine_ClassLoader($this->namespace, APPPATH . 'repositories');
        $repositoriesClassLoader->register();
        // load the proxy entities
        $proxyClassLoader = new Doctrine_ClassLoader('Proxy', APPPATH . 'proxies');
        $proxyClassLoader->register();
        // including Gedmo
        Doctrine_AnnotationRegistry::registerFile(
            APPPATH . 'libraries/composer/doctrine/orm/lib/Doctrine/ORM/Mapping/Driver/DoctrineAnnotations.php'
        );
        // set up simple array caching for development mode
        // $cache = new Doctrine_ApcCache;
        $cache = new Doctrine_ArrayCache;
        // set up the configuration
        $config = Doctrine_Setup::createConfiguration(ENVIRONMENT == 'development', APPPATH . 'proxies', $cache);
        // create a driver chain for metadata reading
        $driverChain = new Doctrine_MappingDriverChain();
        // YAML dirver
        $yamlDriver = new Doctrine_YamlDriver(array(
            APPPATH . 'mapping'
        ));
        // Annotations reader
        $annotationReader = new Doctrine_AnnotationReader();
        // Cache reader
        $cachedAnnotationReader = new Doctrine_CachedReader($annotationReader, $cache);
        // Gedmo extensions drivers
        $extensionsDriver = DoctrineExtensions::registerMappingIntoDriverChainORM($driverChain, $cachedAnnotationReader);
        // Annotations driver
        $annotationDriver = new Doctrine_AnnotationDriver(
            $cachedAnnotationReader, // our cached annotation reader
            APPPATH . 'models' // paths to look in
        );
        $driverChain->addDriver($annotationDriver, $this->namespace);
        $driverChain->setDefaultDriver($yamlDriver, $this->namespace);
        $config->setMetadataDriverImpl($driverChain);
        $config->setMetadataCacheImpl($cache);
        $config->setQueryCacheImpl($cache);
        // Setup
        $config->setAutoGenerateProxyClasses(ENVIRONMENT == 'development');
        $config->addCustomStringFunction('MATCH_AGAINST', 'Doctrine\Plugins\MatchAgainstFunction');
        $config->addCustomStringFunction('SOUNDEX', 'Doctrine\Plugins\SoundexFunction');
        $config->addCustomStringFunction('LEAST', 'Doctrine\Plugins\LeastFunction');
        $config->addFilter('soft-deleteable', 'Gedmo\SoftDeleteable\Filter\SoftDeleteableFilter');
        // Logger disable
        $config->setSQLLogger(null);
        // Events manager
        $evm = new Doctrine_EventManager();
        // Prefix handler
       // $tablePrefix = new Doctrine_TablePrefix($db['default']['dbprefix']);
       // $evm->addEventListener(Doctrine_Events::loadClassMetadata, $tablePrefix);
        // Timestampable listener
        $timestampable = new Gedmo_TimestampableListener();
        $evm->addEventSubscriber($timestampable);


        // Soft-Delete listener
        $softdeleteable = new Gedmo_SoftDeleteableListener();
        $evm->addEventSubscriber($softdeleteable);
        // create the EntityManager and store it as a member, for use in our CodeIgniter controllers.
        $this->em = Doctrine_EntityManager::create($connectionOptions, $config, $evm);
        $this->em->getFilters()->enable('soft-deleteable');
    }
}
