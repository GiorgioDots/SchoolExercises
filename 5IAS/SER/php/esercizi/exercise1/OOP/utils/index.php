<?php 
  require('./mysql/index.php');
  class Utils {
    private $mysql;

    public function __construct()
    {
      $this->mysql = new MySQL();
      $this->mysql->createTable();
    }

    public function doAction(){
      $action = $_POST['action'];
      switch ($action){
        case "inserisci":
          $this->onInserisci();
          break;
        case "visualizza":
          $this->onVisualizza();
          break;  
        case "elimina":
          $this->onElimina();
          break;
        case "aggiornaPrezzo":
          $this->onAggiornaPrezzo();
          break;
        case "prodottiPrezzoTra":
          $this->onShowBetween();
          break;
        case "quantitaMin10":
          $this->onShowQuantitaMin10();
          break;
        case "prezzoPerReparto":
          $this->onShowPrezzoPerReparto();
          break;
        case "aumentaQuantita":
          $this->onAumentaQuantita();
          break;
      }
    }

    private function onInserisci() {
      $query = "INSERT INTO Prodotti (descrizione, reparto, prezzo, quantita) VALUES ('{$_POST['descrizione']}','{$_POST['reparto']}','{$_POST['prezzo']}','{$_POST['quantita']}')";
      try{
        $this->mysql->query($query);
        $this->showSuccess("Dati inseriti correttamente");
      }catch(Exception $e){
        $this->showError($e->getMessage());
      }
    }

    private function onVisualizza(){
      $query = "SELECT * FROM prodotti";
      try{
        $data = $this->mysql->query($query);
        $this->showTable($data);
      }catch(Exception $e){
        $this->showError($e->getMessage());
      }
    }

    private function onElimina(){
      $query = "DELETE FROM prodotti WHERE id = {$_POST['id']}";
      try{
        $this->mysql->query($query);
        $this->showSuccess("Dati eliminati correttamente");
      }catch(Exception $e){
        $this->showError($e->getMessage());
      }
    }

    private function onAggiornaPrezzo(){
      $query = "UPDATE prodotti SET prezzo={$_POST['prezzo']} WHERE id={$_POST['id']}";
      try{
        $this->mysql->query($query);
        $this->showSuccess("Dati aggiornati correttamente");
      }catch(Exception $e){
        $this->showError($e->getMessage());
      }
    }

    private function onShowBetween(){
      $query = "SELECT * FROM Prodotti WHERE prezzo < {$_POST['y']} AND prezzo > {$_POST['x']}";
      try{
        $data = $this->mysql->query($query);
        if(!$data){
          throw new Exception("No data");
        }
        $this->showTable($data);
      }catch(Exception $e){
        $this->showError($e->getMessage());
      }
    }

    private function onShowQuantitaMin10(){
      $query = "SELECT * FROM Prodotti WHERE quantita < 10";
      try{
        $data = $this->mysql->query($query);
        if(!$data){
          throw new Exception("No data");
        }
        $this->showTable($data);
      }catch(Exception $e){
        $this->showError($e->getMessage());
      }
    }

    private function onShowPrezzoPerReparto(){
      $query = "SELECT reparto, SUM(prezzo*quantita) AS totPrezzo  FROM Prodotti GROUP BY reparto";
      try{
        $data = $this->mysql->query($query);
        if(!$data){
          throw new Exception("No data");
        }
        $this->showTable($data);
      }catch(Exception $e){
        $this->showError($e->getMessage());
      }
    }

    private function onAumentaQuantita(){
      $query = "SELECT * FROM Prodotti WHERE id = {$_POST['id']}";
      try{
        $data = $this->mysql->query($query);
        if(!$data){
          throw new Exception("Prodotto non trovato");
        }
        $quantita = $data[0]['quantita'] + $_POST['quantita'];
        $query = "UPDATE prodotti SET quantita=$quantita WHERE id={$_POST['id']}";
        $this->mysql->query($query);
        $this->showSuccess('Dati aggiornati correttamente');
      }catch(Exception $e){
        $this->showError($e->getMessage());
      }
    }

    private function showTable($data){
      $row1 = $data[0];
      $cols = array();
      echo "<table class='table table-striped table-bordered table-responsive-sm'>";
      echo "<thead>";
      echo "<tr>";
      foreach ($row1 as $col => $value) {
        echo "<th scope='col'>$col</th>";
        array_push($cols, $col);
      }
      echo "</tr>";
      echo "</thead>";
      echo "<tbody>";
      foreach ($data as $row) {
        echo "<tr>";
        foreach ($cols as $col) {
          echo "<td>{$row[$col]}</td>";
        }
        echo "</tr>";
      }
      echo "</tbody>";
      echo "</table>";
    }

    private function showSuccess($message){
      echo "<div class='alert alert-success'>$message</div>";
    }

    private function showError($message){
      echo "<div class='alert alert-danger'>$message</div>";
    }
  }
?>