package demo;

import java.util.Vector;

import javax.swing.table.AbstractTableModel;
import javax.swing.table.DefaultTableModel;

public class MyTableModel extends DefaultTableModel {

    public MyTableModel(Vector<Object> data, Vector<Object> columnNames) {
		super(data, columnNames);
	}

	public boolean isCellEditable(int row, int column){  
        return false;  
    }

}
