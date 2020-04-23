package sample;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.AnchorPane;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;


public class Controller {

    @FXML
    public TextField manageStockFoodIDTF, manageStockAmountTF,insertFoodIDTF,balanceEmployeeIDTF,InsertMoneyEmployeeIdTF, InsertMoneyAmountTF,employeePayID;

    @FXML
    public Button banana,pizza,salsa,ice,insertMoneyButton,payFood, checkProductInfoButton, checkBalanceButton, payForFoodButton, manageStockButton,getBalanceButton,InsertMoneyToBalanceButton;

    @FXML
    public Label manageStockLabel, transactionLabel, checkBalanceLabel,InsertMoneyCompleted,totalPaid;

    @FXML
    public TextArea productInfoTA;

    @FXML
    AnchorPane insertMoneyPane, checkProductInfoPane, checkBalancePane, manageStockPane, payForFoodPane;



    // Get product info
    public void getInfo(){


        Products info = new Products();

        int foodID = Integer.parseInt(insertFoodIDTF.getText());


        info.getInfo(foodID,productInfoTA);

    }

    // Set the minimum stock for food
    public void setMinStock() {

        int minStock = Integer.parseInt(manageStockAmountTF.getText());
        int foodID = Integer.parseInt(manageStockFoodIDTF.getText());
        Products stock = new Products();
        stock.setMinStock(minStock,foodID);

        manageStockLabel.setText("Minimum stock allowed is now : " + minStock);


    }

    // Check the balance of an employee
    public void checkBalance(){


        IDCard idCardID = new IDCard(Integer.parseInt(balanceEmployeeIDTF.getText()));


        checkBalanceLabel.setText("Balance:   "+ idCardID.getBalance());


    }

    // Inserts money into an employees balance
    public void insertMoney() {


        IDCard idCardID = new IDCard(Integer.parseInt(InsertMoneyEmployeeIdTF.getText()));

        idCardID.insertMoney(Double.parseDouble(InsertMoneyAmountTF.getText()));
        InsertMoneyCompleted.setText("Confirmed");

    }

    // Add banana price to basket
    public void bananaAdded(){

    Payment addBasket = new Payment();
    addBasket.addToBasket(4,totalPaid);

    addBasket.autoOrder(4);


    }

    // Add pizza price to basket
    public void pizzaAdded(){
        Payment addBasket = new Payment();
        addBasket.addToBasket(3,totalPaid);

        addBasket.autoOrder(3);


    }

    // Add chicken salsa price to basket
    public void chickenSalsaAdded(){

        Payment addBasket = new Payment();
        addBasket.addToBasket(2,totalPaid);

        addBasket.autoOrder(2);

    }

    // Add ice price to basket
    public void iceAdded(){

        Payment addBasket = new Payment();
        addBasket.addToBasket(1,totalPaid);

        addBasket.autoOrder(1);

    }

    // Paying for food
    public void payForFood(){

        Payment payment = new Payment();
        payment.pay(totalPaid,transactionLabel,employeePayID);


    }

    // Switching tabs
    public void insertMoneyVisible() {
        insertMoneyPane.setVisible(true);
        checkProductInfoPane.setVisible(false);
        checkBalancePane.setVisible(false);
        manageStockPane.setVisible(false);
        payForFoodPane.setVisible(false);



    }

    public void checkProductInfoVisible() {
        insertMoneyPane.setVisible(false);
        checkProductInfoPane.setVisible(true);
        checkBalancePane.setVisible(false);
        manageStockPane.setVisible(false);
        payForFoodPane.setVisible(false);
    }

    public void checkBalanceVisible() {
        insertMoneyPane.setVisible(false);
        checkProductInfoPane.setVisible(false);
        checkBalancePane.setVisible(true);
        manageStockPane.setVisible(false);
        payForFoodPane.setVisible(false);
    }

    public void manageStockVisible() {
        insertMoneyPane.setVisible(false);
        checkProductInfoPane.setVisible(false);
        checkBalancePane.setVisible(false);
        manageStockPane.setVisible(true);
        payForFoodPane.setVisible(false);
    }

    public void payForFoodVisible() {
        insertMoneyPane.setVisible(false);
        checkProductInfoPane.setVisible(false);
        checkBalancePane.setVisible(false);
        manageStockPane.setVisible(false);
        payForFoodPane.setVisible(true);

    }


}
