<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Dizionario</title>
</head>

<body>
    <%! String result = ""; %>
    <jsp:useBean id="UpdateWord" class="beans.UpdateWord" />
    <jsp:useBean id="GetWord" class="beans.GetWord" />
    <h1>Word to update:
        <%
            String word = request.getParameter("word");
            String meaning = request.getParameter("meaning");
            out.println(word);
            UpdateWord.setMeaning(meaning);
            UpdateWord.setWord(word);
            GetWord.setWord(word);
        %>
    </h1>
    <h2>
        <%
            result = GetWord.getWord();
            if(result.equals("Word not found")){
        %>
        Word does not exists;
        <%
            }else{
        %>
        New meaning:
        <i>
            <%
                out.println(result);
            %>
        </i>
        <% 
            }
        %>
    </h2>
</body>

</html>