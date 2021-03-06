<?php
class MySQLDriver
{
  private $connection;
  private $nations;
  private $names;
  private $surnames;
  private $films;
  private $cities;

  public function __construct($configPath)
  {
    $jConfig = file_get_contents($configPath);
    $config = json_decode($jConfig, true);
    $jUtils = file_get_contents('./utils.json');
    $utils = json_decode($jUtils, true);
    $jFilms = file_get_contents('./films.json');
    $films = json_decode($jFilms, true);
    $this->connection = new mysqli($config["DB_HOST"], $config["DB_USER"], $config["DB_PASSWORD"], $config["DB_NAME"]);
    $this->nations = $utils["NATIONS"];
    $this->names = $utils["NAMES"];
    $this->surnames = $utils["SURNAMES"];
    $this->cities = $utils["CITIES"];
    $this->films = $films;
  }

  public function createTables()
  {
    $queries = array(
      "
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
    foreach ($queries as $index => $query) {
      try {
        if ($this->connection->query($query) != 1) {
          array_push($errorIndex, $index);
        }
      } catch (Exception $e) {
        array_push($errorIndex, $index);
      }
    }
    if (sizeof($errorIndex) > 0) {
      throw new Exception("Query: " . $queries[$errorIndex[0]] . " - went wrong;");
    }
    return "Tables created!";
  }

  public function populateTables($numRows = 1000)
  {
    $this->populateActors($numRows);
    $this->populateFilm($numRows);
    $this->populateCinema($numRows);
    $this->populateInterprets($numRows);
    $this->populatePlanner($numRows);
  }

  public function executeQuery($query)
  {
    if (!$query) {
      throw new Exception("No query inserted.");
    }
    $result = $this->connection->query($query);
    if (!$result) {
      throw new Exception("No result.");
    }
    if ($result->num_rows == 0) {
      throw new Exception("No result.");
    }
    return $result->fetch_all(MYSQLI_ASSOC);
  }

  private function populateActors($numRows)
  {
    $genders = array('male', 'female'); // Non per offendere altri generi
    $sql = "";
    for ($i = 0; $i < $numRows; $i++) {
      $name = $this->names[array_rand($this->names)];
      $surname = $this->surnames[array_rand($this->surnames)];
      $gender = $genders[array_rand($genders, 1)];
      $birthday = $this->generateRandomDate();
      $nationality = $this->nations[array_rand($this->nations)];
      $sql = "INSERT INTO `actor`(`surname`, `name`, `gender`, `birthday`, `nationality`) VALUES ('$surname', '$name', '$gender', '$birthday', '$nationality');";
      $this->connection->query($sql);
    }
  }

  private function populateFilm($numRows)
  {
    for ($i = 0; $i < $numRows; $i++) {
      $film = $this->films[array_rand($this->films)];
      $title = $film["title"];
      $prodYear = $film["year"];
      $prodPlace = $this->nations[array_rand($this->nations)];
      $dirSurname = $this->surnames[array_rand($this->surnames)];
      $genres = $film["genres"];
      if ($genres) {
        $genre = $genres[0];
      } else {
        $genre = "Adventure";
      }
      $sql = "INSERT INTO `film`(`title`, `production_year`, `production_place`, `director_surname`, `genre`) VALUES ('$title', '$prodYear', '$prodPlace', '$dirSurname', '$genre')";
      $this->connection->query($sql);
    }
  }

  private function populateCinema($numRows)
  {
    for ($i = 0; $i < $numRows; $i++) {
      $name = $this->surnames[array_rand($this->surnames)];
      $seats = rand(50, 300);
      $city = $this->cities[array_rand($this->cities)];
      $sql = "INSERT INTO `cinema`(`name`, `seats`, `city`) VALUES ('$name','$seats','$city')";
      $this->connection->query($sql);
    }
  }

  private function populateInterprets($numRows)
  {
    for ($k = 0; $k < $numRows; $k++) {
      $fetchActorsQuery = "SELECT actor_id FROM actor";
      $actors = $this->connection->query($fetchActorsQuery);
      $max = rand(1, $actors->num_rows);
      for ($i = 0; $i < $max; $i++) {
        $actor = $actors->fetch_assoc();
      }
      $fetchFilmQuery = "SELECT film_id FROM film";
      $films = $this->connection->query($fetchFilmQuery);
      $max = rand(1, $films->num_rows);
      for ($i = 0; $i < $max; $i++) {
        $film = $films->fetch_assoc();
      }
      $name = $this->names[array_rand($this->names)];
      $surname = $this->surnames[array_rand($this->surnames)];
      $sql = "INSERT INTO `interprets`(`actor_id_fk`, `film_id_fk`, `character`) VALUES ({$actor['actor_id']}, {$film['film_id']}, '$name $surname')";
      $this->connection->query($sql);
    }
  }

  private function populatePlanner($numRows)
  {
    for ($k = 0; $k < $numRows; $k++) {
      $fetchCinemasQuery = "SELECT cinema_id FROM cinema";
      $cinemas = $this->connection->query($fetchCinemasQuery);
      $max = rand(1, $cinemas->num_rows);
      for ($i = 0; $i < $max; $i++) {
        $cinema = $cinemas->fetch_assoc();
      }
      $fetchFilmQuery = "SELECT film_id FROM film";
      $films = $this->connection->query($fetchFilmQuery);
      $max = rand(1, $films->num_rows);
      for ($i = 0; $i < $max; $i++) {
        $film = $films->fetch_assoc();
      }
      $takings = rand(1000000, 1000000000);
      $projectionDate = $this->generateRandomDate();
      $sql = "INSERT INTO `planned`(`film_id_fk`, `cinema_id_fk`, `takings`, `projection_date`) VALUES ({$film['film_id']},{$cinema['cinema_id']},$takings, '$projectionDate')";
      $this->connection->query($sql);
    }
  }

  private function generateRandomDate()
  {
    $start = strtotime("01 Jenuary 1940");
    $end = strtotime("22 July 2010");
    $timestamp = mt_rand($start, $end);
    return date("Y-m-d", $timestamp);
  }
}
