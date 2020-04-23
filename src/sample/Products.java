package sample;

import javafx.fxml.FXML;
import javafx.scene.control.TextArea;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;


public class Products {




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




        public void setMinStock(int minStock,int foodID){
            try {
                con = DriverManager.getConnection("jdbc:sqlserver://localhost:" + port + ";databaseName=" + databaseName, userName, password);  // to hide the password in file.


                Statement state = con.createStatement();


                state.executeUpdate("UPDATE tblProducts SET fldMinimumStock =" + minStock + " WHERE fldFoodID=" + foodID + "");

                // (5) close the connection
                con.close();


            } catch (SQLException e) {
                e.printStackTrace();
            }


        }


        public void getInfo(int foodID,TextArea ta){

            try {
                con = DriverManager.getConnection("jdbc:sqlserver://localhost:" + port + ";databaseName=" + databaseName, userName, password);  // to hide the password in file.


                Statement state = con.createStatement();


                ResultSet rs = state.executeQuery("SELECT * FROM tblProducts INNER JOIN tblSupplier ON tblProducts.fldSupplierCVR = tblSupplier.fldSupplierCVR where fldFoodID=" + foodID +"");


                while(rs.next()){

                    String string1= (rs.getString(1));
                    String string2 = rs.getString(2);
                    String string3 = rs.getString(3);
                    String string4 = rs.getString(4);
                    String string5 = rs.getString(5);
                    String string6 = rs.getString(6);
                    String string7 = rs.getString(7);
                    String string8 = rs.getString(8);
                    String string9 = rs.getString(9);
                    String string10 = rs.getString(10);
                    String string11 = rs.getString(11);

                    // process data field by field
                    ta.setText("fldFoodID= "+string1+"\n"+"fldFoodName= "+string3+"\n"+"fldBuyPrice= "+string4+" kr"+"\n"
                            +"fldSellPrice= "+string5+" kr"+"\n"+"fldCurrentStockLevel= "+string6+"\n"+"fldMinimumStock= "+string7+"\n"+"fldSupplierCVR ="+string8+"\n"+"fldSupplierName= "+string9+"\n"+"fldMail= "+string10+"\n"+"fldPhoneNO= "+string11);
                }

                // (5) close the connection
                con.close();


            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
}