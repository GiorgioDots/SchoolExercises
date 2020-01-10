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
    $role = $_POST['role'];

    $sql = "SELECT * FROM users";

    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            if($nickname == $row["nickname"]){
                die("Nickname already exists");
            }
        }
    }

    $sql = "INSERT INTO users (nickname, password, role) VALUES ('$nickname', '$password', '$role')";

    if (!mysqli_query($conn,$sql)) {
        die("Error: " . $sql . "<br>" . $conn->error);
    }
    
    $id = $conn->insert_id;

    $_SESSION["id"] = $id;
    $_SESSION["role"] = $role;

    $conn->close();
    ob_start();
    header('Location: dizionario.php');
    ob_end_flush();
    die();
?>