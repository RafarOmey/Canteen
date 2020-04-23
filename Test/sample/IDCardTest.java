package sample;

import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class IDCardTest {

    @Test
    public void test(){
        IDCard idCardID = new IDCard(1111);


        // 60 was the current balance of employeeID 1111 when the test was made. It passed.
        assertEquals(60,idCardID.getBalance());
        System.out.println("Current balance= " + idCardID.getBalance() + " Kroner");

    }

}