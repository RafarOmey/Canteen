package sample;


import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class IDCard {
    private static Connection con;
    private static String port;
    private static String databaseName;
    private static String userName;
    private static String password;

    static {
        Properties props = new Properties();
        String fileName = "db.properties";
        InputStream input;
        try {
            input = new FileInputStream(fileName);
            props.load(input);
            port = props.getProperty("port", "1433");
            databaseName = props.getProperty("databaseName");
            userName = props.getProperty("userName", "sa");
            password = props.getProperty("password");
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("Database Ready");

        } catch (IOException | ClassNotFoundException e) {
            System.err.println(e.getMessage());
        }
    }


    private int employeeID;
    private double balance;


    public double getBalance() {

        try {
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:" + port + ";databaseName=" + databaseName, userName, password);  // to hide the password in file.
            Statement stmt = con.createStatement();


            ResultSet rs = stmt.executeQuery("SELECT fldBalance FROM tblCard where fldEmployeeID =" + employeeID);

            while (rs.next()) {

                balance = rs.getDouble(1);

            }

            con.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }


        return balance;
    }

    public IDCard(int employeeID) {

        this.employeeID = employeeID;


    }

    public void insertMoney(double insertToBalance) {
        try {
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:" + port + ";databaseName=" + databaseName, userName, password);  // to hide the password in file.
            Statement stmt = con.createStatement();


            stmt.executeUpdate("Update tblCard set fldBalance = fldBalance +" + insertToBalance + " where fldEmployeeID =" + employeeID + "");


            con.close();


        } catch (SQLException e) {
            e.printStackTrace();

        }


    }


}
