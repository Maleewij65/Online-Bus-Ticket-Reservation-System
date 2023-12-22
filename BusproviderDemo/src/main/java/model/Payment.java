package model;

public class Payment {
	private int id;
	private double price;
	private String paidDate;
	private int bookingId;

	public Payment() {

	}

	public Payment(int id, double price, String paidDate, int bookingId) {
		this.id = id;
		this.price = price;
		this.paidDate = paidDate;
		this.bookingId = bookingId;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPaidDate() {
		return paidDate;
	}

	public void setPaidDate(String paidDate) {
		this.paidDate = paidDate;
	}

	public int getBookingId() {
		return bookingId;
	}

	public void setBookingId(int bookingId) {
		this.bookingId = bookingId;
	}
}