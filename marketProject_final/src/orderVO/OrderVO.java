package orderVO;

import java.util.Date;

public class OrderVO {
	
	private String id;
	private String order;
	private int total;
	private int process;
	private Date d;

	
	public OrderVO() {}
	
	
	public OrderVO(String id, String order ,int total, Date d ,int process) {
		this.id = id;
		this.order=order;
		this.total = total;
		this.d = d;
		this.process=process;
	
	}


	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getProcess() {
		return process;
	}

	public void setProcess(int process) {
		this.process = process;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public Date getD() {
		return d;
	}

	public void setD(Date d) {
		this.d = d;
	}

	

}
