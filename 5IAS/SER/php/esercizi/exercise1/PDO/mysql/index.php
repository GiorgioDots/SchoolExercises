<?php
class MySQL {
  private $connection;
  public function __construct()
  {
    try {
      $this->connection = new PDO("mysql:host=localhost:3306;dbname=exercise1", "root", "");
      $this->connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }catch(PDOException $e){
      throw new Exception("Cannot connect to the database");
    }
  }
  public function query($query) {
    $stmt = $this->connection->prepare($query);
    $stmt->execute();
    $stmt->setFetchMode(PDO::FETCH_ASSOC);
    return $stmt;
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