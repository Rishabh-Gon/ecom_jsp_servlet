package pojo;

import dao.OrderDAO;

public class Order {
    private int order_id;
    private int customer_id;
    private int seller_id;
    private int product_id;
    public Order(int idordr, int idcust, int idsell,int idprod) {
        this.order_id = idordr;
        this.customer_id = idcust;
        this.seller_id = idsell;
        this.product_id = idprod;
    }
    public int getId_seller() {
        return seller_id;
    }
    public int getId_order() {
        return order_id;
    }
    public int getId_customer() {
        return customer_id;
    }
    public int getId_product() {
        return product_id;
    }
    public String getseller_name() {
        return OrderDAO.getSellerName(this.seller_id);
    }
    public String getproduct_name() {
        return OrderDAO.getProductName(this.product_id);
    }
    public String getproduct_desc() {
        return OrderDAO.getProductDesc(this.product_id);
    }
    public String getproduct_price() {
        return OrderDAO.getProductPrice(this.product_id);
    }
    public String getcust_name() {
        return OrderDAO.getCustName(this.customer_id);
    }
    public String getSelr_mail() {
        return OrderDAO.getSelrMail(this.seller_id);
    }
    public String getCust_mail() {
        return OrderDAO.getCustMail(this.customer_id);
    }
}
