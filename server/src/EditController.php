<?php
namespace app;
use soloproyectos\dom\node\DomNode;
use soloproyectos\db\record\DbRecordTable;
use soloproyectos\text\Text;
use app\BaseController;

class EditController extends BaseController
{
    private $_id = "";
    private $_item = null;
    
    public function __construct()
    {
        parent::__construct();
        
        $this->_id = $this->getParam("id");
        
        $this->on("GET", [$this, "onGet"]);
        $this->on("POST", [$this, "onPost"]);
        $this->apply();
    }
    
    public function onGet()
    {
        $this->_update();
    }
    
    public function onPost()
    {
        $title = $this->getParam("title");
        $description = $this->getParam("description");
        
        $l = new DbRecordTable($this->db, "list");
        if (Text::isEmpty($this->_id)) {
            $l->insert(["title" => $title, "description" => $description]);
        } else {
            $l->update(["title" => $title, "description" => $description], $this->_id);
        }
        
        $this->_update();
    }
    
    public function getDocument()
    {
        return new DomNode(
            "root",
            function ($target) {
                $target->append(new DomNode("id", $this->_item["id"]));
                $target->append(new DomNode("title", $this->_item["title"]));
                $target->append(new DomNode("description", $this->_item["description"]));
            }
        );
    }
    
    private function _update()
    {
        $this->_item = $this->db->query("select id, title, description from list where id = ?", $this->_id);
    }
}
