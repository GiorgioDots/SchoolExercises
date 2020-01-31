$(function () {
  var sAct = "Create Word";
  $("#action").change(function () {
    sAct = $(this).children("option:selected").val();
    if (sAct == "Get Word" || sAct == "Delete Word") {
      hideMeaning();
    } else {
      showMeaning();
    }
  });
  $("#perfActionButton").click(function () {
    $("#resultArea").css("visibility", "hidden");
    $("#result").empty();
    var word = $("#word").val();
    console.log("Action: " + sAct);
    if (sAct == "Get Word") {
      onGetWord(sAct, word, true);
    }
    if (sAct == "Create Word") {
      onCreateWord(sAct, word);
    }
    if (sAct == "Update Word") {
      onUpdateWord(sAct, word);
    }
    if (sAct == "Delete Word") {
      onDeleteWord(sAct, word);
    }
  });
  $("#closeResult").click(function () {
    $("#resultArea").css("visibility", "hidden");
  })
});

function showMeaning() {
  $("#meaningArea").show();
}

function hideMeaning() {
  $("#meaningArea").hide();
}

function onGetWord(action, word, isUser) {
  return new Promise((resolve, reject) => {
    $.get("action.jsp", { word: word, action: action }, function (data, status) {
      var result = JSON.parse(data);
      if (isUser) {
        if (result.length == 0) {
          $("#result").append(`<h2 class="display-4">Word not found</h2>`);
          $("#resultArea").css("visibility", "visible");
        } else {
          $("#result").append(`<h2 class="display-4">Word: ${word}</h2>`);
          for (var i = 0; i < result.length; i++) {
            $("#result").append(`<p class="lead">Meaning ${i + 1}: ${result[i].meaning}</p>`);
          }
          $("#resultArea").css("visibility", "visible");
        }
        resolve(true);
      } else {
        resolve(result);
      }
    });
  });
}

async function onCreateWord(action, word) {
  var meaning = $("#meaning").val();
  if (meaning == "" || word == "") {
    $("#result").append(`<p class="lead">Please enter the word and the meaning</p>`);
    $("#resultArea").css("visibility", "visible");
    return;
  }
  var isOne = await onGetWord("Get Word", word, false);
  console.log(isOne.length);
  if (isOne.length > 0) {
    $("#result").append(`<p class="lead">Word already exists, please use the option "Update Word" if you want to update the word</p>`);
    $("#resultArea").css("visibility", "visible");
    return;
  }
  var data = await $.get("action.jsp", { word: word, meaning: meaning, action: action });
  var result = JSON.parse(data);
  if (result.length == 0) {
    $("#result").append(`<p class="lead">Word not created, something went wrong</p>`);
    $("#resultArea").css("visibility", "visible");
    return;
  }
  $("#result").append(`<h2 class="display-4">Word Created: ${word}</h2>`);
  for (var i = 0; i < result.length; i++) {
    $("#result").append(`<p class="lead">Meaning ${i + 1}: ${result[i].meaning}</p>`);
  }
  $("#resultArea").css("visibility", "visible");
}

async function onUpdateWord(action, word, meaning) {
  var meaning = $("#meaning").val();
  if (meaning == "" || word == "") {
    $("#result").append(`<p class="lead">Please enter the word and the meaning</p>`);
    $("#resultArea").css("visibility", "visible");
    return;
  }
  var isOne = await onGetWord("Get Word", word, false);
  console.log(isOne.length);
  if (isOne.length == 0) {
    $("#result").append(`<p class="lead">Word doesn't exists</p>`);
    $("#resultArea").css("visibility", "visible");
    return;
  }
  if (isOne.length > 1) {
    $("#result").append(`<p class="lead">Please insert the exact word</p>`);
    $("#resultArea").css("visibility", "visible");
    return;
  }
  var data = await $.get("action.jsp", { word: word, meaning: meaning, action: action });
  var result = JSON.parse(data);
  console.log(result);
  $("#result").append(`<h2 class="display-4">Word Updated: ${word}</h2>`);
  for (var i = 0; i < result.length; i++) {
    $("#result").append(`<p class="lead">Meaning ${i + 1}: ${result[i].meaning}</p>`);
  }
  $("#resultArea").css("visibility", "visible");
}

async function onDeleteWord(action, word) {
  if (word == "") {
    $("#result").append(`<p class="lead">Please enter the word</p>`);
    $("#resultArea").css("visibility", "visible");
    return;
  }
  var isOne = await onGetWord("Get Word", word, false);
  console.log(isOne.length);
  if (isOne.length == 0) {
    $("#result").append(`<p class="lead">Word doesn't exists</p>`);
    $("#resultArea").css("visibility", "visible");
    return;
  }
  if (isOne.length > 1) {
    $("#result").append(`<p class="lead">Please insert the exact word</p>`);
    $("#resultArea").css("visibility", "visible");
    return;
  }
  await $.get("action.jsp", { word: word, action: action });
  $("#result").append(`<h2 class="display-4">Word Deleted: ${word}</h2>`);
  $("#resultArea").css("visibility", "visible");
}