/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package coodinzcore;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.swing.JTextArea;

/**
 *
 * @author FUNAPOYO_SISTEMAS
 */
public class SConnection {

    /**
     *
     * @return
     */
    public Connection getConnection(JTextArea lbl) {
        Connection con = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  // load the driver
            // line below needs to be modified to include the database name, user, and password (if any)
            con = DriverManager.getConnection("jdbc:sqlserver://localhost:51270;databaseName=synlight","coodinzcore","cooDin2018");

            System.out.println("Connected to database !");

        } catch (SQLException sqle) {
            lbl.setText("Sql Exception :" + sqle.getMessage());
        } catch (ClassNotFoundException e) {
            lbl.setText("Class Not Found Exception :" + e.getMessage());
        }
        return con;
    }

}
