package test.dto;

import java.util.Date;

public class ReserveDTO {
	
	private String restaurant_number;
	private Date reserve_date;
	private String userid;
	private String deposit;
	private String e_name;
	
	public String getE_name() {
		return e_name;
	}
	public void setE_name(String e_name) {
		this.e_name = e_name;
	}
	public String getRestaurant_number() {
		return restaurant_number;
	}
	public void setRestaurant_number(String restaurant_number) {
		this.restaurant_number = restaurant_number;
	}
	public Date getReserve_date() {
		return reserve_date;
	}
	public void setReserve_date(Date reserve_date) {
		this.reserve_date = reserve_date;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	
	@Override
	public String toString() {
		return "[사업자 등록 번호 = " + restaurant_number + ", 예약시간 = " + reserve_date + ", 고객ID = "
				+ userid + ", 예약금 = " + deposit + "]";
	}

}
