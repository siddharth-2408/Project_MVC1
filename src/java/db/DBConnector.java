package db;

import java.sql.Connection;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author rajes
 */
public class DBConnector 
{
    public static Connection con= null;
    public static Statement st= null;
    static
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver Loaded");
        
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/testdatabase","root","root");
            System.out.println("Connected");
            
            st = con.createStatement();
        }
        catch(ClassNotFoundException | SQLException e)
        {
            System.out.println(e);
        }
    }
    public static Statement getStatement()
    {
        return st;
    }
    public static Connection getConnection()
    {
        return con;
    }
}
