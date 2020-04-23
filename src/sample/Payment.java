package sample;

import javafx.scene.control.Label;
import javafx.scene.control.TextField;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class Payment {
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


    public void addToBasket(int foodID, Label label) {
        try {

            con = DriverManager.getConnection("jdbc:sqlserver://localhost:" + port + ";databaseName=" + databaseName, userName, password);  // to hide the password in file.


            Statement state = con.createStatement();

            ResultSet rs = state.executeQuery("SELECT fldSellPrice FROM  tblProducts where fldFoodID = " + foodID + ""); // Statement to get sell price for banana


            while (rs.next()) {
                double totalPrice = Double.parseDouble(label.getText());

                double hello = rs.getDouble(1);

                double total = totalPrice + hello;

                label.setText(String.valueOf(total));

            } //Adding the price to the total price


            // (5) close the connection
            con.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void autoOrder(int foodID) {
        try {
            int minimum = 0;
            int current = 0;
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:" + port + ";databaseName=" + databaseName, userName, password);  // to hide the password in file.

            Statement state2 = con.createStatement();
            Statement minStock = con.createStatement();
            Statement currentStock = con.createStatement();


            ResultSet rs2 = currentStock.executeQuery("select fldCurrentStockLevel from tblProducts where fldFoodID=" + foodID + ""); //Get current stock statement

            while (rs2.next()) {

                current = rs2.getInt(1) - 1;


            }

            ResultSet rs3 = minStock.executeQuery("select fldMinimumStock from tblProducts where fldFoodID=" + foodID + ""); // Statement to get minimum stock

            while (rs3.next()) {

                minimum = rs3.getInt(1);

            }


            if (current < minimum) {
                Statement autoOrder = con.createStatement();

                autoOrder.executeUpdate("update tblProducts set fldCurrentStockLevel=fldCurrentStockLevel+30 where fldFoodID=" + foodID + "");
            } // Auto order when current stock is less than minimum stock

            state2.executeUpdate("UPDATE tblProducts set fldCurrentStockLevel=fldCurrentStockLevel-1 where fldFoodID =" + foodID + ""); // Taking 1 away from current stock

            // (5) close the connection
            con.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    public void pay(Label totalPaid, Label transactionLabel, TextField employeePayID) {
        try {
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:" + port + ";databaseName=" + databaseName, userName, password);  // to hide the password in file.


            Statement state = con.createStatement();

            long millis = System.currentTimeMillis();
            java.sql.Timestamp timestamp = new java.sql.Timestamp(millis);

            String totalPrice = totalPaid.getText();
            int employeeID = Integer.parseInt(employeePayID.getText());

            if (employeeID == 1111 || employeeID == 2222 || employeeID == 3333 || employeeID == 4444 || employeeID == 5555) {
                state.executeUpdate("UPDATE tblCard set fldBalance=fldBalance-" + totalPrice + "where fldEmployeeID=" + employeeID + "");

                transactionLabel.setText("Transaction complete");

                Statement state2 = con.createStatement();
                state2.execute("insert into tblTransaction (fldEmployeeID,fldPrice,fldDate) values (" + employeeID + "," + totalPrice + ",'" + timestamp + "')");


                totalPaid.setText("0");
                employeePayID.setText("");

            } else {
                transactionLabel.setText("EmployeeID not found");
            }

            // (5) close the connection
            con.close();


        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

}
