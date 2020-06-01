<?php
class MySQL {
  private $connection;
  public function __construct()
  {
    $this->connection = mysqli_connect("localhost:3306", "root", "", "exercise1");
    if(!$this->connection){
      throw new Exception("Cannot connect to the database");
    }
  }
  public function query($query) {
    $result = mysqli_query($this->connection, $query);
    if(is_bool($result)){
      return $result;
    }
    if($result && mysqli_num_rows($result) > 0) {
      return mysqli_fetch_all($result, MYSQLI_ASSOC);
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