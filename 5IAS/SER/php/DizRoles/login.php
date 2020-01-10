<?php
    session_start();
?>
<?php
    $conn = new mysqli("remotemysql.com:3306","vU2wjjmkdc","V59wxxba2x","vU2wjjmkdc");

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    
    $nickname = $_POST['nickname'];
    $password = $_POST['password'];

    $sql = "SELECT password, id, role FROM users where nickname='$nickname'";

    $result = $conn->query($sql);
    
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            
            if($row["password"] != $password){
                die("Wrong password, <a href='login.html'>return to login</a>");
            }else{
                $id = $row["id"];
                $role = $row["role"];
            }

        }
    }else{
        die("Nickname or password wrong, <a href='login.html'>return to login</a>");
    }
    $_SESSION["id"] = $id;
    $_SESSION["role"] = $role;

    echo $id."\n";
    echo $role;

    $conn->close();
    ob_start();
    header('Location: dizionario.php');
    ob_end_flush();
    die();
?>