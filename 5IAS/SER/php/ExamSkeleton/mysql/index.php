<?php
  class MySQLDriver {
    private $connection;
    private $nations;
    private $names;
    private $surnames;
    
    public function __construct($configPath) {
      $jConfig = file_get_contents($configPath);
      $config = json_decode($jConfig, true);
      $jUtils = file_get_contents('./utils.json');
      $utils = json_decode($jUtils, true);
      $this->connection = new mysqli($config["DB_HOST"],$config["DB_USER"],$config["DB_PASSWORD"],$config["DB_NAME"]);
      $this->nations = $utils["NATIONS"];
      $this->names = $utils["NAMES"];
      $this->surnames = $utils["SURNAMES"];
      $this->populateActors(10);
    }

    public function createTables(){
      $queries = array("
        CREATE TABLE IF NOT EXISTS Actor(
          actor_id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          surname TEXT NOT NULL, 
          name TEXT NOT NULL, 
          gender TEXT NOT NULL, 
          birthday DATE NOT NULL, 
          nationality TEXT NOT NULL
        )
      ",
      "
        CREATE TABLE IF NOT EXISTS Film(
          film_id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          title TEXT NOT NULL, 
          production_year INT, 
          production_place TEXT NOT NULL, 
          director_surname TEXT NOT NULL, 
          genre TEXT
        )
      ",
      "
        CREATE TABLE IF NOT EXISTS Cinema(
          cinema_id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
          name TEXT NOT NULL, 
          seats INT NOT NULL,
          city TEXT NOT NULL
        )
      ",
      "
        CREATE TABLE IF NOT EXISTS Interprets(
          actor_id_fk INT(11) UNSIGNED NOT NULL,
          film_id_fk INT(11) UNSIGNED NOT NULL,
          `character` TEXT NOT NULL,

          PRIMARY KEY(actor_id_fk, film_id_fk),

          FOREIGN KEY (actor_id_fk)
            REFERENCES Actor(actor_id)
            ON UPDATE CASCADE ON DELETE RESTRICT,
          FOREIGN KEY (film_id_fk)
            REFERENCES Film(film_id)
            ON UPDATE CASCADE ON DELETE RESTRICT

        )
      ",
      "
        CREATE TABLE IF NOT EXISTS Planned(
          film_id_fk INT(11) UNSIGNED NOT NULL,
          cinema_id_fk INT(11) UNSIGNED NOT NULL,
          takings INT NOT NULL, 
          projection_date DATE NOT NULL,

          PRIMARY KEY(cinema_id_fk, film_id_fk),

          FOREIGN KEY (film_id_fk)
            REFERENCES Film(film_id)
            ON UPDATE CASCADE ON DELETE RESTRICT,
          FOREIGN KEY (cinema_id_fk)
            REFERENCES Cinema(cinema_id) 
            ON UPDATE CASCADE ON DELETE RESTRICT
        )
      ",
      );
      $errorIndex = array();
      foreach($queries as $index=>$query) {
        try{
          if($this->connection->query($query) != 1) {
            array_push($errorIndex, $index);
          }
        }catch(Exception $e){
          array_push($errorIndex, $index);
        }
      }
      if(sizeof($errorIndex) > 0){
        throw new Exception("Query: ".$queries[$errorIndex[0]]." - went wrong;");
      }
      return "Tables created!";
    }

    public function populateTables($numRows = 1000) {
      $this->populateActors($numRows);
      $this->populateFilm($numRows);
      $this->populateCinema($numRows);
      $this->populateInterprets($numRows);
      $this->populatePlanner($numRows);
    }

    private function populateActors($numRows) {
      $genders = array('male', 'female'); // Non per offendere altri generi
      $sql = "";
      for($i = 0; $i < $numRows; $i++){
        $name = $this->names[array_rand($this->names)];
        $surname = $this->surnames[array_rand($this->surnames)];
        $gender = $genders[array_rand($genders, 1)];
        $birthday = $this->generateRandomDate();
        $nationality = $this->nations[array_rand($this->nations)];
        $sql = "INSERT INTO `actor`(`surname`, `name`, `gender`, `birthday`, `nationality`) VALUES ('$surname', '$name', '$gender', '$birthday', '$nationality');";
        $this->connection->query($sql);
      }
    }

    private function populateFilm($numRows) {

    }

    private function populateCinema($numRows) {

    }

    private function populateInterprets($numRows) {

    }

    private function populatePlanner($numRows) {

    }

    private function generateRandomString($length = 10) {
      $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
      $charactersLength = strlen($characters);
      $randomString = '';
      for ($i = 0; $i < $length; $i++) {
          $randomString .= $characters[rand(0, $charactersLength - 1)];
      }
      return $randomString;
    }
    private function generateRandomDate() {
      $start = strtotime("01 Jenuary 1940");
      $end = strtotime("22 July 2010");
      $timestamp = mt_rand($start, $end);
      return date("Y-m-d", $timestamp);
    }
  }
?> 