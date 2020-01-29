<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dizionario</title>
</head>

<body>
    <jsp:useBean id="CreateWord" class="beans.CreateWord" />
    <jsp:useBean id="GetWord" class="beans.GetWord" />
    <h1>Word created:

        <%
            String word = request.getParameter("word");
            String meaning = request.getParameter("meaning");
            out.println(word);
            CreateWord.setMeaning(meaning);
            CreateWord.setWord(word);
            GetWord.setWord(word);
        %>
    </h1>
    <h2>
        Meaning:
        <i>
            <jsp:getProperty name="GetWord" property="word" />
        </i>
    </h2>

</body>

</html>