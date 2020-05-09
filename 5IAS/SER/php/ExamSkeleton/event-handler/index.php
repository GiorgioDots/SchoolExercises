<?php
  include('./mysql/index.php');

class EventHandler {
    private $db;
    private $errorDivOpen = '<div class="alert alert-danger alert-dismissible fade show" role="alert">';
    private $successDivOpen = '<div class="alert alert-success alert-dismissible fade show" role="alert">';
    private $closeAlertButton = '
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>';
      private $divClose = '</div>';

    public function __construct(){
      $this->db = new MySQLDriver('./config.json');
    }

    public function onCreateTables(){
      try{
        $message = $this->db->createTables();
        echo $this->successDivOpen;
        echo $message;
        echo $this->closeAlertButton;
        echo $this->divClose;
      }catch(Exception $error){
        echo $this->errorDivOpen;
        echo $error->getMessage();
        echo $this->divClose;
      }
    }
  }
?>