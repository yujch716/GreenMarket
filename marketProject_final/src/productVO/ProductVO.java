package productVO;

public class ProductVO {
	
	private String pro_name;
	private int pro_price;
	private String pro_dec;
	private int pro_amount;
	private String pro_cate;
	private String pro_uri;
	
	public ProductVO() {}
	
	public ProductVO(String pro_name, int pro_price, int pro_amount) {
		super();
		this.pro_name = pro_name;
		this.pro_price = pro_price;
		this.pro_amount = pro_amount;
	}
	
	public ProductVO(String pro_name, int pro_price, String pro_dec, int pro_amount, String pro_cate, String pro_uri) {
		super();
		this.pro_name = pro_name;
		this.pro_price = pro_price;
		this.pro_dec = pro_dec;
		this.pro_amount = pro_amount;
		this.pro_cate = pro_cate;
		this.pro_uri = pro_uri;
	}
	
	public String getPro_uri() {
		return pro_uri;
	}

	public void setPro_uri(String pro_uri) {
		this.pro_uri = pro_uri;
	}

	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public String getPro_dec() {
		return pro_dec;
	}
	public void setPro_dec(String pro_dec) {
		this.pro_dec = pro_dec;
	}
	public int getPro_amount() {
		return pro_amount;
	}
	public void setPro_amount(int pro_amount) {
		this.pro_amount = pro_amount;
	}
	public String getPro_cate() {
		return pro_cate;
	}
	public void setPro_cate(String pro_cate) {
		this.pro_cate = pro_cate;
	}
	
	

	
	
}