package beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class SQLHandler {
    private Connection connect = null;
    private Statement statement = null;
    private ResultSet resultSet = null;

    public SQLHandler() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            this.connect = DriverManager
                    .getConnection("jdbc:mysql://remotemysql.com:3306/vU2wjjmkdc?user=vU2wjjmkdc&password=V59wxxba2x");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public String selectQuery(String query) {
        try {
            String result;
            statement = connect.createStatement();
            resultSet = statement.executeQuery(query);
            if (resultSet.next()) {
                result = resultSet.getString("meaning");
            } else {
                result = "Word not found";
            }
            return result;
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