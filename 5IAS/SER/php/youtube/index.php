<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Results</title>
</head>
<body style="background-color: #e3e3e3;">
    <div class="container">
        <nav class="navbar navbar-dark bg-dark justify-content-between">
        <a class="navbar-brand" href="/">GioTube</a>
            <form class="form-inline" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" name="search" aria-label="Search">
                <button class="btn btn-outline-danger my-2 my-sm-0" type="submit">Search</button>
            </form>
        </nav>
    </div>
    <div class="container p-3">
        <?php
            error_reporting(0);
            $curl = curl_init();
            curl_setopt($curl, CURLOPT_SSL_VERIFYHOST, false);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
            $apiKey = "AIzaSyCwyrBAEVgkkz_t1n93BGYis3WkwgbyM3c";
            if(!$_GET['search']){
                $url = "https://www.googleapis.com/youtube/v3/videos?part=snippet%2CcontentDetails%2Cstatistics&chart=mostPopular&maxResults=11&regionCode=IT&key=$apiKey";
                curl_setopt($curl, CURLOPT_URL, $url);
                $result = json_decode(curl_exec($curl), true);
                if(curl_error($curl)){
                    echo(curl_error($curl));
                }
                curl_close($curl);
                $counter = 1;
                $htmlRes = '<div class="row">';
                foreach($result["items"] as $obj){
                    if($counter%3==0){
                        $htmlRes .= '</div><br><div class="row">';
                    }
                    $htmlRes .= '<div class="col"><div class="card" style="background-color:#f7f7f7;" ><div class="card-body"><div class="embed-responsive embed-responsive-16by9"><iframe class="embed-responsive-item" src="https://www.youtube.com/embed/'.$obj["id"].'?rel=0" allowfullscreen></iframe></div></div></div></div>';
                    $counter++;
                }
                echo $htmlRes;
            }else{
                $search = $_GET['search'];
                $url = "https://www.googleapis.com/youtube/v3/search?key=$apiKey&part=snippet&maxResults=17&q=$search";
                curl_setopt($curl, CURLOPT_URL, $url);
                $result = json_decode(curl_exec($curl), true);
                if(curl_error($curl)){
                    echo(curl_error($curl));
                }
                curl_close($curl);
                $counter = 1;
                $htmlRes = '<div class="row">';
                foreach($result["items"] as $obj){
                    if($obj["id"]["videoId"]){
                        if($counter%3==0){
                            $htmlRes .= '</div><br><div class="row">';
                        }
                        $id = $obj["id"]["videoId"];
                        $htmlRes .= "<div class='col'><div class='card' style='background-color:#f7f7f7;'><div class='card-body'><div class='embed-responsive embed-responsive-16by9'><iframe class='embed-responsive-item' src='https://www.youtube.com/embed/$id' allowfullscreen></iframe></div></div></div></div>";
                        $counter++;
                    }
                }
                echo $htmlRes;
            }
            
        ?>
    </div>
</body>
</html>