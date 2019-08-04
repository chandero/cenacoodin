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
public class FConnection {
    public Connection getConnection(JTextArea lbl) {
        Connection con = null;
        try {
            Class.forName("org.firebirdsql.jdbc.FBDriver");  // load the driver
            // line below needs to be modified to include the database name, user, and password (if any)
            con = DriverManager.getConnection("jdbc:firebirdsql:localhost/3050:C:/opt/db/database.fdb?sql_dialect=3&lc_ctype=ISO8859_1", "SYSDBA", "masterkey");

            System.out.println("Connected to database !");

        } catch (SQLException sqle) {
            lbl.setText("Sql Exception :" + sqle.getMessage());
        } catch (ClassNotFoundException e) {
            lbl.setText("Class Not Found Exception :" + e.getMessage());
        }
        return con;
    }    
}
