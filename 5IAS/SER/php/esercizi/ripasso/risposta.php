<?php
  function checkPwd($username, $pass){
    if (($username=='mamma') and ($pass=='ciao')) {
      echo"Password corretta <br> puoi entrare <br><br> $username $pass";
    }
    else {
      echo"Login o Password SBAGLIATA";
    };
  }

  function viewData($nome, $cognome){
    echo"Il tuo nome e': $nome <br>Il tuo cognome e': $cognome";
  }

  /******* Programma principale *******/
  $op=$_POST['op'];
  $nome=$_POST['nome'];
  $cognome=$_POST['cognome'];
  $username=$_POST['username'];
  $pass=$_POST['password'];
  $birthDay = $_POST['birthday'];
  $email = $_POST['email'];

  switch ($op){
    case "dati":
      viewData($nome,$cognome);
      break;
    case "check":
      checkPwd($username,$pass);
      break;
    case "signup":
      $message = "Signed up successfully. Email: ".$email.", Password: ". $pass;
      if($username === "mamma"){
        $message = "Username already in use";
      }
      echo $message;
      break;
    default:
      viewData($nome,$cognome);
      break;
  }
?>
