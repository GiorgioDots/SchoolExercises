<?php
    session_start();
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
        integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Dizionario</title>
</head>

<body>  
    <nav class="navbar navbar-light bg-light justify-content-between">
    <a class="navbar-brand">Dizionario Figo</a>
        <form class="form-inline" action="logout.php">
            <button class="btn btn-primary my-2 my-sm-0" type="submit">Logout</button>
        </form>
    </nav>

    <div class="container-fluid h-100">
        <div class="row justify-content-center align-middle h-100">
            <div class="col-10 align-self-center">
                <div class="shadow p-3 mb-5 bg-white rounded">
                    <form action="action.php" method="POST">
                        <div class="form-group">
                            <label for="word">Parola</label>
                            <input class="form-control" type="text" placeholder="Parola" name="word" id="word">
                        </div>
                        <div class="form-group">
                            <label for="option">Seleziona l'operazione da effettuare</label>
                            <select class="form-control" name="option" id="option" onchange="showTextArea()">
                            <?php
                                $role = $_SESSION["role"];
                                if($role == 1){
                                    echo '<option value="get">Cerca parola</option>';
                                    echo '<option value="put">Aggiungi Parola</option>';
                                    echo '<option value="post">Modifica Parola</option>';
                                    echo '<option value="delete">Elimina Parola</option>';
                                }
                                if($role == 2){
                                    echo '<option value="get">Cerca parola</option>';
                                    echo '<option value="put">Aggiungi Parola</option>';
                                    echo '<option value="post">Modifica Parola</option>';
                                }
                                if($role == 3){
                                    echo '<option value="get">Cerca parola</option>';
                                }
                            ?>
                            </select>
                        </div>
                        <div class="form-group" id="meaningArea">
                        </div>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        function showTextArea() {
            var html;
            if (document.getElementById("option").value != "get" && document.getElementById("option").value != "delete") {
                html = `<label for="meaning">Inserisci il significato della parola</label>
                        <textarea class="form-control" id="meaning" rows="3" name="meaning"></textarea>`;
            } else {
                html = "";
            }
            document.getElementById("meaningArea").innerHTML = html;
        }
        function destroyFast(container) {
            const el = document.getElementById(container);
            while (el.firstChild) el.removeChild(el.firstChild);
        };
    </script>
    <!--DON'T TOUCH-->
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
        integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
        integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
        integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
        crossorigin="anonymous"></script>
</body>

</html>