var inserisciDiv;
var visualizzaDiv;
var eliminaDiv;
var aggionraPrezzoDiv;
var prodottiPrezzoTraDiv;
var quantitaMin10Div;
var prezzoPerRepartoDiv;
var aumentaQuantitaDiv;
var submitBtnDiv;
var resultDiv;

const btnNode = '<button class="btn btn-primary" type="submit">Esegui</button>';

function onPageLoad() {
  inserisciDiv = document.getElementById("inserisci");
  visualizzaDiv = document.getElementById("visualizza");
  eliminaDiv = document.getElementById("elimina");
  aggionraPrezzoDiv = document.getElementById("aggiornaPrezzo");
  prodottiPrezzoTraDiv = document.getElementById("prodottiPrezzoTra");
  quantitaMin10Div = document.getElementById("quantitaMin10");
  prezzoPerRepartoDiv = document.getElementById("prezzoPerReparto");
  aumentaQuantitaDiv = document.getElementById("aumentaQuantita");
  submitBtnDiv = document.getElementById("submitBtn");
  resultDiv = document.getElementById("result");
}

function onChangeOp(value) {
  resetDiv();
  switch (value) {
    case "inserisci":
      onInserisci();
      break;
    case "visualizza":
      submitBtnDiv.innerHTML = btnNode;
      break;
    case "elimina":
      onElimina();
      break;
    case "aggiornaPrezzo":
      onAggiornaPrezzo();
      break;
    case "prodottiPrezzoTra":
      onProdottiPrezzoTra();
      break;
    case "quantitaMin10":
      submitBtnDiv.innerHTML = btnNode;
      break;
    case "prezzoPerReparto":
      submitBtnDiv.innerHTML = btnNode;
      break;
    case "aumentaQuantita":
      onAumentaQuantita();
      break;
  }
}

function resetDiv() {
  inserisciDiv.innerHTML = "";
  visualizzaDiv.innerHTML = "";
  eliminaDiv.innerHTML = "";
  aggionraPrezzoDiv.innerHTML = "";
  prodottiPrezzoTraDiv.innerHTML = "";
  quantitaMin10Div.innerHTML = "";
  prezzoPerRepartoDiv.innerHTML = "";
  aumentaQuantitaDiv.innerHTML = "";
  submitBtnDiv.innerHTML = "";
  resultDiv.innerHTML = "";
}

function onInserisci() {
  inserisciDiv.innerHTML = `
    <div class="form-group">
      <label for="descrizione">Descrizione</label>
      <input type="text" class="form-control" name="descrizione">
    </div>
    <div class="form-group">
      <label for="reparto">Reparto</label>
      <input type="text" class="form-control" name="reparto">
    </div>
    <div class="form-group">
      <label for="prezzo">Prezzo</label>
      <input type="number" class="form-control" name="prezzo">
    </div>
    <div class="form-group">
      <label for="quantita">Quantita</label>
      <input type="number" class="form-control" name="quantita">
    </div>
  `;
  submitBtnDiv.innerHTML = btnNode;
}

function onElimina() {
  eliminaDiv.innerHTML = `
    <div class="form-group">
      <label for="id">Inserisci l'id del prodotto da eliminare</label>
      <input type="number" name="id" class="form-control">
    </div>
  `;
  submitBtnDiv.innerHTML = btnNode;
}

function onAggiornaPrezzo() {
  aggionraPrezzoDiv.innerHTML = `
    <div class="form-group">
      <label for="id">Inserisci l'id del prodotto da aggiornare</label>
      <input type="number" class="form-control" name="id">
    </div>
    <div class="form-group">
      <label for="prezzo">Inserisci il prezzo aggiornato del prodotto</label>
      <input type="number" class="form-control" name="prezzo">
    </div>
  `;
  submitBtnDiv.innerHTML = btnNode;
}

function onProdottiPrezzoTra() {
  prodottiPrezzoTraDiv.innerHTML = `
    <div class="form-group">
      <label for="x">Prezzo x (x < prezzo < y)</label>
      <input type="number" class="form-control" name="x">
    </div>
    <div class="form-group">
      <label for="y">Prezzo y (x < prezzo < y)</label>
      <input type="number" class="form-control" name="y">
    </div>
  `;
  submitBtnDiv.innerHTML = btnNode;
}

function onAumentaQuantita() {
  aumentaQuantitaDiv.innerHTML = `
    <div class="form-group">
      <label for="id">Inserisci l'id del prodotto da aggiornare</label>
      <input type="number" class="form-control" name="id">
    </div>
    <div class="form-group">
      <label for="quantita">Inserisci la quantita da aggiungere</label>
      <input type="number" class="form-control" name="quantita">
    </div>
  `;
  submitBtnDiv.innerHTML = btnNode;
}
