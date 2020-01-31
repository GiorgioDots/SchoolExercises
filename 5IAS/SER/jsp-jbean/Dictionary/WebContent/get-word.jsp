<jsp:useBean id="GetWord" class="beans.GetWord" />
<%
    String word = request.getParameter("word");
    GetWord.setWord(word);
%>
<jsp:getProperty name="GetWord" property="word" />