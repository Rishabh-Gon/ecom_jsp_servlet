package pojo;
public class Customer {
    private int id_cust;
    private String cust_name;
    private String cust_mail;
    private String cust_pswd;
    public Customer(int id_cust, String cust_name, String cust_mail, String cust_pswd) {
        this.id_cust = id_cust;
        this.cust_name = cust_name;
        this.cust_mail = cust_mail;
        this.cust_pswd = cust_pswd;
    }
    public int getId_cust() {
        return id_cust;
    }
    public String getCust_name() {
        return cust_name;
    }
    public String getCust_mail() {
        return cust_mail;
    }
    public void setCust_name(String cust_name) {
        this.cust_name = cust_name;
    }
    public void setCust_pswd(String cust_pswd) {
        this.cust_pswd = cust_pswd;
    }    
}
