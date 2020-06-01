<?php
class MySQL {
  private $connection;
  public function __construct()
  {
    $this->connection = new mysqli("localhost:3306", "root", "", "exercise1");
    if(!$this->connection){
      throw new Exception("Cannot connect to the database");
    }
  }
  public function query($query) {
    $result = $this->connection->query($query);
    if(is_bool($result)){
      return $result;
    }
    if($result && $result->num_rows>0) {
      return $result->fetch_all(MYSQLI_ASSOC);
    }
  }

  public function createTable(){
    $query = 'CREATE TABLE IF NOT EXISTS Prodotti(
      id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
      descrizione TEXT NOT NULL, 
      reparto TEXT NOT NULL, 
      prezzo INT NOT NULL, 
      quantita INT NOT NULL 
    )';
    $this->query($query);
  }
}
?>