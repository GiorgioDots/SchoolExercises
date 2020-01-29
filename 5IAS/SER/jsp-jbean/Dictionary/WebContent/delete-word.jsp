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
    <%! String word = ""; %>
    <jsp:useBean id="DeleteWord" class="beans.DeleteWord" />
    <jsp:useBean id="GetWord" class="beans.GetWord" />
    <h1>Word to delete:
        <%
            word = request.getParameter("word");
            out.println(word);
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
        Word deleted:
        <i>
            <%
                DeleteWord.setWord(word);
                out.println(word);
            %>
        </i>
        <% 
            }
        %>
    </h2>
</body>

</html>