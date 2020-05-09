function onSelectAction(action) {
  const selectQueryDiv = document.getElementById('selectQueryDiv');
  const insertQueryDiv = document.getElementById('insertQueryDiv');
  selectQueryDiv.innerHTML = '';
  insertQueryDiv.innerHTML = '';
  insertQueryDiv.className = '';
  selectQueryDiv.className = '';
  if (action === 'query') {
    selectQueryDiv.innerHTML = `
      <select class="form-control" name="preselected_query" onchange="onChangeQuery(this.value)">
        <option value="insertOne">Insert One</option>
        <option value="query1">Query 1</option>
        <option value="query2">Query 2</option>
        <option value="query3">Query 3</option>
      </select>
    `;
    insertQueryDiv.innerHTML = `
      <input type="text" class="form-control" name="inserted_query" placeholder="Insert a query">
    `;
    insertQueryDiv.className = 'form-group mr-sm-3';
    selectQueryDiv.className = 'form-group mr-sm-3';
  }
}

function onChangeQuery(action) {
  const insertQueryDiv = document.getElementById('insertQueryDiv');
  switch (action) {
    case 'query1':
      let query1 = 'SELECT * FROM actor';
      insertQueryDiv.innerHTML = `
        <input type="hidden" name="query" value="${query1}">
        <p id="query"><code>${query1}</code></p>
      `;
      break;
    case 'query2':
      let query2 = 'SELECT * FROM cinema';
      insertQueryDiv.innerHTML = `
        <input type="hidden" name="query" value="${query2}">
        <p class="pt-3" id="query"><code>${query2}</code></p>
      `;
      break;
    case 'query3':
      let query3 = 'SELECT * FROM film';
      insertQueryDiv.innerHTML = `
        <input type="hidden" name="query" value="${query3}">
        <p id="query"><code>${query3}</code></p>
      `;
      break;
    default:
      insertQueryDiv.innerHTML = `
        <input type="text" class="form-control" name="query" placeholder="Insert a query">
      `;
  }
}
