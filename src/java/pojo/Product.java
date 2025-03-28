package pojo;
public class Product {
    private int product_id;
    private int seller_id;
    private String product_name;
    private double product_price;
    private String product_pd;
    private String product_perm="NO";
    public Product(int product_id, int seller_id, String product_name, double product_price, String prodct_pd, String product_perm) {
        this.seller_id = seller_id;
        this.product_id = product_id;
        this.product_name = product_name;
        this.product_price = product_price;
        this.product_pd = prodct_pd;
        this.product_perm = product_perm;
    }
    public int getId_prod() {
        return product_id;
    }
    public int getProdseller_id() {
        return seller_id;
    }
    public String getProd_name() {
        return product_name;
    }
    public String getProd_pd() {
        return product_pd;
    }
    public double getProd_price() {
        return product_price;
    }
    public String getProd_perm() {
        return product_perm;
    }
    public void setProd_perm(String perm) {
        this.product_perm = perm;
    }
}