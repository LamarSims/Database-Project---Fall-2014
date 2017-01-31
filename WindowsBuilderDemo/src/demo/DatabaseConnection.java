package demo;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.Vector;

import javax.swing.table.DefaultTableModel;

public class DatabaseConnection {
	String stuff = "jdbc:oracle:thin:@141.165.201.10:1521:oracle12c";
    String server = "localhost\\Genesis";
    String user = "sa";
    String password = "password";
    String database = "genesis";
    Vector<Object> columnNames = new Vector<Object>();
    Vector<Object> data = new Vector<Object>();
    MyTableModel model;

    public DatabaseConnection(){
    }

    public MyTableModel getTable(String table){
        return query(table);
    }

    public MyTableModel query(String query) {

        // Create a variable for the connection string.
        String connectionUrl = stuff;

        // Declare the JDBC objects.
        Connection connection = null;
        Statement statement = null;
        ResultSet resultSet = null;


        try {
            // Establish the connection.
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(connectionUrl,"student019","password");
            System.out.println("Connection established");
            // Execute a SQL statement that returns some data.
            statement = connection.createStatement();
            resultSet = statement.executeQuery(query);
            ResultSetMetaData md = resultSet.getMetaData();
            int columns = md.getColumnCount();
            //  Get column names
            for (int i = 1; i <= columns; i++)
            {
                columnNames.addElement( md.getColumnName(i) );
            }

            //  Get row data
            while (resultSet.next())
            {
                Vector<Object> row = new Vector<Object>(columns);
                for (int i = 1; i <= columns; i++)
                {
                    row.addElement( resultSet.getObject(i) );
                }
                data.addElement( row );
            }
        //  Create table with database data

            model = new MyTableModel(data, columnNames)
            {
            	@Override
                public Class getColumnClass(int column)
                {
                    for (int row = 0; row < getRowCount(); row++)
                    {
                        Object o = getValueAt(row, column);

                        if (o != null)
                        {
                            return o.getClass();
                        }
                    }

                    return Object.class;
                }
            };
        }

        // Handle any errors that may have occurred.
        catch (Exception e) {
            e.printStackTrace();
        }
        finally {
            if (resultSet != null)
                try { resultSet.close();
                } catch(Exception e) {}
            if (statement != null)
                try { statement.close();
                } catch(Exception e) {}
            if (connection != null)
                try { connection.close();
                } catch(Exception e) {}
        }
		return model;
    }
}