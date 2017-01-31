package demo;

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JTabbedPane;
import javax.swing.JPanel;
import javax.swing.JButton;
import java.awt.BorderLayout;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JSplitPane;
import javax.swing.BoxLayout;
import java.awt.FlowLayout;

public class GUI_Politicians extends JFrame {

	DatabaseConnection con = new DatabaseConnection();
	private JFrame frame;
	private JTable table;
	private JTable table_1;
	private JTable table_2;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUI_Politicians window = new GUI_Politicians();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}
	
	public static void close(){
		
	}

	/**
	 * Create the application.
	 */
	public GUI_Politicians() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 450, 300);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);
		tabbedPane.setBounds(10, 11, 414, 240);
		frame.getContentPane().add(tabbedPane);
		
		JPanel politicians_tab = new JPanel();
		tabbedPane.addTab("Politicians", null, politicians_tab, null);
		politicians_tab.setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setBounds(10, 11, 118, 190);
		panel.setLayout(null);
		politicians_tab.add(panel);
		
		JButton button = new JButton("Search");
		button.setBounds(10, 22, 89, 23);
		panel.add(button);
		
		JButton button_1 = new JButton("Add");
		button_1.setBounds(10, 67, 89, 23);
		panel.add(button_1);
		
		JButton button_2 = new JButton("Remove");
		button_2.setBounds(10, 114, 89, 23);
		panel.add(button_2);
		
		JButton button_3 = new JButton("Update");
		button_3.setBounds(10, 160, 89, 23);
		panel.add(button_3);
		
		JPanel panel_1 = new JPanel();
		panel_1.setBounds(138, 0, 270, 212);
		politicians_tab.add(panel_1);
		panel_1.setLayout(new BorderLayout(0, 0));
		
		table = new JTable();
		panel_1.add(table, BorderLayout.CENTER);
		
		JPanel bills_tab = new JPanel();
		tabbedPane.addTab("Bills", null, bills_tab, null);
		bills_tab.setLayout(null);
		
		JPanel panel_2 = new JPanel();
		panel_2.setLayout(null);
		panel_2.setBounds(10, 11, 118, 190);
		bills_tab.add(panel_2);
		
		JButton button_4 = new JButton("Search");
		button_4.setBounds(10, 22, 89, 23);
		panel_2.add(button_4);
		
		JButton button_5 = new JButton("Add");
		button_5.setBounds(10, 67, 89, 23);
		panel_2.add(button_5);
		
		JButton button_6 = new JButton("Remove");
		button_6.setBounds(10, 114, 89, 23);
		panel_2.add(button_6);
		
		JButton button_7 = new JButton("Update");
		button_7.setBounds(10, 160, 89, 23);
		panel_2.add(button_7);
		
		JPanel panel_3 = new JPanel();
		panel_3.setBounds(138, 11, 261, 190);
		bills_tab.add(panel_3);
		panel_3.setLayout(new BorderLayout(0, 0));
		
		table_1 = new JTable();
		panel_3.add(table_1, BorderLayout.CENTER);
		
		JPanel assembly_tab = new JPanel();
		tabbedPane.addTab("General Assembly", null, assembly_tab, null);
		assembly_tab.setLayout(null);
		
		JPanel panel_4 = new JPanel();
		panel_4.setLayout(null);
		panel_4.setBounds(10, 11, 118, 190);
		assembly_tab.add(panel_4);
		
		JButton button_8 = new JButton("Search");
		button_8.setBounds(10, 22, 89, 23);
		panel_4.add(button_8);
		
		JButton button_9 = new JButton("Add");
		button_9.setBounds(10, 67, 89, 23);
		panel_4.add(button_9);
		
		JButton button_10 = new JButton("Remove");
		button_10.setBounds(10, 114, 89, 23);
		panel_4.add(button_10);
		
		JButton button_11 = new JButton("Update");
		button_11.setBounds(10, 160, 89, 23);
		panel_4.add(button_11);
		
		JPanel panel_5 = new JPanel();
		panel_5.setBounds(139, 11, 260, 190);
		assembly_tab.add(panel_5);
		panel_5.setLayout(new BorderLayout(0, 0));
		
		table_2 = new JTable();
		panel_5.add(table_2, BorderLayout.CENTER);
	}
}
