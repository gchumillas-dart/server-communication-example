<?php
namespace app;
use soloproyectos\dom\node\DomNode;
use soloproyectos\db\record\DbRecordTable;
use app\BaseController;

class ListController extends BaseController
{
    private $_items = [];
    
    public function __construct()
    {
        parent::__construct();
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
        $action = $this->getParam("action");
        if ($action == "delete") {
            $id = $this->getParam("id");
            $t = new DbRecordTable($this->db, "list");
            $t->delete($id);
        }
        $this->_update();
    }
    
    public function getDocument()
    {
        return new DomNode(
            "root",
            function ($target) {
                foreach ($this->_items as $item) {
                    $target->append(
                        new DomNode(
                            "item",
                            ["id" => $item["id"], "title" => $item["title"]],
                            $item["description"]
                        )
                    );
                }
            }
        );
    }
    
    private function _update()
    {
        $this->_items = $this->db->query("select id, title, description from list");
    }
}
