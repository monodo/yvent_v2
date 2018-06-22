use TeamTNT\TNTSearch\TNTSearch;

$tnt = new TNTSearch;

$tnt->loadConfig([
    'driver'    => 'mysql',
    'host'      => 'localhost',
    'database'  => 'dbname',
    'username'  => 'user',
    'password'  => 'pass',
    'storage'   => '/var/www/tntsearch/examples/'
]);

$indexer = $tnt->createIndex('name.index');
$indexer->query('SELECT id, article FROM articles;');
//$indexer->setLanguage('french');
$indexer->run();