package cartVO;

import productVO.ProductVO;

public class CartVO {
	ProductVO cart_pvo;
	int cart_amount;
	
	
	
	public CartVO(ProductVO cart_pvo, int cart_amount) {
		super();
		this.cart_pvo = cart_pvo;
		this.cart_amount = cart_amount;
	}
	public ProductVO getCart_pvo() {
		return cart_pvo;
	}
	public void setCart_pvo(ProductVO cart_pvo) {
		this.cart_pvo = cart_pvo;
	}
	public int getCart_amount() {
		return cart_amount;
	}
	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
	}

}
