<html>

<head>
    <title>Session Counter</title>
</head>

<body>
    <%
        Integer counter = (Integer)session.getAttribute("counter");
        if( counter == null || counter == 0 ) {
            out.println("Welcome to my website!");
            counter = 1;
        } 
        else {
            out.println("Welcome back to my website!");
            out.println("Total number of visits: "+counter);
            counter++;
        }
        session.setAttribute("counter", counter);
    %>
</body>

</html>