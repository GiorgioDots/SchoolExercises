import java.util.*;
import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;

public class App extends HttpServlet {

    private static final long serialVersionUID = -3967314453512919811L;

    public static void main(String[] args) throws Exception {
        System.out.println("hi");
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);

        Integer counter = (Integer) session.getAttribute("counter");

        if (counter == null) {
            counter = new Integer(1);
        } else {
            counter = new Integer(counter.intValue() + 1);
        }

        session.setAttribute("counter", counter);

        out.println("<HTML>");
        out.println("<HEAD>");
        out.println("<TITLE>");
        out.println("</TITLE>");
        out.println("</HEAD>");
        out.println("<BODY>");

        out.println("Welcome! You have been here " + counter + " times.<BR>");

        if (session.isNew()) {
            out.println("This is a new session.<BR>");
        } else {
            out.println("This is not a new session.<BR>");
        }
        out.println("Last time accessed: " + new Date(session.getLastAccessedTime()) + "<BR>");
        out.println("</BODY>");
        out.println("</HTML>");
    }

}