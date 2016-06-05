<?php
namespace app;
use soloproyectos\db\DbConnector;
use soloproyectos\http\controller\HttpController;

abstract class BaseController extends HttpController
{
    protected $db;
    
    public function __construct()
    {
        $this->db = new DbConnector(DBNAME, DBUSER, DBPASS, DBHOST, DBCHAR);
    }
    
    abstract public function getDocument();
}
