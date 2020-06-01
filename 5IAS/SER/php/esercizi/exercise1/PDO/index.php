<?php
  require(__DIR__.'/shared/header.php');
?>

<form action="/" method="POST">
  <div class="container pt-3">
    <div class="row">
      <div class="col">
        <div class="form-group">
          <label for="action">Seleziona l'operazione</label>
          <select name="action" class="form-control" onchange="onChangeOp(value)">
            <option value=""></option>
            <option value="inserisci">Inserisci prodotto</option>
            <option value="visualizza">Visualizza prodotti</option>
            <option value="elimina">Elimina prodotto</option>
            <option value="aggiornaPrezzo">Aggiorna prezzo prodotto</option>
            <option value="prodottiPrezzoTra">Restringi per prezzo (tra X e Y)</option>
            <option value="quantitaMin10">Visualizza prodotti con quantita min di 10</option>
            <option value="prezzoPerReparto">Visualizza valore complessivo dei prodotti per reparto</option>
            <option value="aumentaQuantita">Aumenta la quantita di un prodotto</option>
          </select>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col">
        <div id="inserisci"></div>
        <div id="visualizza"></div>
        <div id="elimina"></div>
        <div id="aggiornaPrezzo"></div>
        <div id="prodottiPrezzoTra"></div>
        <div id="quantitaMin10"></div>
        <div id="prezzoPerReparto"></div>
        <div id="aumentaQuantita"></div>
        <div id="submitBtn"></div>
      </div>
    </div>
  </div>
</form>
<div class="container">
  <div class="row">
    <div class="col" id="result">
      <?php 
        if(sizeof($_POST) > 0){
          require(__DIR__.'/utils/index.php');
          $utils = new Utils();
          $utils->doAction($_POST);
        }
      ?>
    </div>
  </div>
</div>
<script src="./js/main.js"></script>

<?php 
  require(__DIR__.'/shared/footer.php');
?>