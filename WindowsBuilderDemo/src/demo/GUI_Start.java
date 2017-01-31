package demo;

import java.awt.EventQueue;

import javax.swing.ButtonGroup;
import javax.swing.JFrame;
import javax.swing.JTabbedPane;
import javax.swing.JPanel;

import java.awt.CardLayout;

import javax.swing.JButton;

import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.ScrollPaneConstants;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import javax.swing.table.TableColumnModel;
import javax.swing.JLabel;

import java.awt.Font;

import javax.swing.JTextField;
import javax.swing.JRadioButton;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.math.BigDecimal;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;

public class GUI_Start implements ActionListener {

	DatabaseConnection conp = new DatabaseConnection();
	DatabaseConnection conb = new DatabaseConnection();
	DatabaseConnection conbv = new DatabaseConnection();
	DatabaseConnection conbg = new DatabaseConnection();
	DatabaseConnection conbc = new DatabaseConnection();
	DatabaseConnection cona = new DatabaseConnection();
	DatabaseConnection conah = new DatabaseConnection();
	DatabaseConnection conas = new DatabaseConnection();
	private CardLayout cl_politician_tab;
	private CardLayout cl_bills_tab;
	private CardLayout cl_assembly_tab;
	private JFrame frame;
	private JTable initp_tbl;
	private JTextField firstnameps_txtf;
	private JTextField lastnameps_txtf;
	private JTextField countyps_txtf;
	private JTextField positionps_txtf;
	private JTextField firstnamepa_txtf;
	private JTextField lastnamepa_txtf;
	private JTextField countypa_txtf;
	private JTextField positionpa_txtf;
	private JTextField firstnamepr_txtf;
	private JTextField lastnamepr_txtf;
	private JTextField countypr_txtf;
	private JTextField positionpr_txtf;
	private JTextField firstnamepu_txtf;
	private JTextField lastnamepu_txtf;
	private JTextField countypu_txtf;
	private JTextField positionpu_txtf;
	private JTextField updatefirstnamepu_txtf;
	private JTextField updatelastnamepu_txtf;
	private JTextField updatecountypu_txtf;
	private JTextField updatepositionpu_txtf;
	private JTable initb_tbl;
	private JTable votesb_tbl;
	private JTextField billidbv_txtf;
	private JTextField sessionsbv_txtf;
	private JTextField housetypebv_txtf;
	private JTextField billidbg_txtf;
	private JTextField sessiontybg_txtf;
	private JTable gsignedbg_tbl;
	private JTextField billidbc_txtf;
	private JTextField sessionstybc_txtf;
	private JTextField housetybc_txtf;
	private JTable cactionbc_tbl;
	private JTextField committeebc_txtf;
	private JTextField billidba_txtf;
	private JTextField firstnameba_txtf;
	private JTextField lastnameba_txtf;
	private JTextField billidbs_txtf;
	private JTextField sessionstybs_txtf;
	private JTextField housetybs_txtf;
	private JTextField namebs_txtf;
	private JTextField sessiontyba_txtf;
	private JTextField housetyba_txtf;
	private JTextField nameba_txtf;
	private JTextField billidbr_txtf;
	private JTextField billnamebr_txtf;
	private JTextField sessiontybu_txtf;
	private JTextField housetybu_txtf;
	private JTextField billnamebu_txtf;
	private JTextField updatesessiontybu_txtf;
	private JTextField updatehousetypebu_txtf;
	private JTextField updatebillnamebu_txtf;
	private JTable houseah_tbl;
	private JTextField committeeah_txtf;
	private JTextField committeeas_txtf;
	private JTable senateas_tbl;
	private JTextField newcommitteeaa_txtf;
	private JTextField committeear_txtf;
	private JTextField committeeau_txtf;
	private JTextField updatecommitteeau_txtf;
	private JButton initbtnp_sbtn;
	private JButton initbtnp_abtn;
	private JButton initbtnp_rbtn;
	private JButton initbtnp_ubtn;
	private JButton searchbtnp_sbtn;
	private JButton searchbtnp_abtn;
	private JButton searchbtnp_rbtn;
	private JButton searchbtnp_ubtn;
	private JButton addbtnp_sbtn;
	private JButton addbtnp_abtn;
	private JButton addbtnp_rbtn;
	private JButton addbtnp_ubtn;
	private JButton removebtnp_sbtn;
	private JButton removebtnp_abtn;
	private JButton removebtnp_rbtn;
	private JButton removebtnp_ubtn;
	private JButton updatebtnp_sbtn;
	private JButton updatebtnp_abtn;
	private JButton updatebtnp_rbtn;
	private JButton updatebtnp_ubtn;
	private JButton initbtnb_vbtn;
	private JButton initbtnb_gsbtn;
	private JButton initbtnb_cabtn;
	private JButton initbtnb_aubtn;
	private JButton initbtnb_sbtn;
	private JButton initbtnb_abtn;
	private JButton initbtnb_rbtn;
	private JButton initbtnb_ubtn;
	private JButton votesbtnb_vbtn;
	private JButton votesbtnb_gsbtn;
	private JButton votesbtnb_cabtn;
	private JButton votesbtnb_aubtn;
	private JButton votesbtnb_sbtn;
	private JButton votesbtnb_abtn;
	private JButton votesbtnb_rbtn;
	private JButton votesbtnb_ubtn;
	private JButton gsignedbtnb_vbtn;
	private JButton gsignedbtnb_gsbtn;
	private JButton gsignedbtnb_cabtn;
	private JButton gsignedbtnb_aubtn;
	private JButton gsignedbtnb_sbtn;
	private JButton gsignedbtnb_abtn;
	private JButton gsignedbtnb_rbtn;
	private JButton gsignedbtnb_ubtn;
	private JButton cactionbtnb_vbtn;
	private JButton cactionbtnb_gsbtn;
	private JButton cactionbtnb_cabtn;
	private JButton cactionbtnb_aubtn;
	private JButton cactionbtnb_sbtn;
	private JButton cactionbtnb_abtn;
	private JButton cactionbtnb_rbtn;
	private JButton cactionbtnb_ubtn;
	private JButton authoredbtnb_vbtn;
	private JButton authoredbtnb_gsbtn;
	private JButton authoredbtnb_cabtn;
	private JButton authoredbtnb_aubtn;
	private JButton authoredbtnb_sbtn;
	private JButton authoredbtnb_abtn;
	private JButton authoredbtnb_rbtn;
	private JButton authoredbtnb_ubtn;
	private JButton searchbtnb_vbtn;
	private JButton searchbtnb_gsbtn;
	private JButton searchbtnb_cabtn;
	private JButton searchbtnb_aubtn;
	private JButton searchbtnb_sbtn;
	private JButton searchbtnb_abtn;
	private JButton searchbtnb_rbtn;
	private JButton searchbtnb_ubtn;
	private JButton addbtnb_vbtn;
	private JButton addbtnb_gsbtn;
	private JButton addbtnb_cabtn;
	private JButton addbtnb_aubtn;
	private JButton addbtnb_sbtn;
	private JButton addbtnb_abtn;
	private JButton addbtnb_rbtn;
	private JButton addbtnb_ubtn;
	private JButton removebtnb_vbtn;
	private JButton removebtnb_gsbtn;
	private JButton removebtnb_cabtn;
	private JButton removebtnb_aubtn;
	private JButton removebtnb_sbtn;
	private JButton removebtnb_abtn;
	private JButton removebtnb_rbtn;
	private JButton removebtnb_ubtn;
	private JButton updatebtnb_vbtn;
	private JButton updatebtnb_gsbtn;
	private JButton updatebtnb_cabtn;
	private JButton updatebtnb_aubtn;
	private JButton updatebtnb_sbtn;
	private JButton updatebtnb_abtn;
	private JButton updatebtnb_rbtn;
	private JButton updatebtnb_ubtn;
	private JButton initbtna_hbtn;
	private JButton initbtna_sebtn;
	private JButton initbtna_abtn;
	private JButton initbtna_rbtn;
	private JButton initbtna_ubtn;
	private JButton housebtna_hbtn;
	private JButton housebtna_sebtn;
	private JButton housebtna_abtn;
	private JButton housebtna_rbtn;
	private JButton housebtna_ubtn;
	private JButton senatebtna_hbtn;
	private JButton senatebtna_sebtn;
	private JButton senatebtna_abtn;
	private JButton senatebtna_rbtn;
	private JButton senatebtna_ubtn;
	private JButton addbtna_hbtn;
	private JButton addbtna_sebtn;
	private JButton addbtna_abtn;
	private JButton addbtna_rbtn;
	private JButton addbtna_ubtn;
	private JButton removebtna_hbtn;
	private JButton removebtna_sebtn;
	private JButton removebtna_abtn;
	private JButton removebtna_rbtn;
	private JButton removebtna_ubtn;
	private JButton updatebtna_hbtn;
	private JButton updatebtna_sebtn;
	private JButton updatebtna_abtn;
	private JButton updatebtna_rbtn;
	private JButton updatebtna_ubtn;
	private JPanel politician_tab;
	private JPanel bills_tab;
	private JPanel assembly_tab;
	private JButton searchbtnp_dabtn;
	private JButton initbtnp_dabtn;
	private JButton addbtnp_dabtn;
	private JButton removebtnp_dabtn;
	private JButton updatebtnp_dabtn;
	private JButton initbtnb_dabtn;
	private JButton votesbtnb_dabtn;
	private JButton gsignedbtnb_dabtn;
	private JButton cactionbtnb_dabtn;
	private JButton authoredbtnb_dabtn;
	private JButton searchbtnb_dabtn;
	private JButton addbtnb_dabtn;
	private JButton removebtnb_dabtn;
	private JButton updatebtnb_dabtn;
	private JScrollPane scrollPaneSearchps;
	private JTable searchps_tbl;
	private JTextField housetybg_txtf;
	private JScrollPane scrollPaneba;
	private JTable authoredba_tbl;
	private JScrollPane scrollPanebs;
	private JTable searchbs_tbl;
	private JButton displaycomas_btn;
	private JRadioButton houseaa_rbtn;
	private JRadioButton senateaa_rbtn;
	private JRadioButton housear_rbtn;
	private JRadioButton senatear_rbtn;
	private JRadioButton houseau_rbtn;
	private JRadioButton senateau_rbtn;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					GUI_Start window = new GUI_Start();
					window.frame.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public GUI_Start() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frame = new JFrame();
		frame.setBounds(100, 100, 742, 417);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.getContentPane().setLayout(null);
		
		JPanel panel = new JPanel();
		panel.setBounds(10, 11, 706, 367);
		frame.getContentPane().add(panel);
		panel.setLayout(null);
		
		JTabbedPane tabbedPane = new JTabbedPane(JTabbedPane.TOP);
		tabbedPane.setBounds(0, 0, 706, 367);
		panel.add(tabbedPane);
		
		cl_politician_tab = new CardLayout();
		politician_tab = new JPanel();
		tabbedPane.addTab("Politicians", null, politician_tab, null);
		politician_tab.setLayout(cl_politician_tab);
		
		JPanel init_p = new JPanel();
		politician_tab.add(init_p, "init_p");
		init_p.setLayout(null);
		
		JPanel initbtnp_p = new JPanel();
		initbtnp_p.setBounds(10, 11, 177, 317);
		init_p.add(initbtnp_p);
		initbtnp_p.setLayout(null);
		
		initbtnp_sbtn = new JButton("Search");
		initbtnp_sbtn.setBounds(40, 59, 89, 23);
		initbtnp_p.add(initbtnp_sbtn);
		
		initbtnp_abtn = new JButton("Add");
		initbtnp_abtn.setBounds(40, 112, 89, 23);
		initbtnp_p.add(initbtnp_abtn);
		
		initbtnp_rbtn = new JButton("Remove");
		initbtnp_rbtn.setBounds(40, 168, 89, 23);
		initbtnp_p.add(initbtnp_rbtn);
		
		initbtnp_ubtn = new JButton("Update");
		initbtnp_ubtn.setBounds(40, 226, 89, 23);
		initbtnp_p.add(initbtnp_ubtn);
		
		initbtnp_dabtn = new JButton("Display All");
		initbtnp_dabtn.setBounds(29, 270, 111, 23);
		initbtnp_p.add(initbtnp_dabtn);
		
		JScrollPane scrollPanep = new JScrollPane();
		scrollPanep.setHorizontalScrollBarPolicy(ScrollPaneConstants.HORIZONTAL_SCROLLBAR_ALWAYS);
		scrollPanep.setBounds(197, 11, 504, 317);
		init_p.add(scrollPanep);
		
		initp_tbl = new JTable(conp.getTable("Select firstName, lastName, CountyName, pName From People Order By PID"));
		scrollPanep.setViewportView(initp_tbl);
		initp_tbl.doLayout();
		initp_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
		TableColumnModel columnModel = initp_tbl.getColumnModel();
		TableColumn colfirstname = columnModel.getColumn(0);
        colfirstname.setPreferredWidth(130);
        TableColumn collastname = columnModel.getColumn(1);
        collastname.setPreferredWidth(150);
        TableColumn colcountyname = columnModel.getColumn(2);
        colcountyname.setPreferredWidth(150);
        TableColumn colpname = columnModel.getColumn(3);
        colpname.setPreferredWidth(250);
		
		
		JPanel searchpol_p = new JPanel();
		politician_tab.add(searchpol_p, "searchpol_p");
		searchpol_p.setLayout(null);
		
		JPanel searchbtnp_p = new JPanel();
		searchbtnp_p.setBounds(10, 11, 145, 317);
		searchbtnp_p.setLayout(null);
		searchpol_p.add(searchbtnp_p);
		
		searchbtnp_sbtn = new JButton("Search");
		searchbtnp_sbtn.setBounds(40, 59, 89, 23);
		searchbtnp_p.add(searchbtnp_sbtn);
		
		searchbtnp_abtn = new JButton("Add");
		searchbtnp_abtn.setBounds(40, 112, 89, 23);
		searchbtnp_p.add(searchbtnp_abtn);
		
		searchbtnp_rbtn = new JButton("Remove");
		searchbtnp_rbtn.setBounds(40, 168, 89, 23);
		searchbtnp_p.add(searchbtnp_rbtn);
		
		searchbtnp_ubtn = new JButton("Update");
		searchbtnp_ubtn.setBounds(40, 226, 89, 23);
		searchbtnp_p.add(searchbtnp_ubtn);
		
		searchbtnp_dabtn = new JButton("Display All");
		searchbtnp_dabtn.setBounds(29, 272, 104, 23);
		searchbtnp_p.add(searchbtnp_dabtn);
		
		JPanel searchfieldp_p = new JPanel();
		searchfieldp_p.setBounds(165, 11, 276, 317);
		searchpol_p.add(searchfieldp_p);
		searchfieldp_p.setLayout(null);
		
		JLabel firstnameps_lbl = new JLabel("First name");
		firstnameps_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		firstnameps_lbl.setBounds(10, 61, 64, 23);
		searchfieldp_p.add(firstnameps_lbl);
		
		JLabel lastnameps_lbl = new JLabel("Last Name");
		lastnameps_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lastnameps_lbl.setBounds(10, 111, 76, 23);
		searchfieldp_p.add(lastnameps_lbl);
		
		JLabel countyps_lbl = new JLabel("County");
		countyps_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		countyps_lbl.setBounds(10, 162, 46, 23);
		searchfieldp_p.add(countyps_lbl);
		
		JLabel positionps_lbl = new JLabel("Position");
		positionps_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		positionps_lbl.setBounds(10, 211, 64, 23);
		searchfieldp_p.add(positionps_lbl);
		
		JButton searchfieldps_btn = new JButton("Search");
		searchfieldps_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				String firstNameInput = firstnameps_txtf.getText();
				String lastNameInput = lastnameps_txtf.getText();
				String countyInput = countyps_txtf.getText();
				String positionInput = positionps_txtf.getText();
				
