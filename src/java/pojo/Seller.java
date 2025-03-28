package pojo;
public class Seller {
    private int idseller;
    private String seller_name;
    private String seller_mail;
    private String seller_pswd;
    private String seller_perm="NO";
    public Seller(int idseller, String seller_name, String seller_mail, String seller_pswd, String seller_perm) {
        this.idseller = idseller;
        this.seller_name = seller_name;
        this.seller_mail = seller_mail;
        this.seller_pswd = seller_pswd;
        this.seller_perm = seller_perm;
    }
    public int getId_seller() {
        return idseller;
    }
    public String getseller_name() {
        return seller_name;
    }
    public String getseller_mail() {
        return seller_mail;
    }
    public String getseller_perm() {
        return seller_perm;
    }
    public void setseller_name(String seller_name) {
        this.seller_name = this.seller_name;
    }
    public void setseller_pswd(String seller_pswd) {
        this.seller_pswd = seller_pswd;
    }
    public void setseller_perm(String perm) {
        this.seller_perm = seller_perm;
    }
}
