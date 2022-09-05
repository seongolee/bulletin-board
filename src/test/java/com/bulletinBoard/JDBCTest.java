package com.bulletinBoard;

import org.apache.ibatis.io.Resources;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.Reader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

import static org.junit.Assert.*;

public class JDBCTest {
    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch(Exception e) {
            e.printStackTrace();
        }
    }

    @Test
    public void testConnection() throws Exception {
        String resource = "db-connection.properties";
        Properties properties = new Properties();

        Reader reader = Resources.getResourceAsReader(resource);
        properties.load(reader);


        try(Connection con =
                    DriverManager.getConnection(
                            properties.getProperty("url"),
                            properties.getProperty("username"),
                            properties.getProperty("password"))){
            System.out.println(con);
        } catch (Exception e) {
            fail(e.getMessage());
        }

    }
}
