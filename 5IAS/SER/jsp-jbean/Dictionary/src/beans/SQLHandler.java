package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class SQLHandler {
    private Connection connect = null;
    private Statement statement = null;
    private ResultSet resultSet = null;

    public SQLHandler() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/dizionario?user=root&password=");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public String selectQuery(String query) {
        try {
            ArrayList<String> result = new ArrayList<String>();
            statement = connect.createStatement();
            resultSet = statement.executeQuery(query);
            while (resultSet.next()) {
                System.out.println(query);
                result.add("{ \"meaning\": \"" + resultSet.getString("meaning") + "\"}");
            }
            return result.toString();
        } catch (Exception e) {
            return e.toString();
        }
    }

    public void updateQuery(String query) {
        try {
            statement = connect.createStatement();
            statement.executeUpdate(query);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}