				//check for apostraphes
				for (int i = 0; i < firstNameInput.length(); i ++){
					if (firstNameInput.charAt(i) == 39 || firstNameInput.charAt(i) == 8217 || firstNameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(firstNameInput);
						strb = strb.replace(i, i+1, "''");
						firstNameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < lastNameInput.length(); i ++){
					if (lastNameInput.charAt(i) == 39 || lastNameInput.charAt(i) == 8217 || lastNameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(lastNameInput);
						strb = strb.replace(i, i+1, "''");
						lastNameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < countyInput.length(); i ++){
					if (countyInput.charAt(i) == 39 || countyInput.charAt(i) == 8217 || countyInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(countyInput);
						strb = strb.replace(i, i+1, "''");
						countyInput = strb.toString();
						i++;
					}
				}
				
				if (firstNameInput.equals("") && lastNameInput.equals("") && countyInput.equals("") && positionInput.equals("")){
					
				}else if (!firstNameInput.equals("") && lastNameInput.equals("") && countyInput.equals("") && positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where firstName = '" + firstNameInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
			        searchps_tbl.repaint();
				}else if (firstNameInput.equals("") && !lastNameInput.equals("") && countyInput.equals("") && positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where lastName = '" + lastNameInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (!firstNameInput.equals("") && !lastNameInput.equals("") && countyInput.equals("") && positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where firstName = '" + firstNameInput + "' AND lastName = '" + lastNameInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (firstNameInput.equals("") && lastNameInput.equals("") && !countyInput.equals("") && positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where CountyName = '" + countyInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (!firstNameInput.equals("") && lastNameInput.equals("") && !countyInput.equals("") && positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where firstName = '" + firstNameInput + "' AND CountyName = '" + countyInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (firstNameInput.equals("") && !lastNameInput.equals("") && !countyInput.equals("") && positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where lastName = '" + lastNameInput + "' AND CountyName = '" + countyInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (!firstNameInput.equals("") && !lastNameInput.equals("") && !countyInput.equals("") && positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where firstName = '" + firstNameInput + "' AND lastName = '" + lastNameInput + "' AND CountyName = '" + countyInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (firstNameInput.equals("") && lastNameInput.equals("") && countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where pName = '" + positionInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (!firstNameInput.equals("") && lastNameInput.equals("") && countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where firstName = '" + firstNameInput + "' AND pName = '" + positionInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (firstNameInput.equals("") && !lastNameInput.equals("") && countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where lastName = '" + lastNameInput + "' AND pName = '" + positionInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (!firstNameInput.equals("") && !lastNameInput.equals("") && countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where firstName = '" + firstNameInput + "' AND lastName = '" + lastNameInput + "' AND pName = '" + positionInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (firstNameInput.equals("") && lastNameInput.equals("") && !countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where CountyName = '" + countyInput + "' AND pName = '" + positionInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (!firstNameInput.equals("") && lastNameInput.equals("") && !countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where firstName = '" + firstNameInput + "' AND CountyName = '" + countyInput + "' AND pName = '" + positionInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (firstNameInput.equals("") && !lastNameInput.equals("") && !countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where lastName = '" + lastNameInput + "' AND CountyName = '" + countyInput + "' AND pName = '" + positionInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}else if (!firstNameInput.equals("") && !lastNameInput.equals("") && !countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchps_tbl.setModel(newCon.getTable("Select * From People Where firstName = '" + firstNameInput + "' AND lastName = '" + lastNameInput + "' AND CountyName = '" + countyInput + "' AND pName = '" + positionInput + "'"));
					searchps_tbl.doLayout();
					searchps_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModel = searchps_tbl.getColumnModel();
					TableColumn colbillid = columnModel.getColumn(0);
			        colbillid.setPreferredWidth(50);
					TableColumn colfirstname = columnModel.getColumn(1);
			        colfirstname.setPreferredWidth(130);
			        TableColumn collastname = columnModel.getColumn(2);
			        collastname.setPreferredWidth(150);
			        TableColumn colcountyname = columnModel.getColumn(3);
			        colcountyname.setPreferredWidth(150);
			        TableColumn colpname = columnModel.getColumn(4);
			        colpname.setPreferredWidth(250);
				}
			}
		});
		searchfieldps_btn.setBounds(59, 270, 89, 23);
		searchfieldp_p.add(searchfieldps_btn);
		
		firstnameps_txtf = new JTextField();
		firstnameps_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		firstnameps_txtf.setBounds(128, 58, 138, 30);
		searchfieldp_p.add(firstnameps_txtf);
		firstnameps_txtf.setColumns(10);
		
		lastnameps_txtf = new JTextField();
		lastnameps_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lastnameps_txtf.setBounds(128, 108, 138, 30);
		searchfieldp_p.add(lastnameps_txtf);
		lastnameps_txtf.setColumns(10);
		
		countyps_txtf = new JTextField();
		countyps_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		countyps_txtf.setBounds(128, 159, 138, 30);
		searchfieldp_p.add(countyps_txtf);
		countyps_txtf.setColumns(10);
		
		positionps_txtf = new JTextField();
		positionps_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		positionps_txtf.setBounds(128, 208, 138, 30);
		searchfieldp_p.add(positionps_txtf);
		positionps_txtf.setColumns(10);
		
		scrollPaneSearchps = new JScrollPane();
		scrollPaneSearchps.setBounds(451, 11, 240, 317);
		searchpol_p.add(scrollPaneSearchps);
		
		searchps_tbl = new JTable();
		scrollPaneSearchps.setViewportView(searchps_tbl);
		
		JPanel add_p = new JPanel();
		politician_tab.add(add_p, "add_p");
		add_p.setLayout(null);
		
		JPanel addbtnp_p = new JPanel();
		addbtnp_p.setBounds(10, 11, 151, 317);
		addbtnp_p.setLayout(null);
		add_p.add(addbtnp_p);
		
		addbtnp_sbtn = new JButton("Search");
		addbtnp_sbtn.setBounds(28, 59, 89, 23);
		addbtnp_p.add(addbtnp_sbtn);
		
		addbtnp_abtn = new JButton("Add");
		addbtnp_abtn.setBounds(28, 113, 89, 23);
		addbtnp_p.add(addbtnp_abtn);
		
		addbtnp_rbtn = new JButton("Remove");
		addbtnp_rbtn.setBounds(28, 168, 89, 23);
		addbtnp_p.add(addbtnp_rbtn);
		
		addbtnp_ubtn = new JButton("Update");
		addbtnp_ubtn.setBounds(28, 224, 89, 23);
		addbtnp_p.add(addbtnp_ubtn);
		
		addbtnp_dabtn = new JButton("Dsiplay All");
		addbtnp_dabtn.setBounds(22, 283, 105, 23);
		addbtnp_p.add(addbtnp_dabtn);
		
		JPanel addfieldp_p = new JPanel();
		addfieldp_p.setBounds(171, 11, 520, 317);
		add_p.add(addfieldp_p);
		addfieldp_p.setLayout(null);
		
		JLabel requiredpa_lbl = new JLabel("*: Required fields");
		requiredpa_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		requiredpa_lbl.setBounds(213, 33, 114, 24);
		addfieldp_p.add(requiredpa_lbl);
		
		JLabel fristnamepa_lbl = new JLabel("* First name");
		fristnamepa_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		fristnamepa_lbl.setBounds(89, 91, 89, 24);
		addfieldp_p.add(fristnamepa_lbl);
		
		JLabel lastnamepa_lbl = new JLabel("* Last name");
		lastnamepa_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lastnamepa_lbl.setBounds(89, 142, 89, 24);
		addfieldp_p.add(lastnamepa_lbl);
		
		JLabel countypa_lbl = new JLabel("County");
		countypa_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		countypa_lbl.setBounds(89, 195, 46, 24);
		addfieldp_p.add(countypa_lbl);
		
		JLabel positionpa_lbl = new JLabel("* Position");
		positionpa_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		positionpa_lbl.setBounds(89, 244, 72, 24);
		addfieldp_p.add(positionpa_lbl);
		
		JButton addfieldpa_btn = new JButton("Add");
		addfieldpa_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				String firstNameInput = firstnamepa_txtf.getText();
				String lastNameInput = lastnamepa_txtf.getText();
				String countyInput = countypa_txtf.getText();
				String positionInput = positionpa_txtf.getText();
				
				//check for apostraphes
				for (int i = 0; i < firstNameInput.length(); i ++){
					if (firstNameInput.charAt(i) == 39 || firstNameInput.charAt(i) == 8217 || firstNameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(firstNameInput);
						strb = strb.replace(i, i+1, "''");
						firstNameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < lastNameInput.length(); i ++){
					if (lastNameInput.charAt(i) == 39 || lastNameInput.charAt(i) == 8217 || lastNameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(lastNameInput);
						strb = strb.replace(i, i+1, "''");
						lastNameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < countyInput.length(); i ++){
					if (countyInput.charAt(i) == 39 || countyInput.charAt(i) == 8217 || countyInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(countyInput);
						strb = strb.replace(i, i+1, "''");
						countyInput = strb.toString();
						i++;
					}
				}
				
				if (!firstNameInput.equals("") && !lastNameInput.equals("") && countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newConID = new DatabaseConnection();
					DatabaseConnection newConInsert = new DatabaseConnection();
					DefaultTableModel t = newConID.getTable("Select Max(PID) From People");
					BigDecimal id = (BigDecimal) t.getValueAt(0, 0);
					newConInsert.getTable("Insert Into People Values(" + (id.intValueExact() + 1) + ", '" + firstNameInput + "', '" + lastNameInput + "', NULL, '" + positionInput + "')");
				}else if (!firstNameInput.equals("") && !lastNameInput.equals("") && !countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newConID = new DatabaseConnection();
					DatabaseConnection newConInsert = new DatabaseConnection();
					DefaultTableModel t = newConID.getTable("Select Max(PID) From People");
					BigDecimal id = (BigDecimal) t.getValueAt(0, 0);
					newConInsert.getTable("Insert Into People Values(" + (id.intValueExact() + 1) + ", '" + firstNameInput + "', '" + lastNameInput + "', '" + countyInput +"', '" + positionInput + "')");
				}
			}
		});
		addfieldpa_btn.setFont(new Font("Tahoma", Font.PLAIN, 11));
		addfieldpa_btn.setBounds(193, 283, 89, 23);
		addfieldp_p.add(addfieldpa_btn);
		
		firstnamepa_txtf = new JTextField();
		firstnamepa_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		firstnamepa_txtf.setBounds(261, 91, 123, 24);
		addfieldp_p.add(firstnamepa_txtf);
		firstnamepa_txtf.setColumns(10);
		
		lastnamepa_txtf = new JTextField();
		lastnamepa_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lastnamepa_txtf.setBounds(261, 142, 123, 24);
		addfieldp_p.add(lastnamepa_txtf);
		lastnamepa_txtf.setColumns(10);
		
		countypa_txtf = new JTextField();
		countypa_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		countypa_txtf.setBounds(261, 195, 123, 24);
		addfieldp_p.add(countypa_txtf);
		countypa_txtf.setColumns(10);
		
		positionpa_txtf = new JTextField();
		positionpa_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		positionpa_txtf.setBounds(261, 244, 123, 24);
		addfieldp_p.add(positionpa_txtf);
		positionpa_txtf.setColumns(10);
		
		JPanel remove_p = new JPanel();
		politician_tab.add(remove_p, "remove_p");
		remove_p.setLayout(null);
		
		JPanel removebtnp_p = new JPanel();
		removebtnp_p.setBounds(10, 11, 146, 317);
		remove_p.add(removebtnp_p);
		removebtnp_p.setLayout(null);
		
		removebtnp_sbtn = new JButton("Search");
		removebtnp_sbtn.setBounds(40, 59, 89, 23);
		removebtnp_p.add(removebtnp_sbtn);
		
		removebtnp_abtn = new JButton("Add");
		removebtnp_abtn.setBounds(40, 112, 89, 23);
		removebtnp_p.add(removebtnp_abtn);
		
		removebtnp_rbtn = new JButton("Remove");
		removebtnp_rbtn.setBounds(40, 168, 89, 23);
		removebtnp_p.add(removebtnp_rbtn);
		
		removebtnp_ubtn = new JButton("Update");
		removebtnp_ubtn.setBounds(40, 226, 89, 23);
		removebtnp_p.add(removebtnp_ubtn);
		
		removebtnp_dabtn = new JButton("Display All");
		removebtnp_dabtn.setBounds(29, 283, 105, 23);
		removebtnp_p.add(removebtnp_dabtn);
		
		JPanel removefieldp_p = new JPanel();
		removefieldp_p.setLayout(null);
		removefieldp_p.setBounds(171, 11, 520, 317);
		remove_p.add(removefieldp_p);
		
		JLabel requiredpr_lbl = new JLabel("*: Required fields");
		requiredpr_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		requiredpr_lbl.setBounds(213, 33, 114, 24);
		removefieldp_p.add(requiredpr_lbl);
		
		JLabel fristnamepr_lbl = new JLabel("* First name");
		fristnamepr_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		fristnamepr_lbl.setBounds(89, 91, 89, 24);
		removefieldp_p.add(fristnamepr_lbl);
		
		JLabel lastnamepr_lbl = new JLabel("* Last name");
		lastnamepr_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lastnamepr_lbl.setBounds(89, 142, 89, 24);
		removefieldp_p.add(lastnamepr_lbl);
		
		JLabel countypr_lbl = new JLabel("County");
		countypr_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		countypr_lbl.setBounds(89, 195, 46, 24);
		removefieldp_p.add(countypr_lbl);
		
		JLabel positionpr_lbl = new JLabel("* Position");
		positionpr_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		positionpr_lbl.setBounds(89, 244, 72, 24);
		removefieldp_p.add(positionpr_lbl);
		
		JButton removefieldpr_btn = new JButton("Remove");
		removefieldpr_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				String firstNameInput = firstnamepr_txtf.getText();
				String lastNameInput = lastnamepr_txtf.getText();
				String countyInput = countypr_txtf.getText();
				String positionInput = positionpr_txtf.getText();
				
				//check for apostraphes
				for (int i = 0; i < firstNameInput.length(); i ++){
					if (firstNameInput.charAt(i) == 39 || firstNameInput.charAt(i) == 8217 || firstNameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(firstNameInput);
						strb = strb.replace(i, i+1, "''");
						firstNameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < lastNameInput.length(); i ++){
					if (lastNameInput.charAt(i) == 39 || lastNameInput.charAt(i) == 8217 || lastNameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(lastNameInput);
						strb = strb.replace(i, i+1, "''");
						lastNameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < countyInput.length(); i ++){
					if (countyInput.charAt(i) == 39 || countyInput.charAt(i) == 8217 || countyInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(countyInput);
						strb = strb.replace(i, i+1, "''");
						countyInput = strb.toString();
						i++;
					}
				}
				
				if (!firstNameInput.equals("") && !lastNameInput.equals("") && countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Delete From People Where firstName = '" + firstNameInput + "' AND lastName = '" + lastNameInput + "' AND pName = '" + positionInput + "'");
				}else if (!firstNameInput.equals("") && !lastNameInput.equals("") && !countyInput.equals("") && !positionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Delete From People Where firstName = '" + firstNameInput + "' AND lastName = '" + lastNameInput + "' AND CountyName = '" + countyInput + "' AND pName = '" + positionInput + "'");
				}
			}
		});
		removefieldpr_btn.setFont(new Font("Tahoma", Font.PLAIN, 11));
		removefieldpr_btn.setBounds(193, 283, 89, 23);
		removefieldp_p.add(removefieldpr_btn);
		
		firstnamepr_txtf = new JTextField();
		firstnamepr_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		firstnamepr_txtf.setColumns(10);
		firstnamepr_txtf.setBounds(261, 91, 123, 24);
		removefieldp_p.add(firstnamepr_txtf);
		
		lastnamepr_txtf = new JTextField();
		lastnamepr_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lastnamepr_txtf.setColumns(10);
		lastnamepr_txtf.setBounds(261, 142, 123, 24);
		removefieldp_p.add(lastnamepr_txtf);
		
		countypr_txtf = new JTextField();
		countypr_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		countypr_txtf.setColumns(10);
		countypr_txtf.setBounds(261, 195, 123, 24);
		removefieldp_p.add(countypr_txtf);
		
		positionpr_txtf = new JTextField();
		positionpr_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		positionpr_txtf.setColumns(10);
		positionpr_txtf.setBounds(261, 244, 123, 24);
		removefieldp_p.add(positionpr_txtf);
		
		JPanel update_p = new JPanel();
		politician_tab.add(update_p, "update_p");
		update_p.setLayout(null);
		
		JPanel updatebtnp_p = new JPanel();
		updatebtnp_p.setBounds(10, 11, 137, 317);
		updatebtnp_p.setLayout(null);
		update_p.add(updatebtnp_p);
		
		updatebtnp_sbtn = new JButton("Search");
		updatebtnp_sbtn.setBounds(40, 59, 89, 23);
		updatebtnp_p.add(updatebtnp_sbtn);
		
		updatebtnp_abtn = new JButton("Add");
		updatebtnp_abtn.setBounds(40, 112, 89, 23);
		updatebtnp_p.add(updatebtnp_abtn);
		
		updatebtnp_rbtn = new JButton("Remove");
		updatebtnp_rbtn.setBounds(40, 168, 89, 23);
		updatebtnp_p.add(updatebtnp_rbtn);
		
		updatebtnp_ubtn = new JButton("Update");
		updatebtnp_ubtn.setBounds(40, 226, 89, 23);
		updatebtnp_p.add(updatebtnp_ubtn);
		
		updatebtnp_dabtn = new JButton("Display All");
		updatebtnp_dabtn.setBounds(28, 283, 101, 23);
		updatebtnp_p.add(updatebtnp_dabtn);
		
		JPanel updatefieldp_p = new JPanel();
		updatefieldp_p.setLayout(null);
		updatefieldp_p.setBounds(171, 11, 520, 317);
		update_p.add(updatefieldp_p);
		
		JLabel requiredpu_lbl = new JLabel("*: Required fields");
		requiredpu_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		requiredpu_lbl.setBounds(213, 33, 114, 24);
		updatefieldp_p.add(requiredpu_lbl);
		
		JLabel firstnamepu_lbl = new JLabel("* First name");
		firstnamepu_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		firstnamepu_lbl.setBounds(89, 91, 89, 24);
		updatefieldp_p.add(firstnamepu_lbl);
		
		JLabel lastnamepu_lbl = new JLabel("* Last name");
		lastnamepu_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lastnamepu_lbl.setBounds(89, 142, 89, 24);
		updatefieldp_p.add(lastnamepu_lbl);
		
		JLabel countypu_lbl = new JLabel("County");
		countypu_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		countypu_lbl.setBounds(89, 195, 46, 24);
		updatefieldp_p.add(countypu_lbl);
		
		JLabel positionpu_lbl = new JLabel("* Position");
		positionpu_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		positionpu_lbl.setBounds(89, 244, 72, 24);
		updatefieldp_p.add(positionpu_lbl);
		
		JButton updatepu_btn = new JButton("Update");
		updatepu_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String firstNameInput = firstnamepu_txtf.getText();
				String lastNameInput = lastnamepu_txtf.getText();
				String countyInput = countypu_txtf.getText();
				String positionInput = positionpu_txtf.getText();
				String upfirstNameInput = updatefirstnamepu_txtf.getText();
				String uplastNameInput = updatelastnamepu_txtf.getText();
				String upcountyInput = updatecountypu_txtf.getText();
				String uppositionInput = updatepositionpu_txtf.getText();
				
				//check for apostraphes
				for (int i = 0; i < firstNameInput.length(); i ++){
					if (firstNameInput.charAt(i) == 39 || firstNameInput.charAt(i) == 8217 || firstNameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(firstNameInput);
						strb = strb.replace(i, i+1, "''");
						firstNameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < upfirstNameInput.length(); i ++){
					if (upfirstNameInput.charAt(i) == 39 || upfirstNameInput.charAt(i) == 8217 || upfirstNameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(upfirstNameInput);
						strb = strb.replace(i, i+1, "''");
						upfirstNameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < lastNameInput.length(); i ++){
					if (lastNameInput.charAt(i) == 39 || lastNameInput.charAt(i) == 8217 || lastNameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(lastNameInput);
						strb = strb.replace(i, i+1, "''");
						lastNameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < uplastNameInput.length(); i ++){
					if (uplastNameInput.charAt(i) == 39 || uplastNameInput.charAt(i) == 8217 || uplastNameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(uplastNameInput);
						strb = strb.replace(i, i+1, "''");
						uplastNameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < countyInput.length(); i ++){
					if (countyInput.charAt(i) == 39 || countyInput.charAt(i) == 8217 || countyInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(countyInput);
						strb = strb.replace(i, i+1, "''");
						countyInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < upcountyInput.length(); i ++){
					if (upcountyInput.charAt(i) == 39 || upcountyInput.charAt(i) == 8217 || upcountyInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(upcountyInput);
						strb = strb.replace(i, i+1, "''");
						upcountyInput = strb.toString();
						i++;
					}
				}
				
				if (!firstNameInput.equals("") && !lastNameInput.equals("") && countyInput.equals("") && !positionInput.equals("") &&
						!upfirstNameInput.equals("") && !uplastNameInput.equals("") && upcountyInput.equals("") && !uppositionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Update People Set firstName = '" + upfirstNameInput + "', lastName = '" + uplastNameInput + "', pName = '" + uppositionInput +
							"' Where firstName = '" + firstNameInput + "' AND lastName = '" + lastNameInput + "' AND pName = '" + positionInput + "'");
				}else if (!firstNameInput.equals("") && !lastNameInput.equals("") && !countyInput.equals("") && !positionInput.equals("") &&
							!upfirstNameInput.equals("") && !uplastNameInput.equals("") && !upcountyInput.equals("") && !uppositionInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Update People Set firstName = '" + upfirstNameInput + "', lastName = '" + uplastNameInput + "', CountyName = '" + upcountyInput + "', pName = '" + uppositionInput +
							"' Where firstName = '" + firstNameInput + "' AND lastName = '" + lastNameInput + "' AND CountyName = '" + countyInput + "' AND pName = '" + positionInput + "'");
				}
			}
		});
		updatepu_btn.setFont(new Font("Tahoma", Font.PLAIN, 11));
		updatepu_btn.setBounds(193, 283, 89, 23);
		updatefieldp_p.add(updatepu_btn);
		
		firstnamepu_txtf = new JTextField();
		firstnamepu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		firstnamepu_txtf.setColumns(10);
		firstnamepu_txtf.setBounds(213, 92, 123, 24);
		updatefieldp_p.add(firstnamepu_txtf);
		
		lastnamepu_txtf = new JTextField();
		lastnamepu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lastnamepu_txtf.setColumns(10);
		lastnamepu_txtf.setBounds(213, 143, 123, 24);
		updatefieldp_p.add(lastnamepu_txtf);
		
		countypu_txtf = new JTextField();
		countypu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		countypu_txtf.setColumns(10);
		countypu_txtf.setBounds(213, 196, 123, 24);
		updatefieldp_p.add(countypu_txtf);
		
		positionpu_txtf = new JTextField();
		positionpu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		positionpu_txtf.setColumns(10);
		positionpu_txtf.setBounds(213, 245, 123, 24);
		updatefieldp_p.add(positionpu_txtf);
		
		JLabel updatepu_lbl = new JLabel("Update");
		updatepu_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		updatepu_lbl.setBounds(398, 58, 64, 24);
		updatefieldp_p.add(updatepu_lbl);
		
		updatefirstnamepu_txtf = new JTextField();
		updatefirstnamepu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		updatefirstnamepu_txtf.setBounds(368, 91, 123, 24);
		updatefieldp_p.add(updatefirstnamepu_txtf);
		updatefirstnamepu_txtf.setColumns(10);
		
		updatelastnamepu_txtf = new JTextField();
		updatelastnamepu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		updatelastnamepu_txtf.setBounds(368, 142, 123, 24);
		updatefieldp_p.add(updatelastnamepu_txtf);
		updatelastnamepu_txtf.setColumns(10);
		
		updatecountypu_txtf = new JTextField();
		updatecountypu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		updatecountypu_txtf.setBounds(368, 195, 123, 24);
		updatefieldp_p.add(updatecountypu_txtf);
		updatecountypu_txtf.setColumns(10);
		
		updatepositionpu_txtf = new JTextField();
		updatepositionpu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		updatepositionpu_txtf.setBounds(368, 244, 123, 24);
		updatefieldp_p.add(updatepositionpu_txtf);
		updatepositionpu_txtf.setColumns(10);
		
		cl_bills_tab = new CardLayout();
		bills_tab = new JPanel();
		tabbedPane.addTab("Bills", null, bills_tab, null);
		bills_tab.setLayout(cl_bills_tab);
		
		JPanel initbills_p = new JPanel();
		bills_tab.add(initbills_p, "initbills_p");
		initbills_p.setLayout(null);
		
		JPanel initbtnb_p = new JPanel();
		initbtnb_p.setBounds(10, 11, 185, 317);
		initbills_p.add(initbtnb_p);
		initbtnb_p.setLayout(null);
		
		initbtnb_vbtn = new JButton("Votes");
		initbtnb_vbtn.setBounds(40, 25, 89, 23);
		initbtnb_p.add(initbtnb_vbtn);
		
		initbtnb_gsbtn = new JButton("Governor Signed");
		initbtnb_gsbtn.setBounds(21, 59, 135, 23);
		initbtnb_p.add(initbtnb_gsbtn);
		
		initbtnb_cabtn = new JButton("Committee Action");
		initbtnb_cabtn.setBounds(21, 93, 135, 23);
		initbtnb_p.add(initbtnb_cabtn);
		
		initbtnb_aubtn = new JButton("Authored");
		initbtnb_aubtn.setBounds(40, 127, 89, 23);
		initbtnb_p.add(initbtnb_aubtn);
		
		initbtnb_sbtn = new JButton("Search");
		initbtnb_sbtn.setBounds(40, 161, 89, 23);
		initbtnb_p.add(initbtnb_sbtn);
		
		initbtnb_abtn = new JButton("Add");
		initbtnb_abtn.setBounds(40, 195, 89, 23);
		initbtnb_p.add(initbtnb_abtn);
		
		initbtnb_rbtn = new JButton("Remove");
		initbtnb_rbtn.setBounds(40, 229, 89, 23);
		initbtnb_p.add(initbtnb_rbtn);
		
		initbtnb_ubtn = new JButton("Update");
		initbtnb_ubtn.setBounds(40, 263, 89, 23);
		initbtnb_p.add(initbtnb_ubtn);
		
		initbtnb_dabtn = new JButton("Display All");
		initbtnb_dabtn.setBounds(28, 294, 116, 23);
		initbtnb_p.add(initbtnb_dabtn);
		
		JScrollPane scrollPaneb = new JScrollPane();
		scrollPaneb.setBounds(201, 11, 490, 317);
		initbills_p.add(scrollPaneb);
		
		initb_tbl = new JTable(conb.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills Join Sessions On Bills.Session_ID = Sessions.Session_ID Order By SessionsType, HouseType"));
		scrollPaneb.setViewportView(initb_tbl);
		initb_tbl.doLayout();
		initb_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
		TableColumnModel columnModelb = initb_tbl.getColumnModel();
		TableColumn billid = columnModelb.getColumn(0);
		billid.setPreferredWidth(50);
		TableColumn sessionsType = columnModelb.getColumn(1);
        sessionsType.setPreferredWidth(200);
        TableColumn houseType = columnModelb.getColumn(2);
        houseType.setPreferredWidth(200);
        TableColumn nameb = columnModelb.getColumn(3);
        nameb.setPreferredWidth(800);
		
		JPanel votes_p = new JPanel();
		bills_tab.add(votes_p, "votes_p");
		votes_p.setLayout(null);
		
		JPanel votesbtnb_p = new JPanel();
		votesbtnb_p.setLayout(null);
		votesbtnb_p.setBounds(0, 0, 185, 317);
		votes_p.add(votesbtnb_p);
		
		votesbtnb_vbtn = new JButton("Votes");
		votesbtnb_vbtn.setBounds(40, 25, 89, 23);
		votesbtnb_p.add(votesbtnb_vbtn);
		
		votesbtnb_gsbtn = new JButton("Governor Signed");
		votesbtnb_gsbtn.setBounds(21, 59, 135, 23);
		votesbtnb_p.add(votesbtnb_gsbtn);
		
		votesbtnb_cabtn = new JButton("Committee Action");
		votesbtnb_cabtn.setBounds(21, 93, 135, 23);
		votesbtnb_p.add(votesbtnb_cabtn);
		
		votesbtnb_aubtn = new JButton("Authored");
		votesbtnb_aubtn.setBounds(40, 127, 89, 23);
		votesbtnb_p.add(votesbtnb_aubtn);
		
		votesbtnb_sbtn = new JButton("Search");
		votesbtnb_sbtn.setBounds(40, 161, 89, 23);
		votesbtnb_p.add(votesbtnb_sbtn);
		
		votesbtnb_abtn = new JButton("Add");
		votesbtnb_abtn.setBounds(40, 195, 89, 23);
		votesbtnb_p.add(votesbtnb_abtn);
		
		votesbtnb_rbtn = new JButton("Remove");
		votesbtnb_rbtn.setBounds(40, 229, 89, 23);
		votesbtnb_p.add(votesbtnb_rbtn);
		
		votesbtnb_ubtn = new JButton("Update");
		votesbtnb_ubtn.setBounds(40, 263, 89, 23);
		votesbtnb_p.add(votesbtnb_ubtn);
		
		votesbtnb_dabtn = new JButton("Display All");
		votesbtnb_dabtn.setBounds(35, 294, 104, 23);
		votesbtnb_p.add(votesbtnb_dabtn);
		
		JScrollPane scrollPanebv = new JScrollPane();
		scrollPanebv.setBounds(195, 11, 324, 306);
		votes_p.add(scrollPanebv);
		
		votesb_tbl = new JTable(conbv.getTable("Select Bill_ID, SessionsType, HouseType, Yea, Nay, NotVoting, Excused From Votes Join Sessions On Votes.Session_ID = Sessions.Session_ID Order By SessionsType, HouseType"));
		scrollPanebv.setViewportView(votesb_tbl);
		votesb_tbl.doLayout();
		votesb_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
		TableColumnModel columnModelbv = votesb_tbl.getColumnModel();
		TableColumn billidbv = columnModelbv.getColumn(0);
        billidbv.setPreferredWidth(50);
        TableColumn sessiontybv = columnModelbv.getColumn(1);
        sessiontybv.setPreferredWidth(200);
        TableColumn housetybv = columnModelbv.getColumn(2);
        housetybv.setPreferredWidth(200);
        TableColumn yeabv = columnModelbv.getColumn(3);
        yeabv.setPreferredWidth(50);
        TableColumn naybv = columnModelbv.getColumn(4);
        naybv.setPreferredWidth(50);
        TableColumn notvotingbv = columnModelbv.getColumn(5);
        notvotingbv.setPreferredWidth(80);
        TableColumn excusedbv = columnModelbv.getColumn(6);
        excusedbv.setPreferredWidth(80);
		
		JPanel searchvotesb_p = new JPanel();
		searchvotesb_p.setBounds(529, 11, 162, 228);
		votes_p.add(searchvotesb_p);
		searchvotesb_p.setLayout(null);
		
		JLabel billidbv_lbl = new JLabel("Bill ID");
		billidbv_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidbv_lbl.setBounds(10, 11, 46, 23);
		searchvotesb_p.add(billidbv_lbl);
		
		JLabel sessionsbv_lbl = new JLabel("Sessions Type");
		sessionsbv_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessionsbv_lbl.setBounds(10, 66, 97, 23);
		searchvotesb_p.add(sessionsbv_lbl);
		
		JLabel housetypebv_lbl = new JLabel("House Type");
		housetypebv_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetypebv_lbl.setBounds(10, 119, 84, 23);
		searchvotesb_p.add(housetypebv_lbl);
		
		JButton searchbv_btn = new JButton("Search");
		searchbv_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String billidInput = billidbv_txtf.getText();
				String sessionsInput = sessionsbv_txtf.getText();
				String houseTypeInput = housetypebv_txtf.getText();
				
				if (billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("")){
					
				}else if (!billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					votesb_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, Yea, Nay, NotVoting, Excused From Votes "
							+ "Join Sessions On Votes.Session_ID = Sessions.Session_ID Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " Order By SessionsType, HouseType"));
					votesb_tbl.doLayout();
					votesb_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbv = votesb_tbl.getColumnModel();
					TableColumn billidbv = columnModelbv.getColumn(0);
			        billidbv.setPreferredWidth(50);
			        TableColumn sessiontybv = columnModelbv.getColumn(1);
			        sessiontybv.setPreferredWidth(200);
			        TableColumn housetybv = columnModelbv.getColumn(2);
			        housetybv.setPreferredWidth(200);
			        TableColumn yeabv = columnModelbv.getColumn(3);
			        yeabv.setPreferredWidth(50);
			        TableColumn naybv = columnModelbv.getColumn(4);
			        naybv.setPreferredWidth(50);
			        TableColumn notvotingbv = columnModelbv.getColumn(5);
			        notvotingbv.setPreferredWidth(80);
			        TableColumn excusedbv = columnModelbv.getColumn(6);
			        excusedbv.setPreferredWidth(80);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					votesb_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, Yea, Nay, NotVoting, Excused From Votes "
							+ "Join Sessions On Votes.Session_ID = Sessions.Session_ID Where SessionsType = '" + sessionsInput 
							+ "' Order By SessionsType, HouseType"));
					votesb_tbl.doLayout();
					votesb_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbv = votesb_tbl.getColumnModel();
					TableColumn billidbv = columnModelbv.getColumn(0);
			        billidbv.setPreferredWidth(50);
			        TableColumn sessiontybv = columnModelbv.getColumn(1);
			        sessiontybv.setPreferredWidth(200);
			        TableColumn housetybv = columnModelbv.getColumn(2);
			        housetybv.setPreferredWidth(200);
			        TableColumn yeabv = columnModelbv.getColumn(3);
			        yeabv.setPreferredWidth(50);
			        TableColumn naybv = columnModelbv.getColumn(4);
			        naybv.setPreferredWidth(50);
			        TableColumn notvotingbv = columnModelbv.getColumn(5);
			        notvotingbv.setPreferredWidth(80);
			        TableColumn excusedbv = columnModelbv.getColumn(6);
			        excusedbv.setPreferredWidth(80);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					votesb_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, Yea, Nay, NotVoting, Excused From Votes "
							+ "Join Sessions On Votes.Session_ID = Sessions.Session_ID Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND SessionsType = '" + sessionsInput + "' Order By SessionsType, HouseType"));
					votesb_tbl.doLayout();
					votesb_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbv = votesb_tbl.getColumnModel();
					TableColumn billidbv = columnModelbv.getColumn(0);
			        billidbv.setPreferredWidth(50);
			        TableColumn sessiontybv = columnModelbv.getColumn(1);
			        sessiontybv.setPreferredWidth(200);
			        TableColumn housetybv = columnModelbv.getColumn(2);
			        housetybv.setPreferredWidth(200);
			        TableColumn yeabv = columnModelbv.getColumn(3);
			        yeabv.setPreferredWidth(50);
			        TableColumn naybv = columnModelbv.getColumn(4);
			        naybv.setPreferredWidth(50);
			        TableColumn notvotingbv = columnModelbv.getColumn(5);
			        notvotingbv.setPreferredWidth(80);
			        TableColumn excusedbv = columnModelbv.getColumn(6);
			        excusedbv.setPreferredWidth(80);
				}else if (billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					votesb_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, Yea, Nay, NotVoting, Excused From Votes "
							+ "Join Sessions On Votes.Session_ID = Sessions.Session_ID Where HouseType = '" + houseTypeInput 
							+ "' Order By SessionsType, HouseType"));
					votesb_tbl.doLayout();
					votesb_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbv = votesb_tbl.getColumnModel();
					TableColumn billidbv = columnModelbv.getColumn(0);
			        billidbv.setPreferredWidth(50);
			        TableColumn sessiontybv = columnModelbv.getColumn(1);
			        sessiontybv.setPreferredWidth(200);
			        TableColumn housetybv = columnModelbv.getColumn(2);
			        housetybv.setPreferredWidth(200);
			        TableColumn yeabv = columnModelbv.getColumn(3);
			        yeabv.setPreferredWidth(50);
			        TableColumn naybv = columnModelbv.getColumn(4);
			        naybv.setPreferredWidth(50);
			        TableColumn notvotingbv = columnModelbv.getColumn(5);
			        notvotingbv.setPreferredWidth(80);
			        TableColumn excusedbv = columnModelbv.getColumn(6);
			        excusedbv.setPreferredWidth(80);
				}else if (!billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					votesb_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, Yea, Nay, NotVoting, Excused From Votes "
							+ "Join Sessions On Votes.Session_ID = Sessions.Session_ID Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND HouseType = '" + houseTypeInput + "' Order By SessionsType, HouseType"));
					votesb_tbl.doLayout();
					votesb_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbv = votesb_tbl.getColumnModel();
					TableColumn billidbv = columnModelbv.getColumn(0);
			        billidbv.setPreferredWidth(50);
			        TableColumn sessiontybv = columnModelbv.getColumn(1);
			        sessiontybv.setPreferredWidth(200);
			        TableColumn housetybv = columnModelbv.getColumn(2);
			        housetybv.setPreferredWidth(200);
			        TableColumn yeabv = columnModelbv.getColumn(3);
			        yeabv.setPreferredWidth(50);
			        TableColumn naybv = columnModelbv.getColumn(4);
			        naybv.setPreferredWidth(50);
			        TableColumn notvotingbv = columnModelbv.getColumn(5);
			        notvotingbv.setPreferredWidth(80);
			        TableColumn excusedbv = columnModelbv.getColumn(6);
			        excusedbv.setPreferredWidth(80);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					votesb_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, Yea, Nay, NotVoting, Excused From Votes "
							+ "Join Sessions On Votes.Session_ID = Sessions.Session_ID Where SessionsType = '" + sessionsInput 
							+ "' AND HouseType = '" + houseTypeInput + "' Order By SessionsType, HouseType"));
					votesb_tbl.doLayout();
					votesb_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbv = votesb_tbl.getColumnModel();
					TableColumn billidbv = columnModelbv.getColumn(0);
			        billidbv.setPreferredWidth(50);
			        TableColumn sessiontybv = columnModelbv.getColumn(1);
			        sessiontybv.setPreferredWidth(200);
			        TableColumn housetybv = columnModelbv.getColumn(2);
			        housetybv.setPreferredWidth(200);
			        TableColumn yeabv = columnModelbv.getColumn(3);
			        yeabv.setPreferredWidth(50);
			        TableColumn naybv = columnModelbv.getColumn(4);
			        naybv.setPreferredWidth(50);
			        TableColumn notvotingbv = columnModelbv.getColumn(5);
			        notvotingbv.setPreferredWidth(80);
			        TableColumn excusedbv = columnModelbv.getColumn(6);
			        excusedbv.setPreferredWidth(80);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					votesb_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, Yea, Nay, NotVoting, Excused From Votes "
							+ "Join Sessions On Votes.Session_ID = Sessions.Session_ID Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND SessionsType = '" + sessionsInput + "' AND HouseType = '" + houseTypeInput + "' Order By SessionsType, HouseType"));
					votesb_tbl.doLayout();
					votesb_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbv = votesb_tbl.getColumnModel();
					TableColumn billidbv = columnModelbv.getColumn(0);
			        billidbv.setPreferredWidth(50);
			        TableColumn sessiontybv = columnModelbv.getColumn(1);
			        sessiontybv.setPreferredWidth(200);
			        TableColumn housetybv = columnModelbv.getColumn(2);
			        housetybv.setPreferredWidth(200);
			        TableColumn yeabv = columnModelbv.getColumn(3);
			        yeabv.setPreferredWidth(50);
			        TableColumn naybv = columnModelbv.getColumn(4);
			        naybv.setPreferredWidth(50);
			        TableColumn notvotingbv = columnModelbv.getColumn(5);
			        notvotingbv.setPreferredWidth(80);
			        TableColumn excusedbv = columnModelbv.getColumn(6);
			        excusedbv.setPreferredWidth(80);
				}
			}
		});
		searchbv_btn.setBounds(32, 194, 89, 23);
		searchvotesb_p.add(searchbv_btn);
		
		billidbv_txtf = new JTextField();
		billidbv_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidbv_txtf.setBounds(32, 35, 120, 23);
		searchvotesb_p.add(billidbv_txtf);
		billidbv_txtf.setColumns(10);
		
		sessionsbv_txtf = new JTextField();
		sessionsbv_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessionsbv_txtf.setBounds(32, 88, 120, 23);
		searchvotesb_p.add(sessionsbv_txtf);
		sessionsbv_txtf.setColumns(10);
		
		housetypebv_txtf = new JTextField();
		housetypebv_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetypebv_txtf.setBounds(32, 142, 120, 23);
		searchvotesb_p.add(housetypebv_txtf);
		housetypebv_txtf.setColumns(10);
		
		JPanel gsigned_p = new JPanel();
		bills_tab.add(gsigned_p, "gsigned_p");
		gsigned_p.setLayout(null);
		
		JPanel gsignedbtnb_p = new JPanel();
		gsignedbtnb_p.setLayout(null);
		gsignedbtnb_p.setBounds(0, 0, 185, 328);
		gsigned_p.add(gsignedbtnb_p);
		
		gsignedbtnb_vbtn = new JButton("Votes");
		gsignedbtnb_vbtn.setBounds(40, 25, 89, 23);
		gsignedbtnb_p.add(gsignedbtnb_vbtn);
		
		gsignedbtnb_gsbtn = new JButton("Governor Signed");
		gsignedbtnb_gsbtn.setBounds(21, 59, 135, 23);
		gsignedbtnb_p.add(gsignedbtnb_gsbtn);
		
		gsignedbtnb_cabtn = new JButton("Committee Action");
		gsignedbtnb_cabtn.setBounds(21, 93, 135, 23);
		gsignedbtnb_p.add(gsignedbtnb_cabtn);
		
		gsignedbtnb_aubtn = new JButton("Authored");
		gsignedbtnb_aubtn.setBounds(40, 127, 89, 23);
		gsignedbtnb_p.add(gsignedbtnb_aubtn);
		
		gsignedbtnb_sbtn = new JButton("Search");
		gsignedbtnb_sbtn.setBounds(40, 161, 89, 23);
		gsignedbtnb_p.add(gsignedbtnb_sbtn);
		
		gsignedbtnb_abtn = new JButton("Add");
		gsignedbtnb_abtn.setBounds(40, 195, 89, 23);
		gsignedbtnb_p.add(gsignedbtnb_abtn);
		
		gsignedbtnb_rbtn = new JButton("Remove");
		gsignedbtnb_rbtn.setBounds(40, 229, 89, 23);
		gsignedbtnb_p.add(gsignedbtnb_rbtn);
		
		gsignedbtnb_ubtn = new JButton("Update");
		gsignedbtnb_ubtn.setBounds(40, 263, 89, 23);
		gsignedbtnb_p.add(gsignedbtnb_ubtn);
		
		gsignedbtnb_dabtn = new JButton("Display All");
		gsignedbtnb_dabtn.setBounds(39, 292, 103, 23);
		gsignedbtnb_p.add(gsignedbtnb_dabtn);
		
		JScrollPane scrollPanebg = new JScrollPane();
		scrollPanebg.setBounds(195, 11, 324, 306);
		gsigned_p.add(scrollPanebg);
		
		gsignedbg_tbl = new JTable(conbg.getTable("Select Bills.Bill_ID, SessionsType, HouseType, dateSigned From GovernorSigned "
				+ "Join Bills On GovernorSigned.Bill_ID = Bills.Bill_ID Join Sessions On Bills.Session_ID = Sessions.Session_ID Order By dateSigned"));
		scrollPanebg.setViewportView(gsignedbg_tbl);
		gsignedbg_tbl.doLayout();
		gsignedbg_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
		TableColumnModel columnModelbg = gsignedbg_tbl.getColumnModel();
		TableColumn billidbg = columnModelbg.getColumn(0);
        billidbg.setPreferredWidth(50);
        TableColumn sessiontybg = columnModelbg.getColumn(1);
        sessiontybg.setPreferredWidth(200);
        TableColumn housetybg = columnModelbg.getColumn(2);
        housetybg.setPreferredWidth(200);
        TableColumn datebg = columnModelbg.getColumn(3);
        datebg.setPreferredWidth(100);
		
		JPanel searchgsignedbv_p = new JPanel();
		searchgsignedbv_p.setLayout(null);
		searchgsignedbv_p.setBounds(524, 11, 167, 219);
		gsigned_p.add(searchgsignedbv_p);
		
		JLabel billidbg_lbl = new JLabel("Bill ID");
		billidbg_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidbg_lbl.setBounds(10, 11, 46, 23);
		searchgsignedbv_p.add(billidbg_lbl);
		
		JLabel sessiontybg_lbl = new JLabel("Sessions Type");
		sessiontybg_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessiontybg_lbl.setBounds(10, 66, 97, 23);
		searchgsignedbv_p.add(sessiontybg_lbl);
		
		JButton searchbg_btn = new JButton("Search");
		searchbg_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String billidInput = billidbg_txtf.getText();
				String sessionsInput = sessiontybg_txtf.getText();
				String houseTypeInput = housetybg_txtf.getText();
				
				if (billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("")){
					
				}else if (!billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					gsignedbg_tbl.setModel(newCon.getTable("Select Bills.Bill_ID, SessionsType, HouseType, dateSigned From GovernorSigned "
							+ "Join Bills On GovernorSigned.Bill_ID = Bills.Bill_ID Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bills.Bill_ID = " + Integer.parseInt(billidInput) + " Order By dateSigned"));
					gsignedbg_tbl.doLayout();
					gsignedbg_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbg = gsignedbg_tbl.getColumnModel();
					TableColumn billidbg = columnModelbg.getColumn(0);
			        billidbg.setPreferredWidth(50);
			        TableColumn sessiontybg = columnModelbg.getColumn(1);
			        sessiontybg.setPreferredWidth(200);
			        TableColumn housetybg = columnModelbg.getColumn(2);
			        housetybg.setPreferredWidth(200);
			        TableColumn datebg = columnModelbg.getColumn(3);
			        datebg.setPreferredWidth(100);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					gsignedbg_tbl.setModel(newCon.getTable("Select Bills.Bill_ID, SessionsType, HouseType, dateSigned From GovernorSigned "
							+ "Join Bills On GovernorSigned.Bill_ID = Bills.Bill_ID Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where SessionsType = '" + sessionsInput + "' Order By dateSigned"));
					gsignedbg_tbl.doLayout();
					gsignedbg_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbg = gsignedbg_tbl.getColumnModel();
					TableColumn billidbg = columnModelbg.getColumn(0);
			        billidbg.setPreferredWidth(50);
			        TableColumn sessiontybg = columnModelbg.getColumn(1);
			        sessiontybg.setPreferredWidth(200);
			        TableColumn housetybg = columnModelbg.getColumn(2);
			        housetybg.setPreferredWidth(200);
			        TableColumn datebg = columnModelbg.getColumn(3);
			        datebg.setPreferredWidth(100);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					gsignedbg_tbl.setModel(newCon.getTable("Select Bills.Bill_ID, SessionsType, HouseType, dateSigned From GovernorSigned "
							+ "Join Bills On GovernorSigned.Bill_ID = Bills.Bill_ID Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bills.Bill_ID = " + Integer.parseInt(billidInput) + " AND SessionsType = '" + sessionsInput + "' Order By dateSigned"));
					gsignedbg_tbl.doLayout();
					gsignedbg_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbg = gsignedbg_tbl.getColumnModel();
					TableColumn billidbg = columnModelbg.getColumn(0);
			        billidbg.setPreferredWidth(50);
			        TableColumn sessiontybg = columnModelbg.getColumn(1);
			        sessiontybg.setPreferredWidth(200);
			        TableColumn housetybg = columnModelbg.getColumn(2);
			        housetybg.setPreferredWidth(200);
			        TableColumn datebg = columnModelbg.getColumn(3);
			        datebg.setPreferredWidth(100);
				}else if (billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					gsignedbg_tbl.setModel(newCon.getTable("Select Bills.Bill_ID, SessionsType, HouseType, dateSigned From GovernorSigned "
							+ "Join Bills On GovernorSigned.Bill_ID = Bills.Bill_ID Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where HouseType = '" + houseTypeInput + "' Order By dateSigned"));
					gsignedbg_tbl.doLayout();
					gsignedbg_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbg = gsignedbg_tbl.getColumnModel();
					TableColumn billidbg = columnModelbg.getColumn(0);
			        billidbg.setPreferredWidth(50);
			        TableColumn sessiontybg = columnModelbg.getColumn(1);
			        sessiontybg.setPreferredWidth(200);
			        TableColumn housetybg = columnModelbg.getColumn(2);
			        housetybg.setPreferredWidth(200);
			        TableColumn datebg = columnModelbg.getColumn(3);
			        datebg.setPreferredWidth(100);
				}else if (!billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					gsignedbg_tbl.setModel(newCon.getTable("Select Bills.Bill_ID, SessionsType, HouseType, dateSigned From GovernorSigned "
							+ "Join Bills On GovernorSigned.Bill_ID = Bills.Bill_ID Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bills.Bill_ID = " + Integer.parseInt(billidInput) + " AND HouseType = '" + houseTypeInput + "' Order By dateSigned"));
					gsignedbg_tbl.doLayout();
					gsignedbg_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbg = gsignedbg_tbl.getColumnModel();
					TableColumn billidbg = columnModelbg.getColumn(0);
			        billidbg.setPreferredWidth(50);
			        TableColumn sessiontybg = columnModelbg.getColumn(1);
			        sessiontybg.setPreferredWidth(200);
			        TableColumn housetybg = columnModelbg.getColumn(2);
			        housetybg.setPreferredWidth(200);
			        TableColumn datebg = columnModelbg.getColumn(3);
			        datebg.setPreferredWidth(100);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					gsignedbg_tbl.setModel(newCon.getTable("Select Bills.Bill_ID, SessionsType, HouseType, dateSigned From GovernorSigned "
							+ "Join Bills On GovernorSigned.Bill_ID = Bills.Bill_ID Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where SessionsType = '" + sessionsInput + "' AND HouseType = '" + houseTypeInput + "' Order By dateSigned"));
					gsignedbg_tbl.doLayout();
					gsignedbg_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbg = gsignedbg_tbl.getColumnModel();
					TableColumn billidbg = columnModelbg.getColumn(0);
			        billidbg.setPreferredWidth(50);
			        TableColumn sessiontybg = columnModelbg.getColumn(1);
			        sessiontybg.setPreferredWidth(200);
			        TableColumn housetybg = columnModelbg.getColumn(2);
			        housetybg.setPreferredWidth(200);
			        TableColumn datebg = columnModelbg.getColumn(3);
			        datebg.setPreferredWidth(100);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					gsignedbg_tbl.setModel(newCon.getTable("Select Bills.Bill_ID, SessionsType, HouseType, dateSigned From GovernorSigned "
							+ "Join Bills On GovernorSigned.Bill_ID = Bills.Bill_ID Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bills.Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND SessionsType = '" + sessionsInput + "' AND HouseType = '" + houseTypeInput + "' Order By dateSigned"));
					gsignedbg_tbl.doLayout();
					gsignedbg_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbg = gsignedbg_tbl.getColumnModel();
					TableColumn billidbg = columnModelbg.getColumn(0);
			        billidbg.setPreferredWidth(50);
			        TableColumn sessiontybg = columnModelbg.getColumn(1);
			        sessiontybg.setPreferredWidth(200);
			        TableColumn housetybg = columnModelbg.getColumn(2);
			        housetybg.setPreferredWidth(200);
			        TableColumn datebg = columnModelbg.getColumn(3);
			        datebg.setPreferredWidth(100);
				}
			}
		});
		searchbg_btn.setBounds(32, 183, 89, 23);
		searchgsignedbv_p.add(searchbg_btn);
		
		billidbg_txtf = new JTextField();
		billidbg_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidbg_txtf.setColumns(10);
		billidbg_txtf.setBounds(32, 35, 120, 23);
		searchgsignedbv_p.add(billidbg_txtf);
		
		sessiontybg_txtf = new JTextField();
		sessiontybg_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessiontybg_txtf.setColumns(10);
		sessiontybg_txtf.setBounds(32, 88, 120, 23);
		searchgsignedbv_p.add(sessiontybg_txtf);
		
		JLabel housetybg_lbl = new JLabel("House Type");
		housetybg_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetybg_lbl.setBounds(10, 124, 81, 23);
		searchgsignedbv_p.add(housetybg_lbl);
		
		housetybg_txtf = new JTextField();
		housetybg_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetybg_txtf.setBounds(36, 148, 116, 23);
		searchgsignedbv_p.add(housetybg_txtf);
		housetybg_txtf.setColumns(10);
		
		JPanel caction_p = new JPanel();
		bills_tab.add(caction_p, "caction_p");
		caction_p.setLayout(null);
		
		JPanel cactionbtnb_p = new JPanel();
		cactionbtnb_p.setLayout(null);
		cactionbtnb_p.setBounds(0, 0, 185, 317);
		caction_p.add(cactionbtnb_p);
		
		cactionbtnb_vbtn = new JButton("Votes");
		cactionbtnb_vbtn.setBounds(40, 25, 89, 23);
		cactionbtnb_p.add(cactionbtnb_vbtn);
		
		cactionbtnb_gsbtn = new JButton("Governor Signed");
		cactionbtnb_gsbtn.setBounds(21, 59, 135, 23);
		cactionbtnb_p.add(cactionbtnb_gsbtn);
		
		cactionbtnb_cabtn = new JButton("Committee Action");
		cactionbtnb_cabtn.setBounds(21, 93, 135, 23);
		cactionbtnb_p.add(cactionbtnb_cabtn);
		
		cactionbtnb_aubtn = new JButton("Authored");
		cactionbtnb_aubtn.setBounds(40, 127, 89, 23);
		cactionbtnb_p.add(cactionbtnb_aubtn);
		
		cactionbtnb_sbtn = new JButton("Search");
		cactionbtnb_sbtn.setBounds(40, 161, 89, 23);
		cactionbtnb_p.add(cactionbtnb_sbtn);
		
		cactionbtnb_abtn = new JButton("Add");
		cactionbtnb_abtn.setBounds(40, 195, 89, 23);
		cactionbtnb_p.add(cactionbtnb_abtn);
		
		cactionbtnb_rbtn = new JButton("Remove");
		cactionbtnb_rbtn.setBounds(40, 229, 89, 23);
		cactionbtnb_p.add(cactionbtnb_rbtn);
		
		cactionbtnb_ubtn = new JButton("Update");
		cactionbtnb_ubtn.setBounds(40, 263, 89, 23);
		cactionbtnb_p.add(cactionbtnb_ubtn);
		
		cactionbtnb_dabtn = new JButton("Display All");
		cactionbtnb_dabtn.setBounds(29, 294, 114, 23);
		cactionbtnb_p.add(cactionbtnb_dabtn);
		
		JPanel cactionbc_p = new JPanel();
		cactionbc_p.setLayout(null);
		cactionbc_p.setBounds(519, 11, 172, 306);
		caction_p.add(cactionbc_p);
		
		JLabel billidbc_lbl = new JLabel("Bill ID");
		billidbc_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidbc_lbl.setBounds(10, 11, 46, 23);
		cactionbc_p.add(billidbc_lbl);
		
		JLabel sessiontybc_lbl = new JLabel("Sessions Type");
		sessiontybc_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessiontybc_lbl.setBounds(10, 66, 97, 23);
		cactionbc_p.add(sessiontybc_lbl);
		
		JLabel housetybc_lbl = new JLabel("House Type");
		housetybc_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetybc_lbl.setBounds(10, 119, 84, 23);
		cactionbc_p.add(housetybc_lbl);
		
		JButton searchcabc_btn = new JButton("Search");
		searchcabc_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String billidInput = billidbc_txtf.getText();
				String sessionsInput = sessionstybc_txtf.getText();
				String houseTypeInput = housetybc_txtf.getText();
				String committeeInput = committeebc_txtf.getText();
				
				if (billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("") && committeeInput.equals("")){
					
				}else if (!billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("") && committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction "
							+ "Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) + " Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("") && committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where SessionsType = '" + sessionsInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("") && committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) + " AND SessionsType = '" + sessionsInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("") && committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where HouseType = '" + houseTypeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (!billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("") && committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) + " AND HouseType = '" + houseTypeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("") && committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where SessionsType = '" + sessionsInput + "' AND HouseType = '" + houseTypeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("") && committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND SessionsType = '" + sessionsInput + "' AND HouseType = '" + houseTypeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("") && !committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where committeeName = '" + committeeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (!billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("") && !committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) + " AND committeeName = '" + committeeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("") && !committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where SessionsType = '" + sessionsInput + "' AND committeeName = '" + committeeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("") && !committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND SessionsType = '" + sessionsInput + "' AND committeeName = '" + committeeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("") && !committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where HouseType = '" + houseTypeInput + "' AND committeeName = '" + committeeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (!billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("") && !committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND HouseType = '" + houseTypeInput + "' AND committeeName = '" + committeeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("") && !committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where SessionsType = '" + sessionsInput + "' AND HouseType = '" + houseTypeInput + 
							"' AND committeeName = '" + committeeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("") && !committeeInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					cactionbc_tbl.setModel(newCon.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction"
							+ " Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND SessionsType = '" + sessionsInput + "' AND HouseType = '" + houseTypeInput 
							+ "' AND committeeName = '" + committeeInput + "' Order By Bill_ID"));
					cactionbc_tbl.doLayout();
					cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
			        TableColumn billidbc = columnModelbc.getColumn(0);
			        billidbc.setPreferredWidth(50);
					TableColumn housetybc = columnModelbc.getColumn(1);
			        housetybc.setPreferredWidth(200);
			        TableColumn committeenamebc = columnModelbc.getColumn(2);
			        committeenamebc.setPreferredWidth(300);
			        TableColumn sessiontybc = columnModelbc.getColumn(3);
			        sessiontybc.setPreferredWidth(200);
				}
			}
		});
		searchcabc_btn.setBounds(45, 244, 89, 23);
		cactionbc_p.add(searchcabc_btn);
		
		billidbc_txtf = new JTextField();
		billidbc_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidbc_txtf.setColumns(10);
		billidbc_txtf.setBounds(32, 35, 120, 23);
		cactionbc_p.add(billidbc_txtf);
		
		sessionstybc_txtf = new JTextField();
		sessionstybc_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessionstybc_txtf.setColumns(10);
		sessionstybc_txtf.setBounds(32, 88, 120, 23);
		cactionbc_p.add(sessionstybc_txtf);
		
		housetybc_txtf = new JTextField();
		housetybc_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetybc_txtf.setColumns(10);
		housetybc_txtf.setBounds(32, 142, 120, 23);
		cactionbc_p.add(housetybc_txtf);
		
		JLabel committeebc_lbl = new JLabel("Committee");
		committeebc_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		committeebc_lbl.setBounds(10, 176, 84, 23);
		cactionbc_p.add(committeebc_lbl);
		
		committeebc_txtf = new JTextField();
		committeebc_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		committeebc_txtf.setBounds(32, 198, 120, 23);
		cactionbc_p.add(committeebc_txtf);
		committeebc_txtf.setColumns(10);
		
		JScrollPane scrollPanebc = new JScrollPane();
		scrollPanebc.setBounds(197, 10, 311, 307);
		caction_p.add(scrollPanebc);
		
		cactionbc_tbl = new JTable(conbc.getTable("Select Bill_ID, HouseType, committeeName, SessionsType From CommitteeAction Join Sessions On CommitteeAction.Session_ID = Sessions.Session_ID Order By Bill_ID"));
		scrollPanebc.setViewportView(cactionbc_tbl);
		cactionbc_tbl.doLayout();
		cactionbc_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
		TableColumnModel columnModelbc = cactionbc_tbl.getColumnModel();
        TableColumn billidbc = columnModelbc.getColumn(0);
        billidbc.setPreferredWidth(50);
		TableColumn housetybc = columnModelbc.getColumn(1);
        housetybc.setPreferredWidth(200);
        TableColumn committeenamebc = columnModelbc.getColumn(2);
        committeenamebc.setPreferredWidth(300);
        TableColumn sessiontybc = columnModelbc.getColumn(3);
        sessiontybc.setPreferredWidth(200);
		
		JPanel authored_p = new JPanel();
		bills_tab.add(authored_p, "authored_p");
		authored_p.setLayout(null);
		
		JPanel authoredbtnb_p = new JPanel();
		authoredbtnb_p.setLayout(null);
		authoredbtnb_p.setBounds(0, 0, 185, 317);
		authored_p.add(authoredbtnb_p);
		
		authoredbtnb_vbtn = new JButton("Votes");
		authoredbtnb_vbtn.setBounds(40, 25, 89, 23);
		authoredbtnb_p.add(authoredbtnb_vbtn);
		
		authoredbtnb_gsbtn = new JButton("Governor Signed");
		authoredbtnb_gsbtn.setBounds(21, 59, 135, 23);
		authoredbtnb_p.add(authoredbtnb_gsbtn);
		
		authoredbtnb_cabtn = new JButton("Committee Action");
		authoredbtnb_cabtn.setBounds(21, 93, 135, 23);
		authoredbtnb_p.add(authoredbtnb_cabtn);
		
		authoredbtnb_aubtn = new JButton("Authored");
		authoredbtnb_aubtn.setBounds(40, 127, 89, 23);
		authoredbtnb_p.add(authoredbtnb_aubtn);
		
		authoredbtnb_sbtn = new JButton("Search");
		authoredbtnb_sbtn.setBounds(40, 161, 89, 23);
		authoredbtnb_p.add(authoredbtnb_sbtn);
		
		authoredbtnb_abtn = new JButton("Add");
		authoredbtnb_abtn.setBounds(40, 195, 89, 23);
		authoredbtnb_p.add(authoredbtnb_abtn);
		
		authoredbtnb_rbtn = new JButton("Remove");
		authoredbtnb_rbtn.setBounds(40, 229, 89, 23);
		authoredbtnb_p.add(authoredbtnb_rbtn);
		
		authoredbtnb_ubtn = new JButton("Update");
		authoredbtnb_ubtn.setBounds(40, 263, 89, 23);
		authoredbtnb_p.add(authoredbtnb_ubtn);
		
		authoredbtnb_dabtn = new JButton("Display All");
		authoredbtnb_dabtn.setBounds(32, 294, 108, 23);
		authoredbtnb_p.add(authoredbtnb_dabtn);
		
		JPanel authoredba_p = new JPanel();
		authoredba_p.setLayout(null);
		authoredba_p.setBounds(195, 11, 231, 306);
		authored_p.add(authoredba_p);
		
		JLabel billidba_lbl = new JLabel("Bill ID");
		billidba_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidba_lbl.setBounds(12, 30, 46, 23);
		authoredba_p.add(billidba_lbl);
		
		JLabel firstnameba_lbl = new JLabel("First name");
		firstnameba_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		firstnameba_lbl.setBounds(12, 89, 97, 23);
		authoredba_p.add(firstnameba_lbl);
		
		JLabel lastnameba_lbl = new JLabel("Last name");
		lastnameba_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lastnameba_lbl.setBounds(12, 152, 84, 23);
		authoredba_p.add(lastnameba_lbl);
		
		JButton searchauthoredba_btn = new JButton("Search");
		searchauthoredba_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String billidInput = billidba_txtf.getText();
				String firstnameInput = firstnameba_txtf.getText();
				String lastnameInput = lastnameba_txtf.getText();
				
				for (int i = 0; i < firstnameInput.length(); i ++){
					if (firstnameInput.charAt(i) == 39 || firstnameInput.charAt(i) == 8217 || firstnameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(firstnameInput);
						strb = strb.replace(i, i+1, "''");
						firstnameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < lastnameInput.length(); i ++){
					if (lastnameInput.charAt(i) == 39 || lastnameInput.charAt(i) == 8217 || lastnameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(lastnameInput);
						strb = strb.replace(i, i+1, "''");
						lastnameInput = strb.toString();
						i++;
					}
				}
				
				if (billidInput.equals("") && firstnameInput.equals("") && lastnameInput.equals("")){
					
				}else if (!billidInput.equals("") && firstnameInput.equals("") && lastnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					authoredba_tbl.setModel(newCon.getTable("Select firstName, lastName, Bills.Bill_ID, name From Bills "
							+ "Join Authored On Bills.Bill_ID = Authored.Bill_ID Join People On Authored.PID = People.PID "
							+ "Where Bills.Bill_ID = " + Integer.parseInt(billidInput) + " Order By Bills.Bill_ID, firstName, lastName"));
					authoredba_tbl.doLayout();
					authoredba_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelba = authoredba_tbl.getColumnModel();
			        TableColumn billidba = columnModelba.getColumn(0);
			        billidba.setPreferredWidth(130);
					TableColumn firstnameba = columnModelba.getColumn(1);
			        firstnameba.setPreferredWidth(150);
			        TableColumn lastnameba = columnModelba.getColumn(2);
			        lastnameba.setPreferredWidth(50);
			        TableColumn billnameba = columnModelba.getColumn(3);
			        billnameba.setPreferredWidth(800);
				}else if (billidInput.equals("") && !firstnameInput.equals("") && lastnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					authoredba_tbl.setModel(newCon.getTable("Select firstName, lastName, Bills.Bill_ID, name From Bills "
							+ "Join Authored On Bills.Bill_ID = Authored.Bill_ID Join People On Authored.PID = People.PID "
							+ "Where firstName = '" + firstnameInput + "' Order By Bills.Bill_ID, firstName, lastName"));
					authoredba_tbl.doLayout();
					authoredba_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelba = authoredba_tbl.getColumnModel();
			        TableColumn billidba = columnModelba.getColumn(0);
			        billidba.setPreferredWidth(130);
					TableColumn firstnameba = columnModelba.getColumn(1);
			        firstnameba.setPreferredWidth(150);
			        TableColumn lastnameba = columnModelba.getColumn(2);
			        lastnameba.setPreferredWidth(50);
			        TableColumn billnameba = columnModelba.getColumn(3);
			        billnameba.setPreferredWidth(800);
				}else if (!billidInput.equals("") && !firstnameInput.equals("") && lastnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					authoredba_tbl.setModel(newCon.getTable("Select firstName, lastName, Bills.Bill_ID, name From Bills "
							+ "Join Authored On Bills.Bill_ID = Authored.Bill_ID Join People On Authored.PID = People.PID "
							+ "Where Bills.Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND firstName = '" + firstnameInput + "' Order By Bills.Bill_ID, firstName, lastName"));
					authoredba_tbl.doLayout();
					authoredba_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelba = authoredba_tbl.getColumnModel();
			        TableColumn billidba = columnModelba.getColumn(0);
			        billidba.setPreferredWidth(130);
					TableColumn firstnameba = columnModelba.getColumn(1);
			        firstnameba.setPreferredWidth(150);
			        TableColumn lastnameba = columnModelba.getColumn(2);
			        lastnameba.setPreferredWidth(50);
			        TableColumn billnameba = columnModelba.getColumn(3);
			        billnameba.setPreferredWidth(800);
				}else if (billidInput.equals("") && firstnameInput.equals("") && !lastnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					authoredba_tbl.setModel(newCon.getTable("Select firstName, lastName, Bills.Bill_ID, name From Bills "
							+ "Join Authored On Bills.Bill_ID = Authored.Bill_ID Join People On Authored.PID = People.PID "
							+ "Where lastName = '" + lastnameInput + "' Order By Bills.Bill_ID, firstName, lastName"));
					authoredba_tbl.doLayout();
					authoredba_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelba = authoredba_tbl.getColumnModel();
			        TableColumn billidba = columnModelba.getColumn(0);
			        billidba.setPreferredWidth(130);
					TableColumn firstnameba = columnModelba.getColumn(1);
			        firstnameba.setPreferredWidth(150);
			        TableColumn lastnameba = columnModelba.getColumn(2);
			        lastnameba.setPreferredWidth(50);
			        TableColumn billnameba = columnModelba.getColumn(3);
			        billnameba.setPreferredWidth(800);
				}else if (!billidInput.equals("") && firstnameInput.equals("") && !lastnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					authoredba_tbl.setModel(newCon.getTable("Select firstName, lastName, Bills.Bill_ID, name From Bills "
							+ "Join Authored On Bills.Bill_ID = Authored.Bill_ID Join People On Authored.PID = People.PID "
							+ "Where Bills.Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND lastName = '" + lastnameInput + "' Order By Bills.Bill_ID, firstName, lastName"));
					authoredba_tbl.doLayout();
					authoredba_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelba = authoredba_tbl.getColumnModel();
			        TableColumn billidba = columnModelba.getColumn(0);
			        billidba.setPreferredWidth(130);
					TableColumn firstnameba = columnModelba.getColumn(1);
			        firstnameba.setPreferredWidth(150);
			        TableColumn lastnameba = columnModelba.getColumn(2);
			        lastnameba.setPreferredWidth(50);
			        TableColumn billnameba = columnModelba.getColumn(3);
			        billnameba.setPreferredWidth(800);
				}else if (billidInput.equals("") && !firstnameInput.equals("") && !lastnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					authoredba_tbl.setModel(newCon.getTable("Select firstName, lastName, Bills.Bill_ID, name From Bills "
							+ "Join Authored On Bills.Bill_ID = Authored.Bill_ID Join People On Authored.PID = People.PID "
							+ "Where firstName = '" + firstnameInput 
							+ "' AND lastName = '" + lastnameInput + "' Order By Bills.Bill_ID, firstName, lastName"));
					authoredba_tbl.doLayout();
					authoredba_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelba = authoredba_tbl.getColumnModel();
			        TableColumn billidba = columnModelba.getColumn(0);
			        billidba.setPreferredWidth(130);
					TableColumn firstnameba = columnModelba.getColumn(1);
			        firstnameba.setPreferredWidth(150);
			        TableColumn lastnameba = columnModelba.getColumn(2);
			        lastnameba.setPreferredWidth(50);
			        TableColumn billnameba = columnModelba.getColumn(3);
			        billnameba.setPreferredWidth(800);
				}else if (!billidInput.equals("") && !firstnameInput.equals("") && !lastnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					authoredba_tbl.setModel(newCon.getTable("Select firstName, lastName, Bills.Bill_ID, name From Bills "
							+ "Join Authored On Bills.Bill_ID = Authored.Bill_ID Join People On Authored.PID = People.PID "
							+ "Where Bills.Bill_ID = " + Integer.parseInt(billidInput) + " AND firstName = '" + firstnameInput 
							+ "' AND lastName = '" + lastnameInput + "' Order By Bills.Bill_ID, firstName, lastName"));
					authoredba_tbl.doLayout();
					authoredba_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelba = authoredba_tbl.getColumnModel();
			        TableColumn billidba = columnModelba.getColumn(0);
			        billidba.setPreferredWidth(130);
					TableColumn firstnameba = columnModelba.getColumn(1);
			        firstnameba.setPreferredWidth(150);
			        TableColumn lastnameba = columnModelba.getColumn(2);
			        lastnameba.setPreferredWidth(50);
			        TableColumn billnameba = columnModelba.getColumn(3);
			        billnameba.setPreferredWidth(800);
				}
			}
		});
		searchauthoredba_btn.setBounds(69, 222, 89, 23);
		authoredba_p.add(searchauthoredba_btn);
		
		billidba_txtf = new JTextField();
		billidba_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidba_txtf.setColumns(10);
		billidba_txtf.setBounds(99, 30, 120, 23);
		authoredba_p.add(billidba_txtf);
		
		firstnameba_txtf = new JTextField();
		firstnameba_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		firstnameba_txtf.setColumns(10);
		firstnameba_txtf.setBounds(99, 89, 120, 23);
		authoredba_p.add(firstnameba_txtf);
		
		lastnameba_txtf = new JTextField();
		lastnameba_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		lastnameba_txtf.setColumns(10);
		lastnameba_txtf.setBounds(99, 152, 120, 23);
		authoredba_p.add(lastnameba_txtf);
		
		scrollPaneba = new JScrollPane();
		scrollPaneba.setBounds(438, 13, 251, 304);
		authored_p.add(scrollPaneba);
		
		authoredba_tbl = new JTable();
		scrollPaneba.setViewportView(authoredba_tbl);
		
		JPanel searchbills_p = new JPanel();
		bills_tab.add(searchbills_p, "searchbills_p");
		searchbills_p.setLayout(null);
		
		JPanel searchbtnb_p = new JPanel();
		searchbtnb_p.setLayout(null);
		searchbtnb_p.setBounds(0, 0, 185, 317);
		searchbills_p.add(searchbtnb_p);
		
		searchbtnb_vbtn = new JButton("Votes");
		searchbtnb_vbtn.setBounds(40, 25, 89, 23);
		searchbtnb_p.add(searchbtnb_vbtn);
		
		searchbtnb_gsbtn = new JButton("Governor Signed");
		searchbtnb_gsbtn.setBounds(21, 59, 135, 23);
		searchbtnb_p.add(searchbtnb_gsbtn);
		
		searchbtnb_cabtn = new JButton("Committee Action");
		searchbtnb_cabtn.setBounds(21, 93, 135, 23);
		searchbtnb_p.add(searchbtnb_cabtn);
		
		searchbtnb_aubtn = new JButton("Authored");
		searchbtnb_aubtn.setBounds(40, 127, 89, 23);
		searchbtnb_p.add(searchbtnb_aubtn);
		
		searchbtnb_sbtn = new JButton("Search");
		searchbtnb_sbtn.setBounds(40, 161, 89, 23);
		searchbtnb_p.add(searchbtnb_sbtn);
		
		searchbtnb_abtn = new JButton("Add");
		searchbtnb_abtn.setBounds(40, 195, 89, 23);
		searchbtnb_p.add(searchbtnb_abtn);
		
		searchbtnb_rbtn = new JButton("Remove");
		searchbtnb_rbtn.setBounds(40, 229, 89, 23);
		searchbtnb_p.add(searchbtnb_rbtn);
		
		searchbtnb_ubtn = new JButton("Update");
		searchbtnb_ubtn.setBounds(40, 263, 89, 23);
		searchbtnb_p.add(searchbtnb_ubtn);
		
		searchbtnb_dabtn = new JButton("Display All");
		searchbtnb_dabtn.setBounds(29, 294, 111, 23);
		searchbtnb_p.add(searchbtnb_dabtn);
		
		JPanel searchbs_p = new JPanel();
		searchbs_p.setLayout(null);
		searchbs_p.setBounds(195, 11, 262, 306);
		searchbills_p.add(searchbs_p);
		
		JLabel billidbs_lbl = new JLabel("Bill ID");
		billidbs_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidbs_lbl.setBounds(12, 34, 46, 23);
		searchbs_p.add(billidbs_lbl);
		
		JLabel sessionstybs_lbl = new JLabel("Sessions Type");
		sessionstybs_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessionstybs_lbl.setBounds(12, 95, 97, 23);
		searchbs_p.add(sessionstybs_lbl);
		
		JLabel housetybs_lbl = new JLabel("House Type");
		housetybs_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetybs_lbl.setBounds(12, 151, 84, 23);
		searchbs_p.add(housetybs_lbl);
		
		JButton searchbs_btn = new JButton("Search");
		searchbs_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String billidInput = billidbs_txtf.getText();
				String sessionsInput = sessionstybs_txtf.getText();
				String houseTypeInput = housetybs_txtf.getText();
				String billnameInput = namebs_txtf.getText();
				
				for (int i = 0; i < billnameInput.length(); i ++){
					if (billnameInput.charAt(i) == 39 || billnameInput.charAt(i) == 8217 || billnameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(billnameInput);
						strb = strb.replace(i, i+1, "''");
						billnameInput = strb.toString();
						i++;
					}
				}
				
				if (billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("") && billnameInput.equals("")){
					
				}else if (!billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("") && billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) + " Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("") && billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where SessionsType = '" + sessionsInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("") && billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND SessionsType = '" + sessionsInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("") && billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where HouseType = '" + houseTypeInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (!billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("") && billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND HouseType = '" + houseTypeInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("") && billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where SessionsType = '" + sessionsInput 
							+ "' AND HouseType = '" + houseTypeInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("") && billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND SessionsType = '" + sessionsInput + "' AND HouseType = '" + houseTypeInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("") && !billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where name = '" + billnameInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (!billidInput.equals("") && sessionsInput.equals("") && houseTypeInput.equals("") && !billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND name = '" + billnameInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("") && !billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where SessionsType = '" + sessionsInput 
							+ "' AND name = '" + billnameInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && houseTypeInput.equals("") && !billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) 
							+ " AND SessionsType = '" + sessionsInput + "' AND name = '" + billnameInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("") && !billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where HouseType = '" + houseTypeInput 
							+ "' AND name = '" + billnameInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (!billidInput.equals("") && sessionsInput.equals("") && !houseTypeInput.equals("") && !billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) + " AND HouseType = '" + houseTypeInput 
							+ "' AND name = '" + billnameInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("") && !billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where SessionsType = '" + sessionsInput + "' AND HouseType = '" + houseTypeInput 
							+ "' AND name = '" + billnameInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}else if (!billidInput.equals("") && !sessionsInput.equals("") && !houseTypeInput.equals("") && !billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					searchbs_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills "
							+ "Join Sessions On Bills.Session_ID = Sessions.Session_ID"
							+ " Where Bill_ID = " + Integer.parseInt(billidInput) + " AND SessionsType = '" + sessionsInput + "' AND HouseType = '" + houseTypeInput 
							+ "' AND name = '" + billnameInput + "' Order By Bill_ID"));
					searchbs_tbl.doLayout();
					searchbs_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelbs = searchbs_tbl.getColumnModel();
			        TableColumn billidbs = columnModelbs.getColumn(0);
			        billidbs.setPreferredWidth(50);
					TableColumn sessiontybs = columnModelbs.getColumn(1);
			        sessiontybs.setPreferredWidth(200);
			        TableColumn housetybs = columnModelbs.getColumn(2);
			        housetybs.setPreferredWidth(200);
			        TableColumn billnamebs = columnModelbs.getColumn(3);
			        billnamebs.setPreferredWidth(800);
				}
			}
		});
		searchbs_btn.setBounds(85, 258, 89, 23);
		searchbs_p.add(searchbs_btn);
		
		billidbs_txtf = new JTextField();
		billidbs_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidbs_txtf.setColumns(10);
		billidbs_txtf.setBounds(128, 34, 120, 23);
		searchbs_p.add(billidbs_txtf);
		
		sessionstybs_txtf = new JTextField();
		sessionstybs_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessionstybs_txtf.setColumns(10);
		sessionstybs_txtf.setBounds(128, 95, 120, 23);
		searchbs_p.add(sessionstybs_txtf);
		
		housetybs_txtf = new JTextField();
		housetybs_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetybs_txtf.setColumns(10);
		housetybs_txtf.setBounds(128, 151, 120, 23);
		searchbs_p.add(housetybs_txtf);
		
		JLabel namebs_lbl = new JLabel("Name");
		namebs_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		namebs_lbl.setBounds(12, 211, 46, 23);
		searchbs_p.add(namebs_lbl);
		
		namebs_txtf = new JTextField();
		namebs_txtf.setBounds(128, 212, 120, 23);
		searchbs_p.add(namebs_txtf);
		namebs_txtf.setColumns(10);
		
		scrollPanebs = new JScrollPane();
		scrollPanebs.setBounds(469, 11, 220, 306);
		searchbills_p.add(scrollPanebs);
		
		searchbs_tbl = new JTable();
		scrollPanebs.setViewportView(searchbs_tbl);
		
		JPanel addbills_p = new JPanel();
		bills_tab.add(addbills_p, "addbills_p");
		addbills_p.setLayout(null);
		
		JPanel addbtnb_p = new JPanel();
		addbtnb_p.setLayout(null);
		addbtnb_p.setBounds(0, 0, 185, 317);
		addbills_p.add(addbtnb_p);
		
		addbtnb_vbtn = new JButton("Votes");
		addbtnb_vbtn.setBounds(40, 25, 89, 23);
		addbtnb_p.add(addbtnb_vbtn);
		
		addbtnb_gsbtn = new JButton("Governor Signed");
		addbtnb_gsbtn.setBounds(21, 59, 135, 23);
		addbtnb_p.add(addbtnb_gsbtn);
		
		addbtnb_cabtn = new JButton("Committee Action");
		addbtnb_cabtn.setBounds(21, 93, 135, 23);
		addbtnb_p.add(addbtnb_cabtn);
		
		addbtnb_aubtn = new JButton("Authored");
		addbtnb_aubtn.setBounds(40, 127, 89, 23);
		addbtnb_p.add(addbtnb_aubtn);
		
		addbtnb_sbtn = new JButton("Search");
		addbtnb_sbtn.setBounds(40, 161, 89, 23);
		addbtnb_p.add(addbtnb_sbtn);
		
		addbtnb_abtn = new JButton("Add");
		addbtnb_abtn.setBounds(40, 195, 89, 23);
		addbtnb_p.add(addbtnb_abtn);
		
		addbtnb_rbtn = new JButton("Remove");
		addbtnb_rbtn.setBounds(40, 229, 89, 23);
		addbtnb_p.add(addbtnb_rbtn);
		
		addbtnb_ubtn = new JButton("Update");
		addbtnb_ubtn.setBounds(40, 263, 89, 23);
		addbtnb_p.add(addbtnb_ubtn);
		
		addbtnb_dabtn = new JButton("Display All");
		addbtnb_dabtn.setBounds(32, 294, 108, 23);
		addbtnb_p.add(addbtnb_dabtn);
		
		JPanel addba_p = new JPanel();
		addba_p.setLayout(null);
		addba_p.setBounds(195, 11, 496, 306);
		addbills_p.add(addba_p);
		
		JLabel sessiontyba_lbl = new JLabel("* Session Type");
		sessiontyba_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessiontyba_lbl.setBounds(117, 48, 108, 23);
		addba_p.add(sessiontyba_lbl);
		
		JLabel housetyba_lbl = new JLabel("* House Type");
		housetyba_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetyba_lbl.setBounds(117, 110, 97, 23);
		addba_p.add(housetyba_lbl);
		
		JLabel nameba_lbl = new JLabel("* Name");
		nameba_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		nameba_lbl.setBounds(117, 175, 84, 23);
		addba_p.add(nameba_lbl);
		
		JButton addba_btn = new JButton("Add");
		addba_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String sessionInput = sessiontyba_txtf.getText();
				String houseInput = housetyba_txtf.getText();
				String nameInput = nameba_txtf.getText();
				
				for (int i = 0; i < nameInput.length(); i ++){
					if (nameInput.charAt(i) == 39 || nameInput.charAt(i) == 8217 || nameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(nameInput);
						strb = strb.replace(i, i+1, "''");
						nameInput = strb.toString();
						i++;
					}
				}
				
				if (!sessionInput.equals("") && !houseInput.equals("") && !nameInput.equals("")){
					DatabaseConnection newConID = new DatabaseConnection();
					DatabaseConnection newConInsert = new DatabaseConnection();
					DatabaseConnection newConIDs = new DatabaseConnection();
					
					DefaultTableModel ts = newConIDs.getTable("Select Session_ID From Sessions Where SessionsType = '" + sessionInput + "'");
					BigDecimal ids = (BigDecimal) ts.getValueAt(0, 0);
					DefaultTableModel t = newConID.getTable("Select Max(Bill_ID) From Bills");
					BigDecimal id = (BigDecimal) t.getValueAt(0, 0);
					
					newConInsert.getTable("Insert Into Bills Values(" + (id.intValueExact() + 1) + ", " + ids.intValueExact() + ", '" + houseInput + "', '" + nameInput + "')");
				}
			}
		});
		addba_btn.setBounds(192, 228, 89, 23);
		addba_p.add(addba_btn);
		
		sessiontyba_txtf = new JTextField();
		sessiontyba_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessiontyba_txtf.setColumns(10);
		sessiontyba_txtf.setBounds(262, 48, 120, 23);
		addba_p.add(sessiontyba_txtf);
		
		housetyba_txtf = new JTextField();
		housetyba_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetyba_txtf.setColumns(10);
		housetyba_txtf.setBounds(262, 110, 120, 23);
		addba_p.add(housetyba_txtf);
		
		nameba_txtf = new JTextField();
		nameba_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		nameba_txtf.setColumns(10);
		nameba_txtf.setBounds(262, 175, 120, 23);
		addba_p.add(nameba_txtf);
		
		JLabel requiredba_lbl = new JLabel("*: Required fields");
		requiredba_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		requiredba_lbl.setBounds(166, 11, 120, 26);
		addba_p.add(requiredba_lbl);
		
		JPanel removebills_p = new JPanel();
		bills_tab.add(removebills_p, "removebills_p");
		removebills_p.setLayout(null);
		
		JPanel removebtnb_p = new JPanel();
		removebtnb_p.setLayout(null);
		removebtnb_p.setBounds(0, 0, 185, 317);
		removebills_p.add(removebtnb_p);
		
		removebtnb_vbtn = new JButton("Votes");
		removebtnb_vbtn.setBounds(40, 25, 89, 23);
		removebtnb_p.add(removebtnb_vbtn);
		
		removebtnb_gsbtn = new JButton("Governor Signed");
		removebtnb_gsbtn.setBounds(21, 59, 135, 23);
		removebtnb_p.add(removebtnb_gsbtn);
		
		removebtnb_cabtn = new JButton("Committee Action");
		removebtnb_cabtn.setBounds(21, 93, 135, 23);
		removebtnb_p.add(removebtnb_cabtn);
		
		removebtnb_aubtn = new JButton("Authored");
		removebtnb_aubtn.setBounds(40, 127, 89, 23);
		removebtnb_p.add(removebtnb_aubtn);
		
		removebtnb_sbtn = new JButton("Search");
		removebtnb_sbtn.setBounds(40, 161, 89, 23);
		removebtnb_p.add(removebtnb_sbtn);
		
		removebtnb_abtn = new JButton("Add");
		removebtnb_abtn.setBounds(40, 195, 89, 23);
		removebtnb_p.add(removebtnb_abtn);
		
		removebtnb_rbtn = new JButton("Remove");
		removebtnb_rbtn.setBounds(40, 229, 89, 23);
		removebtnb_p.add(removebtnb_rbtn);
		
		removebtnb_ubtn = new JButton("Update");
		removebtnb_ubtn.setBounds(40, 263, 89, 23);
		removebtnb_p.add(removebtnb_ubtn);
		
		removebtnb_dabtn = new JButton("Display All");
		removebtnb_dabtn.setBounds(30, 294, 110, 23);
		removebtnb_p.add(removebtnb_dabtn);
		
		JPanel removebr_p = new JPanel();
		removebr_p.setLayout(null);
		removebr_p.setBounds(195, 11, 496, 306);
		removebills_p.add(removebr_p);
		
		JLabel billidbr_lbl = new JLabel("Bill ID");
		billidbr_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidbr_lbl.setBounds(89, 33, 46, 23);
		removebr_p.add(billidbr_lbl);
		
		JLabel billnamebr_lbl = new JLabel("Bill name");
		billnamebr_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billnamebr_lbl.setBounds(89, 92, 97, 23);
		removebr_p.add(billnamebr_lbl);
		
		JButton removebr_btn = new JButton("Remove");
		removebr_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String billidInput = billidbr_txtf.getText();
				String billnameInput = billnamebr_txtf.getText();
				
				for (int i = 0; i < billnameInput.length(); i ++){
					if (billnameInput.charAt(i) == 39 || billnameInput.charAt(i) == 8217 || billnameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(billnameInput);
						strb = strb.replace(i, i+1, "''");
						billnameInput = strb.toString();
						i++;
					}
				}
				
				if (billidInput.equals("") && billnameInput.equals("")){
					
				}else if (!billidInput.equals("") && billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Delete From Bills Where Bill_ID = " + Integer.parseInt(billidInput));
				}else if (billidInput.equals("") && !billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Delete From Bills Where name = '" + billnameInput + "'");
				}else if (!billidInput.equals("") && !billnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Delete From Bills Where Bill_ID = " + Integer.parseInt(billidInput) + " AND name = '" + billnameInput + "'");
				}
			}
		});
		removebr_btn.setBounds(200, 177, 89, 23);
		removebr_p.add(removebr_btn);
		
		billidbr_txtf = new JTextField();
		billidbr_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billidbr_txtf.setColumns(10);
		billidbr_txtf.setBounds(273, 33, 120, 23);
		removebr_p.add(billidbr_txtf);
		
		billnamebr_txtf = new JTextField();
		billnamebr_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billnamebr_txtf.setColumns(10);
		billnamebr_txtf.setBounds(273, 92, 120, 23);
		removebr_p.add(billnamebr_txtf);
		
		JPanel updatebills_p = new JPanel();
		bills_tab.add(updatebills_p, "updatebills_p");
		updatebills_p.setLayout(null);
		
		JPanel updatebtnb_p = new JPanel();
		updatebtnb_p.setLayout(null);
		updatebtnb_p.setBounds(0, 0, 185, 317);
		updatebills_p.add(updatebtnb_p);
		
		updatebtnb_vbtn = new JButton("Votes");
		updatebtnb_vbtn.setBounds(40, 25, 89, 23);
		updatebtnb_p.add(updatebtnb_vbtn);
		
		updatebtnb_gsbtn = new JButton("Governor Signed");
		updatebtnb_gsbtn.setBounds(21, 59, 135, 23);
		updatebtnb_p.add(updatebtnb_gsbtn);
		
		updatebtnb_cabtn = new JButton("Committee Action");
		updatebtnb_cabtn.setBounds(21, 93, 135, 23);
		updatebtnb_p.add(updatebtnb_cabtn);
		
		updatebtnb_aubtn = new JButton("Authored");
		updatebtnb_aubtn.setBounds(40, 127, 89, 23);
		updatebtnb_p.add(updatebtnb_aubtn);
		
		updatebtnb_sbtn = new JButton("Search");
		updatebtnb_sbtn.setBounds(40, 161, 89, 23);
		updatebtnb_p.add(updatebtnb_sbtn);
		
		updatebtnb_abtn = new JButton("Add");
		updatebtnb_abtn.setBounds(40, 195, 89, 23);
		updatebtnb_p.add(updatebtnb_abtn);
		
		updatebtnb_rbtn = new JButton("Remove");
		updatebtnb_rbtn.setBounds(40, 229, 89, 23);
		updatebtnb_p.add(updatebtnb_rbtn);
		
		updatebtnb_ubtn = new JButton("Update");
		updatebtnb_ubtn.setBounds(40, 263, 89, 23);
		updatebtnb_p.add(updatebtnb_ubtn);
		
		updatebtnb_dabtn = new JButton("Display All");
		updatebtnb_dabtn.setBounds(31, 294, 108, 23);
		updatebtnb_p.add(updatebtnb_dabtn);
		
		JPanel updatebu_p = new JPanel();
		updatebu_p.setLayout(null);
		updatebu_p.setBounds(195, 11, 496, 306);
		updatebills_p.add(updatebu_p);
		
		JLabel sessiontybu_lbl = new JLabel("* Session Type");
		sessiontybu_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessiontybu_lbl.setBounds(69, 60, 108, 23);
		updatebu_p.add(sessiontybu_lbl);
		
		JLabel housetybu_lbl = new JLabel("* House Type");
		housetybu_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetybu_lbl.setBounds(69, 120, 97, 23);
		updatebu_p.add(housetybu_lbl);
		
		JLabel billnamebu_lbl = new JLabel("* Bill name");
		billnamebu_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billnamebu_lbl.setBounds(69, 175, 84, 23);
		updatebu_p.add(billnamebu_lbl);
		
		JButton updatebu_btn = new JButton("Update");
		updatebu_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String sessionInput = sessiontybu_txtf.getText();
				String houseInput = housetybu_txtf.getText();
				String billnameInput = billnamebu_txtf.getText();
				String upsessionInput = updatesessiontybu_txtf.getText();
				String uphouseInput = updatehousetypebu_txtf.getText();
				String upbillnameInput = updatebillnamebu_txtf.getText();
				
				for (int i = 0; i < billnameInput.length(); i ++){
					if (billnameInput.charAt(i) == 39 || billnameInput.charAt(i) == 8217 || billnameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(billnameInput);
						strb = strb.replace(i, i+1, "''");
						billnameInput = strb.toString();
						i++;
					}
				}
				
				for (int i = 0; i < upbillnameInput.length(); i ++){
					if (upbillnameInput.charAt(i) == 39 || upbillnameInput.charAt(i) == 8217 || upbillnameInput.charAt(i) == 8218){
						StringBuilder strb = new StringBuilder(upbillnameInput);
						strb = strb.replace(i, i+1, "''");
						upbillnameInput = strb.toString();
						i++;
					}
				}
				
				if (!sessionInput.equals("") && !houseInput.equals("") && !billnameInput.equals("") &&
						!upsessionInput.equals("") && !uphouseInput.equals("") && !upbillnameInput.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					DatabaseConnection newConID = new DatabaseConnection();
					DefaultTableModel t = newConID.getTable("Select Session_ID From Sessions Where SessionsType = '" + upsessionInput + "'");
					BigDecimal id = (BigDecimal) t.getValueAt(0, 0);
					newCon.getTable("Update Bills Set Session_ID = " + id.intValueExact() + ", HouseType = '" + uphouseInput + "', name = '" + upbillnameInput 
							+ "' Where Session_ID = (Select Session_ID From Sessions Where SessionsType = '" + sessionInput 
							+ "') AND HouseType = '" + houseInput + "' AND name = '" + billnameInput + "'");
				}
			}
		});
		updatebu_btn.setBounds(192, 228, 89, 23);
		updatebu_p.add(updatebu_btn);
		
		sessiontybu_txtf = new JTextField();
		sessiontybu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		sessiontybu_txtf.setColumns(10);
		sessiontybu_txtf.setBounds(208, 60, 120, 23);
		updatebu_p.add(sessiontybu_txtf);
		
		housetybu_txtf = new JTextField();
		housetybu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housetybu_txtf.setColumns(10);
		housetybu_txtf.setBounds(208, 120, 120, 23);
		updatebu_p.add(housetybu_txtf);
		
		billnamebu_txtf = new JTextField();
		billnamebu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		billnamebu_txtf.setColumns(10);
		billnamebu_txtf.setBounds(208, 175, 120, 23);
		updatebu_p.add(billnamebu_txtf);
		
		JLabel requiredbu_lbl = new JLabel("*: Required fields");
		requiredbu_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		requiredbu_lbl.setBounds(166, 11, 120, 26);
		updatebu_p.add(requiredbu_lbl);
		
		JLabel updatebu_lbl = new JLabel("Update");
		updatebu_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		updatebu_lbl.setBounds(386, 28, 63, 23);
		updatebu_p.add(updatebu_lbl);
		
		updatesessiontybu_txtf = new JTextField();
		updatesessiontybu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		updatesessiontybu_txtf.setBounds(352, 60, 120, 23);
		updatebu_p.add(updatesessiontybu_txtf);
		updatesessiontybu_txtf.setColumns(10);
		
		updatehousetypebu_txtf = new JTextField();
		updatehousetypebu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		updatehousetypebu_txtf.setBounds(352, 120, 120, 23);
		updatebu_p.add(updatehousetypebu_txtf);
		updatehousetypebu_txtf.setColumns(10);
		
		updatebillnamebu_txtf = new JTextField();
		updatebillnamebu_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		updatebillnamebu_txtf.setBounds(352, 175, 120, 23);
		updatebu_p.add(updatebillnamebu_txtf);
		updatebillnamebu_txtf.setColumns(10);
		
		cl_assembly_tab = new CardLayout();
		assembly_tab = new JPanel();
		tabbedPane.addTab("General Assembly", null, assembly_tab, null);
		assembly_tab.setLayout(cl_assembly_tab);
		
		JPanel initassem_p = new JPanel();
		assembly_tab.add(initassem_p, "initassem_p");
		initassem_p.setLayout(null);
		
		JPanel initbtna_p = new JPanel();
		initbtna_p.setBounds(10, 11, 181, 317);
		initassem_p.add(initbtna_p);
		initbtna_p.setLayout(null);
		
		initbtna_hbtn = new JButton("House of Representatives");
		initbtna_hbtn.setBounds(10, 29, 157, 38);
		initbtna_p.add(initbtna_hbtn);
		
		initbtna_sebtn = new JButton("State Senate");
		initbtna_sebtn.setBounds(41, 94, 105, 23);
		initbtna_p.add(initbtna_sebtn);
		
		initbtna_abtn = new JButton("Add");
		initbtna_abtn.setBounds(45, 148, 89, 23);
		initbtna_p.add(initbtna_abtn);
		
		initbtna_rbtn = new JButton("Remove");
		initbtna_rbtn.setBounds(45, 210, 89, 23);
		initbtna_p.add(initbtna_rbtn);
		
		initbtna_ubtn = new JButton("Update");
		initbtna_ubtn.setBounds(45, 267, 89, 23);
		initbtna_p.add(initbtna_ubtn);
		
		JPanel house_p = new JPanel();
		assembly_tab.add(house_p, "house_p");
		house_p.setLayout(null);
		
		JPanel housebtna_p = new JPanel();
		housebtna_p.setLayout(null);
		housebtna_p.setBounds(0, 0, 181, 317);
		house_p.add(housebtna_p);
		
		housebtna_hbtn = new JButton("House of Representatives");
		housebtna_hbtn.setBounds(10, 29, 161, 29);
		housebtna_p.add(housebtna_hbtn);
		
		housebtna_sebtn = new JButton("State Senate");
		housebtna_sebtn.setBounds(41, 94, 105, 23);
		housebtna_p.add(housebtna_sebtn);
		
		housebtna_abtn = new JButton("Add");
		housebtna_abtn.setBounds(45, 148, 89, 23);
		housebtna_p.add(housebtna_abtn);
		
		housebtna_rbtn = new JButton("Remove");
		housebtna_rbtn.setBounds(45, 210, 89, 23);
		housebtna_p.add(housebtna_rbtn);
		
		housebtna_ubtn = new JButton("Update");
		housebtna_ubtn.setBounds(45, 267, 89, 23);
		housebtna_p.add(housebtna_ubtn);
		
		JScrollPane scrollPanehh = new JScrollPane();
		scrollPanehh.setBounds(187, 10, 319, 307);
		house_p.add(scrollPanehh);
		
		houseah_tbl = new JTable(conah.getTable("Select committeeName From CommitteeNames Where HouseType = 'House of Representatives'"));
		scrollPanehh.setViewportView(houseah_tbl);
		houseah_tbl.doLayout();
		houseah_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
		TableColumnModel columnModelah = houseah_tbl.getColumnModel();
		TableColumn committeenameah = columnModelah.getColumn(0);
		committeenameah.setPreferredWidth(300);
		
		JPanel housedisplayah_p = new JPanel();
		housedisplayah_p.setBounds(516, 10, 175, 267);
		house_p.add(housedisplayah_p);
		housedisplayah_p.setLayout(null);
		
		JLabel committeeah_lbl = new JLabel("Committee");
		committeeah_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		committeeah_lbl.setBounds(10, 55, 98, 17);
		housedisplayah_p.add(committeeah_lbl);
		
		committeeah_txtf = new JTextField();
		committeeah_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		committeeah_txtf.setBounds(34, 83, 131, 27);
		housedisplayah_p.add(committeeah_txtf);
		committeeah_txtf.setColumns(10);
		
		JButton displayah_btn = new JButton("Display Members");
		displayah_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String committee = committeeah_txtf.getText();
				
				if (!committee.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					houseah_tbl.setModel(newCon.getTable("Select committeeName, firstName, lastName From Committees "
							+ "Join People On Committees.PID = People.PID Where committeeName = '" + committee + "'"));
					houseah_tbl.doLayout();
					houseah_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelah = houseah_tbl.getColumnModel();
					TableColumn committeenameah = columnModelah.getColumn(0);
					committeenameah.setPreferredWidth(300);
					TableColumn firstNameah = columnModelah.getColumn(1);
					firstNameah.setPreferredWidth(130);
					TableColumn lastNameah = columnModelah.getColumn(2);
					lastNameah.setPreferredWidth(150);
				}
			}
		});
		displayah_btn.setBounds(10, 123, 155, 23);
		housedisplayah_p.add(displayah_btn);
		
		JButton displaycomah_btn = new JButton("Display Committees");
		displaycomah_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				DatabaseConnection newCon = new DatabaseConnection();
				houseah_tbl.setModel(newCon.getTable("Select committeeName From CommitteeNames Where HouseType = 'House of Representatives'"));
				houseah_tbl.doLayout();
				houseah_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
				TableColumnModel columnModelah = houseah_tbl.getColumnModel();
				TableColumn committeenameah = columnModelah.getColumn(0);
				committeenameah.setPreferredWidth(300);
			}
		});
		displaycomah_btn.setBounds(10, 211, 155, 25);
		housedisplayah_p.add(displaycomah_btn);
		
		JPanel senate_p = new JPanel();
		assembly_tab.add(senate_p, "senate_p");
		senate_p.setLayout(null);
		
		JPanel senatebtna_p = new JPanel();
		senatebtna_p.setLayout(null);
		senatebtna_p.setBounds(0, 0, 181, 317);
		senate_p.add(senatebtna_p);
		
		senatebtna_hbtn = new JButton("House of Representatives");
		senatebtna_hbtn.setBounds(10, 29, 157, 38);
		senatebtna_p.add(senatebtna_hbtn);
		
		senatebtna_sebtn = new JButton("State Senate");
		senatebtna_sebtn.setBounds(41, 94, 105, 23);
		senatebtna_p.add(senatebtna_sebtn);
		
		senatebtna_abtn = new JButton("Add");
		senatebtna_abtn.setBounds(45, 148, 89, 23);
		senatebtna_p.add(senatebtna_abtn);
		
		senatebtna_rbtn = new JButton("Remove");
		senatebtna_rbtn.setBounds(45, 210, 89, 23);
		senatebtna_p.add(senatebtna_rbtn);
		
		senatebtna_ubtn = new JButton("Update");
		senatebtna_ubtn.setBounds(45, 267, 89, 23);
		senatebtna_p.add(senatebtna_ubtn);
		
		JPanel senatedisplayas_p = new JPanel();
		senatedisplayas_p.setLayout(null);
		senatedisplayas_p.setBounds(493, 11, 198, 254);
		senate_p.add(senatedisplayas_p);
		
		JLabel committeeas_lbl = new JLabel("Committee");
		committeeas_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		committeeas_lbl.setBounds(10, 55, 98, 17);
		senatedisplayas_p.add(committeeas_lbl);
		
		committeeas_txtf = new JTextField();
		committeeas_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		committeeas_txtf.setColumns(10);
		committeeas_txtf.setBounds(34, 83, 131, 27);
		senatedisplayas_p.add(committeeas_txtf);
		
		JButton displayas_btn = new JButton("Display Members");
		displayas_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent arg0) {
				String committee = committeeas_txtf.getText();
				
				if (!committee.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					senateas_tbl.setModel(newCon.getTable("Select committeeName, firstName, lastName From Committees "
							+ "Join People On Committees.PID = People.PID Where committeeName = '" + committee + "'"));
					senateas_tbl.doLayout();
					senateas_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
					TableColumnModel columnModelas = senateas_tbl.getColumnModel();
					TableColumn committeenameas = columnModelas.getColumn(0);
					committeenameas.setPreferredWidth(300);
					TableColumn firstNameas = columnModelas.getColumn(1);
					firstNameas.setPreferredWidth(130);
					TableColumn lastNameas = columnModelas.getColumn(2);
					lastNameas.setPreferredWidth(150);
				}
			}
		});
		displayas_btn.setBounds(12, 121, 156, 23);
		senatedisplayas_p.add(displayas_btn);
		
		displaycomas_btn = new JButton("Display Committees");
		displaycomas_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				DatabaseConnection newCon = new DatabaseConnection();
				senateas_tbl.setModel(newCon.getTable("Select committeeName From CommitteeNames Where HouseType = 'State Senate'"));
				senateas_tbl.doLayout();
				senateas_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
				TableColumnModel columnModelas = senateas_tbl.getColumnModel();
				TableColumn committeenameas = columnModelas.getColumn(0);
				committeenameas.setPreferredWidth(300);
			}
		});
		displaycomas_btn.setBounds(10, 216, 155, 25);
		senatedisplayas_p.add(displaycomas_btn);
		
		JScrollPane scrollPaneas = new JScrollPane();
		scrollPaneas.setBounds(187, 10, 295, 306);
		senate_p.add(scrollPaneas);
		
		senateas_tbl = new JTable(conas.getTable("Select committeeName From CommitteeNames Where HouseType = 'State Senate'"));
		scrollPaneas.setViewportView(senateas_tbl);
		senateas_tbl.doLayout();
		senateas_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
		TableColumnModel columnModelas = senateas_tbl.getColumnModel();
		TableColumn committeenameas = columnModelas.getColumn(0);
		committeenameas.setPreferredWidth(300);
		
		JPanel addassem_p = new JPanel();
		assembly_tab.add(addassem_p, "addassem_p");
		addassem_p.setLayout(null);
		
		JPanel addbtna_p = new JPanel();
		addbtna_p.setLayout(null);
		addbtna_p.setBounds(0, 0, 181, 317);
		addassem_p.add(addbtna_p);
		
		addbtna_hbtn = new JButton("House of Representatives");
		addbtna_hbtn.setBounds(10, 29, 157, 38);
		addbtna_p.add(addbtna_hbtn);
		
		addbtna_sebtn = new JButton("State Senate");
		addbtna_sebtn.setBounds(41, 94, 105, 23);
		addbtna_p.add(addbtna_sebtn);
		
		addbtna_abtn = new JButton("Add");
		addbtna_abtn.setBounds(45, 148, 89, 23);
		addbtna_p.add(addbtna_abtn);
		
		addbtna_rbtn = new JButton("Remove");
		addbtna_rbtn.setBounds(45, 210, 89, 23);
		addbtna_p.add(addbtna_rbtn);
		
		addbtna_ubtn = new JButton("Update");
		addbtna_ubtn.setBounds(45, 267, 89, 23);
		addbtna_p.add(addbtna_ubtn);
		
		JPanel addaa_p = new JPanel();
		addaa_p.setBounds(191, 11, 500, 306);
		addassem_p.add(addaa_p);
		addaa_p.setLayout(null);
		
		houseaa_rbtn = new JRadioButton("House of Representatives");
		houseaa_rbtn.setFont(new Font("Tahoma", Font.PLAIN, 14));
		houseaa_rbtn.setBounds(138, 74, 195, 23);
		addaa_p.add(houseaa_rbtn);
		
		senateaa_rbtn = new JRadioButton("State Senate");
		senateaa_rbtn.setFont(new Font("Tahoma", Font.PLAIN, 14));
		senateaa_rbtn.setBounds(138, 100, 109, 23);
		addaa_p.add(senateaa_rbtn);
		
		ButtonGroup btngroupaa = new ButtonGroup();
		btngroupaa.add(houseaa_rbtn);
		btngroupaa.add(senateaa_rbtn);
		
		JLabel newcommitteeaa_lbl = new JLabel("New Committee");
		newcommitteeaa_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		newcommitteeaa_lbl.setBounds(138, 171, 109, 23);
		addaa_p.add(newcommitteeaa_lbl);
		
		newcommitteeaa_txtf = new JTextField();
		newcommitteeaa_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		newcommitteeaa_txtf.setBounds(271, 171, 161, 23);
		addaa_p.add(newcommitteeaa_txtf);
		newcommitteeaa_txtf.setColumns(10);
		
		JButton addaa_btn = new JButton("Add");
		addaa_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String committee = newcommitteeaa_txtf.getText();
				
				if (houseaa_rbtn.isSelected() && !committee.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Insert Into CommitteeNames Values('House of Representatives', '" + committee + "')");
				}else if (senateaa_rbtn.isSelected() && !committee.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Insert Into CommitteeNames Values('State Senate', '" + committee + "')");
				}
			}
		});
		addaa_btn.setBounds(200, 245, 89, 23);
		addaa_p.add(addaa_btn);
		
		JPanel removeassem_p = new JPanel();
		assembly_tab.add(removeassem_p, "removeassem_p");
		removeassem_p.setLayout(null);
		
		JPanel removebtna_p = new JPanel();
		removebtna_p.setLayout(null);
		removebtna_p.setBounds(0, 0, 181, 317);
		removeassem_p.add(removebtna_p);
		
		removebtna_hbtn = new JButton("House of Representatives");
		removebtna_hbtn.setBounds(10, 29, 157, 38);
		removebtna_p.add(removebtna_hbtn);
		
		removebtna_sebtn = new JButton("State Senate");
		removebtna_sebtn.setBounds(41, 94, 105, 23);
		removebtna_p.add(removebtna_sebtn);
		
		removebtna_abtn = new JButton("Add");
		removebtna_abtn.setBounds(45, 148, 89, 23);
		removebtna_p.add(removebtna_abtn);
		
		removebtna_rbtn = new JButton("Remove");
		removebtna_rbtn.setBounds(45, 210, 89, 23);
		removebtna_p.add(removebtna_rbtn);
		
		removebtna_ubtn = new JButton("Update");
		removebtna_ubtn.setBounds(45, 267, 89, 23);
		removebtna_p.add(removebtna_ubtn);
		
		JPanel removear_p = new JPanel();
		removear_p.setLayout(null);
		removear_p.setBounds(191, 11, 500, 306);
		removeassem_p.add(removear_p);
		
		housear_rbtn = new JRadioButton("House of Representatives");
		housear_rbtn.setFont(new Font("Tahoma", Font.PLAIN, 14));
		housear_rbtn.setBounds(138, 74, 195, 23);
		removear_p.add(housear_rbtn);
		
		senatear_rbtn = new JRadioButton("State Senate");
		senatear_rbtn.setFont(new Font("Tahoma", Font.PLAIN, 14));
		senatear_rbtn.setBounds(138, 100, 109, 23);
		removear_p.add(senatear_rbtn);
		
		ButtonGroup btngroupar = new ButtonGroup();
		btngroupar.add(housear_rbtn);
		btngroupar.add(senatear_rbtn);
		
		JLabel committeear_lbl = new JLabel("Committee");
		committeear_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		committeear_lbl.setBounds(138, 171, 109, 23);
		removear_p.add(committeear_lbl);
		
		committeear_txtf = new JTextField();
		committeear_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		committeear_txtf.setColumns(10);
		committeear_txtf.setBounds(271, 171, 161, 23);
		removear_p.add(committeear_txtf);
		
		JButton removear_btn = new JButton("Remove");
		removear_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String committee = committeear_txtf.getText();
				
				if (housear_rbtn.isSelected() && !committee.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Delete From CommitteeNames Where HouseType = 'House of Representatives' AND committeeName = '" + committee + "'");
				}else if (senatear_rbtn.isSelected() && !committee.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Delete From CommitteeNames Where HouseType = 'State Senate' AND committeeName = '" + committee + "'");
				}
			}
		});
		removear_btn.setBounds(200, 245, 89, 23);
		removear_p.add(removear_btn);
		
		JPanel updateassem_p = new JPanel();
		assembly_tab.add(updateassem_p, "updateassem_p");
		updateassem_p.setLayout(null);
		
		JPanel updatebtna_p = new JPanel();
		updatebtna_p.setLayout(null);
		updatebtna_p.setBounds(0, 0, 181, 317);
		updateassem_p.add(updatebtna_p);
		
		updatebtna_hbtn = new JButton("House of Representatives");
		updatebtna_hbtn.setBounds(10, 29, 157, 38);
		updatebtna_p.add(updatebtna_hbtn);
		
		updatebtna_sebtn = new JButton("State Senate");
		updatebtna_sebtn.setBounds(41, 94, 105, 23);
		updatebtna_p.add(updatebtna_sebtn);
		
		updatebtna_abtn = new JButton("Add");
		updatebtna_abtn.setBounds(45, 148, 89, 23);
		updatebtna_p.add(updatebtna_abtn);
		
		updatebtna_rbtn = new JButton("Remove");
		updatebtna_rbtn.setBounds(45, 210, 89, 23);
		updatebtna_p.add(updatebtna_rbtn);
		
		updatebtna_ubtn = new JButton("Update");
		updatebtna_ubtn.setBounds(45, 267, 89, 23);
		updatebtna_p.add(updatebtna_ubtn);
		
		JPanel updateau_p = new JPanel();
		updateau_p.setLayout(null);
		updateau_p.setBounds(191, 11, 500, 306);
		updateassem_p.add(updateau_p);
		
		houseau_rbtn = new JRadioButton("House of Representatives");
		houseau_rbtn.setFont(new Font("Tahoma", Font.PLAIN, 14));
		houseau_rbtn.setBounds(138, 74, 195, 23);
		updateau_p.add(houseau_rbtn);
		
		senateau_rbtn = new JRadioButton("State Senate");
		senateau_rbtn.setFont(new Font("Tahoma", Font.PLAIN, 14));
		senateau_rbtn.setBounds(138, 100, 109, 23);
		updateau_p.add(senateau_rbtn);
		
		ButtonGroup btngroupau = new ButtonGroup();
		btngroupau.add(houseau_rbtn);
		btngroupau.add(senateau_rbtn);
		
		JLabel newcommitteeau_lbl = new JLabel("Committee");
		newcommitteeau_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		newcommitteeau_lbl.setBounds(80, 171, 109, 23);
		updateau_p.add(newcommitteeau_lbl);
		
		committeeau_txtf = new JTextField();
		committeeau_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		committeeau_txtf.setColumns(10);
		committeeau_txtf.setBounds(173, 171, 161, 23);
		updateau_p.add(committeeau_txtf);
		
		JButton updateau_btn = new JButton("Update");
		updateau_btn.addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				String committee = committeeau_txtf.getText();
				String upcommittee = updatecommitteeau_txtf.getText();
				
				if (houseau_rbtn.isSelected() && !committee.equals("") && !upcommittee.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Update CommitteeNames Set committeeName = '" + upcommittee + 
							"' Where HouseType = 'House of Representatives' AND committeeName = '" + committee + "'");
				}else if (senateau_rbtn.isSelected() && !committee.equals("") && !upcommittee.equals("")){
					DatabaseConnection newCon = new DatabaseConnection();
					newCon.getTable("Update CommitteeNames Set committeeName = '" + upcommittee + 
							"' Where HouseType = 'State Senate' AND committeeName = '" + committee + "'");
				}
			}
		});
		updateau_btn.setBounds(200, 245, 89, 23);
		updateau_p.add(updateau_btn);
		
		JLabel updateau_lbl = new JLabel("Update");
		updateau_lbl.setFont(new Font("Tahoma", Font.PLAIN, 14));
		updateau_lbl.setBounds(386, 140, 46, 14);
		updateau_p.add(updateau_lbl);
		
		updatecommitteeau_txtf = new JTextField();
		updatecommitteeau_txtf.setFont(new Font("Tahoma", Font.PLAIN, 14));
		updatecommitteeau_txtf.setBounds(344, 171, 146, 23);
		updateau_p.add(updatecommitteeau_txtf);
		updatecommitteeau_txtf.setColumns(10);
		
		
		initbtnp_sbtn.addActionListener(this);
		initbtnp_abtn.addActionListener(this);
		initbtnp_rbtn.addActionListener(this);
		initbtnp_ubtn.addActionListener(this);
		initbtnp_dabtn.addActionListener(this);
		searchbtnp_sbtn.addActionListener(this);
		searchbtnp_abtn.addActionListener(this);
		searchbtnp_rbtn.addActionListener(this);
		searchbtnp_ubtn.addActionListener(this);
		searchbtnp_dabtn.addActionListener(this);
		addbtnp_sbtn.addActionListener(this);
		addbtnp_abtn.addActionListener(this);
		addbtnp_rbtn.addActionListener(this);
		addbtnp_ubtn.addActionListener(this);
		addbtnp_dabtn.addActionListener(this);
		removebtnp_sbtn.addActionListener(this);
		removebtnp_abtn.addActionListener(this);
		removebtnp_rbtn.addActionListener(this);
		removebtnp_ubtn.addActionListener(this);
		removebtnp_dabtn.addActionListener(this);
		updatebtnp_sbtn.addActionListener(this);
		updatebtnp_abtn.addActionListener(this);
		updatebtnp_rbtn.addActionListener(this);
		updatebtnp_ubtn.addActionListener(this);
		updatebtnp_dabtn.addActionListener(this);
		
		initbtnb_vbtn.addActionListener(this);
		initbtnb_gsbtn.addActionListener(this);
		initbtnb_cabtn.addActionListener(this);
		initbtnb_aubtn.addActionListener(this);
		initbtnb_sbtn.addActionListener(this);
		initbtnb_abtn.addActionListener(this);
		initbtnb_rbtn.addActionListener(this);
		initbtnb_ubtn.addActionListener(this);
		initbtnb_dabtn.addActionListener(this);
		votesbtnb_vbtn.addActionListener(this);
		votesbtnb_gsbtn.addActionListener(this);
		votesbtnb_cabtn.addActionListener(this);
		votesbtnb_aubtn.addActionListener(this);
		votesbtnb_sbtn.addActionListener(this);
		votesbtnb_abtn.addActionListener(this);
		votesbtnb_rbtn.addActionListener(this);
		votesbtnb_ubtn.addActionListener(this);
		votesbtnb_dabtn.addActionListener(this);
		gsignedbtnb_vbtn.addActionListener(this);
		gsignedbtnb_gsbtn.addActionListener(this);
		gsignedbtnb_cabtn.addActionListener(this);
		gsignedbtnb_aubtn.addActionListener(this);
		gsignedbtnb_sbtn.addActionListener(this);
		gsignedbtnb_abtn.addActionListener(this);
		gsignedbtnb_rbtn.addActionListener(this);
		gsignedbtnb_ubtn.addActionListener(this);
		gsignedbtnb_dabtn.addActionListener(this);
		cactionbtnb_vbtn.addActionListener(this);
		cactionbtnb_gsbtn.addActionListener(this);
		cactionbtnb_cabtn.addActionListener(this);
		cactionbtnb_aubtn.addActionListener(this);
		cactionbtnb_sbtn.addActionListener(this);
		cactionbtnb_abtn.addActionListener(this);
		cactionbtnb_rbtn.addActionListener(this);
		cactionbtnb_ubtn.addActionListener(this);
		cactionbtnb_dabtn.addActionListener(this);
		authoredbtnb_vbtn.addActionListener(this);
		authoredbtnb_gsbtn.addActionListener(this);
		authoredbtnb_cabtn.addActionListener(this);
		authoredbtnb_aubtn.addActionListener(this);
		authoredbtnb_sbtn.addActionListener(this);
		authoredbtnb_abtn.addActionListener(this);
		authoredbtnb_rbtn.addActionListener(this);
		authoredbtnb_ubtn.addActionListener(this);
		authoredbtnb_dabtn.addActionListener(this);
		searchbtnb_vbtn.addActionListener(this);
		searchbtnb_gsbtn.addActionListener(this);
		searchbtnb_cabtn.addActionListener(this);
		searchbtnb_aubtn.addActionListener(this);
		searchbtnb_sbtn.addActionListener(this);
		searchbtnb_abtn.addActionListener(this);
		searchbtnb_rbtn.addActionListener(this);
		searchbtnb_ubtn.addActionListener(this);
		searchbtnb_dabtn.addActionListener(this);
		addbtnb_vbtn.addActionListener(this);
		addbtnb_gsbtn.addActionListener(this);
		addbtnb_cabtn.addActionListener(this);
		addbtnb_aubtn.addActionListener(this);
		addbtnb_sbtn.addActionListener(this);
		addbtnb_abtn.addActionListener(this);
		addbtnb_rbtn.addActionListener(this);
		addbtnb_ubtn.addActionListener(this);
		addbtnb_dabtn.addActionListener(this);
		removebtnb_vbtn.addActionListener(this);
		removebtnb_gsbtn.addActionListener(this);
		removebtnb_cabtn.addActionListener(this);
		removebtnb_aubtn.addActionListener(this);
		removebtnb_sbtn.addActionListener(this);
		removebtnb_abtn.addActionListener(this);
		removebtnb_rbtn.addActionListener(this);
		removebtnb_ubtn.addActionListener(this);
		removebtnb_dabtn.addActionListener(this);
		updatebtnb_vbtn.addActionListener(this);
		updatebtnb_gsbtn.addActionListener(this);
		updatebtnb_cabtn.addActionListener(this);
		updatebtnb_aubtn.addActionListener(this);
		updatebtnb_sbtn.addActionListener(this);
		updatebtnb_abtn.addActionListener(this);
		updatebtnb_rbtn.addActionListener(this);
		updatebtnb_ubtn.addActionListener(this);
		updatebtnb_dabtn.addActionListener(this);
		
		initbtna_hbtn.addActionListener(this);
		initbtna_sebtn.addActionListener(this);
		initbtna_abtn.addActionListener(this);
		initbtna_rbtn.addActionListener(this);
		initbtna_ubtn.addActionListener(this);
		housebtna_hbtn.addActionListener(this);
		housebtna_sebtn.addActionListener(this);
		housebtna_abtn.addActionListener(this);
		housebtna_rbtn.addActionListener(this);
		housebtna_ubtn.addActionListener(this);
		senatebtna_hbtn.addActionListener(this);
		senatebtna_sebtn.addActionListener(this);
		senatebtna_abtn.addActionListener(this);
		senatebtna_rbtn.addActionListener(this);
		senatebtna_ubtn.addActionListener(this);
		addbtna_hbtn.addActionListener(this);
		addbtna_sebtn.addActionListener(this);
		addbtna_abtn.addActionListener(this);
		addbtna_rbtn.addActionListener(this);
		addbtna_ubtn.addActionListener(this);
		removebtna_hbtn.addActionListener(this);
		removebtna_sebtn.addActionListener(this);
		removebtna_abtn.addActionListener(this);
		removebtna_rbtn.addActionListener(this);
		removebtna_ubtn.addActionListener(this);
		updatebtna_hbtn.addActionListener(this);
		updatebtna_sebtn.addActionListener(this);
		updatebtna_abtn.addActionListener(this);
		updatebtna_rbtn.addActionListener(this);
		updatebtna_ubtn.addActionListener(this);
		
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		//Politicians
		if (e.getSource() == initbtnp_sbtn || e.getSource() == searchbtnp_sbtn || e.getSource() == addbtnp_sbtn || 
				e.getSource() == removebtnp_sbtn || e.getSource() == updatebtnp_sbtn){
			cl_politician_tab.show(politician_tab, "searchpol_p");
		}else if (e.getSource() == initbtnp_abtn || e.getSource() == searchbtnp_abtn || e.getSource() ==  addbtnp_abtn || 
					e.getSource() == removebtnp_abtn || e.getSource() == updatebtnp_abtn){
			cl_politician_tab.show(politician_tab, "add_p");
		}else if (e.getSource() == initbtnp_rbtn || e.getSource() == searchbtnp_rbtn || e.getSource() == addbtnp_rbtn || 
					e.getSource() == updatebtnp_rbtn){
			cl_politician_tab.show(politician_tab, "remove_p");
		}else if (e.getSource() == initbtnp_ubtn || e.getSource() == searchbtnp_ubtn || e.getSource() ==  addbtnp_ubtn || 
					e.getSource() == removebtnp_ubtn || e.getSource() == updatebtnp_ubtn){
			cl_politician_tab.show(politician_tab, "update_p");
		}else if (e.getSource() == initbtnp_dabtn || e.getSource() == searchbtnp_dabtn || e.getSource() ==  addbtnp_dabtn || 
					e.getSource() == removebtnp_dabtn || e.getSource() == updatebtnp_dabtn){
			DatabaseConnection newCon = new DatabaseConnection();
			initp_tbl.setModel(newCon.getTable("Select firstName, lastName, CountyName, pName From People Order By PID"));
			initp_tbl.doLayout();
			initp_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
			TableColumnModel columnModel = initp_tbl.getColumnModel();
			TableColumn colfirstname = columnModel.getColumn(0);
	        colfirstname.setPreferredWidth(130);
	        TableColumn collastname = columnModel.getColumn(1);
	        collastname.setPreferredWidth(150);
	        TableColumn colcountyname = columnModel.getColumn(2);
	        colcountyname.setPreferredWidth(150);
	        TableColumn colpname = columnModel.getColumn(3);
	        colpname.setPreferredWidth(250);
			cl_politician_tab.show(politician_tab, "init_p");
		}
		
		//Bills
		if (e.getSource() == initbtnb_vbtn || e.getSource() == votesbtnb_vbtn || e.getSource() == gsignedbtnb_vbtn || 
				e.getSource() == cactionbtnb_vbtn || e.getSource() == authoredbtnb_vbtn || e.getSource() == searchbtnb_vbtn || 
				e.getSource() == addbtnb_vbtn || e.getSource() == removebtnb_vbtn || e.getSource() == updatebtnb_vbtn){
			cl_bills_tab.show(bills_tab, "votes_p");
		}else if (e.getSource() == initbtnb_gsbtn || e.getSource() == votesbtnb_gsbtn || e.getSource() == gsignedbtnb_gsbtn || 
					e.getSource() == cactionbtnb_gsbtn || e.getSource() == authoredbtnb_gsbtn || e.getSource() == searchbtnb_gsbtn || 
					e.getSource() == addbtnb_gsbtn || e.getSource() == removebtnb_gsbtn || e.getSource() == updatebtnb_gsbtn){
			cl_bills_tab.show(bills_tab, "gsigned_p");
		}else if (e.getSource() == initbtnb_cabtn || e.getSource() == votesbtnb_cabtn || e.getSource() == gsignedbtnb_cabtn || 
					e.getSource() == cactionbtnb_cabtn || e.getSource() == authoredbtnb_cabtn || e.getSource() == searchbtnb_cabtn || 
					e.getSource() == addbtnb_cabtn || e.getSource() == removebtnb_cabtn || e.getSource() == updatebtnb_cabtn){
			cl_bills_tab.show(bills_tab, "caction_p");
		}else if (e.getSource() == initbtnb_aubtn || e.getSource() == votesbtnb_aubtn || e.getSource() == gsignedbtnb_aubtn || 
					e.getSource() == cactionbtnb_aubtn || e.getSource() == authoredbtnb_aubtn || e.getSource() == searchbtnb_aubtn || 
					e.getSource() == addbtnb_aubtn || e.getSource() == removebtnb_aubtn || e.getSource() == updatebtnb_aubtn){
			cl_bills_tab.show(bills_tab, "authored_p");
		}else if (e.getSource() == initbtnb_sbtn || e.getSource() == votesbtnb_sbtn || e.getSource() == gsignedbtnb_sbtn || 
					e.getSource() == cactionbtnb_sbtn || e.getSource() == authoredbtnb_sbtn || e.getSource() == searchbtnb_sbtn || 
					e.getSource() == addbtnb_sbtn || e.getSource() == removebtnb_sbtn || e.getSource() == updatebtnb_sbtn){
			cl_bills_tab.show(bills_tab, "searchbills_p");
		}else if (e.getSource() == initbtnb_abtn || e.getSource() == votesbtnb_abtn || e.getSource() == gsignedbtnb_abtn || 
					e.getSource() == cactionbtnb_abtn || e.getSource() == authoredbtnb_abtn || e.getSource() == searchbtnb_abtn || 
					e.getSource() == addbtnb_abtn || e.getSource() == removebtnb_abtn || e.getSource() == updatebtnb_abtn){
			cl_bills_tab.show(bills_tab, "addbills_p");
		}else if (e.getSource() == initbtnb_rbtn || e.getSource() == votesbtnb_rbtn || e.getSource() == gsignedbtnb_rbtn || 
					e.getSource() == cactionbtnb_rbtn || e.getSource() == authoredbtnb_rbtn || e.getSource() == searchbtnb_rbtn || 
					e.getSource() == addbtnb_rbtn || e.getSource() == removebtnb_rbtn || e.getSource() == updatebtnb_rbtn){
			cl_bills_tab.show(bills_tab, "removebills_p");
		}else if (e.getSource() == initbtnb_ubtn || e.getSource() == votesbtnb_ubtn || e.getSource() == gsignedbtnb_ubtn || 
					e.getSource() == cactionbtnb_ubtn || e.getSource() == authoredbtnb_ubtn || e.getSource() == searchbtnb_ubtn || 
					e.getSource() == addbtnb_ubtn || e.getSource() == removebtnb_ubtn || e.getSource() == updatebtnb_ubtn){
			cl_bills_tab.show(bills_tab, "updatebills_p");
		}else if (e.getSource() == initbtnb_dabtn || e.getSource() == votesbtnb_dabtn || e.getSource() == gsignedbtnb_dabtn || 
					e.getSource() == cactionbtnb_dabtn || e.getSource() == authoredbtnb_dabtn || e.getSource() == searchbtnb_dabtn || 
					e.getSource() == addbtnb_dabtn || e.getSource() == removebtnb_dabtn || e.getSource() == updatebtnb_dabtn){
			DatabaseConnection newCon = new DatabaseConnection();
			initb_tbl.setModel(newCon.getTable("Select Bill_ID, SessionsType, HouseType, name From Bills Join Sessions On Bills.Session_ID = Sessions.Session_ID Order By SessionsType, HouseType"));
			initb_tbl.doLayout();
			initb_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
			TableColumnModel columnModelb = initb_tbl.getColumnModel();
			TableColumn billid = columnModelb.getColumn(0);
			billid.setPreferredWidth(50);
			TableColumn sessionsType = columnModelb.getColumn(1);
	        sessionsType.setPreferredWidth(200);
	        TableColumn houseType = columnModelb.getColumn(2);
	        houseType.setPreferredWidth(200);
	        TableColumn nameb = columnModelb.getColumn(3);
	        nameb.setPreferredWidth(800);
			cl_bills_tab.show(bills_tab, "initbills_p");
		}
		
		//General Assembly
		if (e.getSource() == initbtna_hbtn || e.getSource() == housebtna_hbtn || e.getSource() == senatebtna_hbtn || 
				e.getSource() == addbtna_hbtn || e.getSource() == removebtna_hbtn || e.getSource() == updatebtna_hbtn){
			DatabaseConnection newCon = new DatabaseConnection();
			houseah_tbl.setModel(newCon.getTable("Select committeeName From CommitteeNames Where HouseType = 'House of Representatives'"));
			houseah_tbl.doLayout();
			houseah_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
			TableColumnModel columnModelah = houseah_tbl.getColumnModel();
			TableColumn committeenameah = columnModelah.getColumn(0);
			committeenameah.setPreferredWidth(300);
			cl_assembly_tab.show(assembly_tab, "house_p");
		}else if (e.getSource() == initbtna_sebtn || e.getSource() == housebtna_sebtn || e.getSource() == senatebtna_sebtn || 
					e.getSource() == addbtna_sebtn || e.getSource() == removebtna_sebtn || e.getSource() == updatebtna_sebtn){
			DatabaseConnection newCon = new DatabaseConnection();
			senateas_tbl.setModel(newCon.getTable("Select committeeName From CommitteeNames Where HouseType = 'State Senate'"));
			senateas_tbl.doLayout();
			senateas_tbl.setAutoResizeMode( JTable.AUTO_RESIZE_OFF );
			TableColumnModel columnModelas = senateas_tbl.getColumnModel();
			TableColumn committeenameas = columnModelas.getColumn(0);
			committeenameas.setPreferredWidth(300);
			cl_assembly_tab.show(assembly_tab, "senate_p");
		}else if (e.getSource() == initbtna_abtn || e.getSource() == housebtna_abtn || e.getSource() == senatebtna_abtn || 
					e.getSource() == addbtna_abtn || e.getSource() == removebtna_abtn || e.getSource() == updatebtna_abtn){
			cl_assembly_tab.show(assembly_tab, "addassem_p");
		}else if (e.getSource() == initbtna_rbtn || e.getSource() == housebtna_rbtn || e.getSource() == senatebtna_rbtn || 
					e.getSource() == addbtna_rbtn || e.getSource() == removebtna_rbtn || e.getSource() == updatebtna_rbtn){
			cl_assembly_tab.show(assembly_tab, "removeassem_p");
		}else if (e.getSource() == initbtna_ubtn || e.getSource() == housebtna_ubtn || e.getSource() == senatebtna_ubtn || 
					e.getSource() == addbtna_ubtn || e.getSource() == removebtna_ubtn || e.getSource() == updatebtna_ubtn){
			cl_assembly_tab.show(assembly_tab, "updateassem_p");
		}
	}
}
