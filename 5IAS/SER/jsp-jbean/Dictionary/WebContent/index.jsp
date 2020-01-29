<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Dizionario</title>
</head>

<body>
	<h2>Get Word: </h2>
	<form action="get-word.jsp" method="GET">
		<input type="text" name="word">
		<input type="submit" value="Submit">
	</form>
	<h2>Create Word: </h2>
	<form action="create-word.jsp" method="GET">
		<input type="text" name="word">
		<input type="text" name="meaning">
		<input type="submit" value="Submit">
	</form>
	<h2>Update Word: </h2>
	<form action="update-word.jsp" method="POST">
		<input type="text" name="word">
		<input type="text" name="meaning">
		<input type="submit" value="Submit">
	</form>
	<h2>Delete Word: </h2>
	<form action="delete-word.jsp" method="POST">
		<input type="text" name="word">
		<input type="submit" value="Submit">
	</form>
</body>

</html>