<jsp:useBean id="GetWord" class="beans.GetWord" />
<jsp:useBean id="GetWords" class="beans.GetWord" />
<jsp:useBean id="CreateWord" class="beans.CreateWord" />
<jsp:useBean id="DeleteWord" class="beans.DeleteWord" />
<jsp:useBean id="UpdateWord" class="beans.UpdateWord" />
<%! String action; %>
<%! String word; %>
<%! String meaning; %>

<%
    action = request.getParameter("action");
    word = request.getParameter("word");
    GetWord.setWord(word);
    if(action.equals("Get Word")){
%>
<jsp:getProperty name="GetWord" property="word" />
<%
    }else if(action.equals("Create Word")){
        meaning = request.getParameter("meaning");
        CreateWord.setMeaning(meaning);
        CreateWord.setWord(word);
%>
<jsp:getProperty name="GetWord" property="word" />
<%
    }else if(action.equals("Update Word")){
        meaning = request.getParameter("meaning");
        UpdateWord.setMeaning(meaning);
        UpdateWord.setWord(word);
%>
<jsp:getProperty name="GetWord" property="word" />
<%
    }else if(action.equals("Delete Word")){
        DeleteWord.setWord(word);
    }
%>