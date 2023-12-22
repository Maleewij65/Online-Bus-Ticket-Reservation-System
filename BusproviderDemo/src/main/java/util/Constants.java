package util;

public class Constants {

	public static final String INSERT_BUS = "INSERT INTO buses(name, start_location, destination, departure_time, license_info, registration_no, number_plate) VALUES (?,?,?,?,?,?,?)";
	public static final String UPDATE_BUS = "UPDATE buses SET name=?, start_location=?, destination=?, departure_time=?, license_info=?, registration_no=?, number_plate=? WHERE id=?";
	public static final String DELETE_BUS = "DELETE FROM buses WHERE id = ?";

	public static final String INSERT_USER = "INSERT INTO users(first_name, last_name, mobile, email, password) VALUES (?,?,?,?,?)";
	public static final String UPDATE_USER = "UPDATE users SET first_name=?, last_name=?, mobile=?, email=?, password=? WHERE id=?";
	public static final String UPDATE_USER_NO_PASSWORD = "UPDATE users SET first_name=?, last_name=?, mobile=? WHERE id=?";
	public static final String DELETE_USER = "DELETE FROM users WHERE id = ?";

	public static final String INSERT_FEEDBACK = "INSERT INTO feedback(comment, user_id) VALUES (?,?)";
	public static final String UPDATE_FEEDBACK = "UPDATE feedback SET comment=?, user_id=? WHERE id=?";
	public static final String DELETE_FEEDBACK = "DELETE FROM feedback WHERE id = ?";

	public static final String INSERT_ROUTE = "INSERT INTO routes(departure, arrival, price, duration) VALUES (?,?,?,?)";
	public static final String UPDATE_ROUTE = "UPDATE routes SET departure=?, arrival=?, price=?, duration=? WHERE id=?";
	public static final String DELETE_ROUTE = "DELETE FROM routes WHERE id = ?";
	
	public static final String INSERT_PAYMENT = "INSERT INTO payment(price, booking_id) VALUES (?,?)";
	public static final String UPDATE_PAYMENT = "UPDATE payment SET price=?, paid_date=?, booking_id=? WHERE id=?";
	public static final String DELETE_PAYMENT = "DELETE FROM payment WHERE id = ?";

	public static final String INSERT_BOOKING = "INSERT INTO booking(busId, origin, destination, adult_count, child_count, date, userId) VALUES (?,?,?,?,?,?,?)";
	public static final String UPDATE_BOOKING = "UPDATE booking SET busId=?, origin=?, destination=?, adult_count=?, child_count=?, date=?, userId=? WHERE id=?";
	public static final String DELETE_BOOKING = "DELETE FROM booking WHERE id = ?";

	public static final int ADULT_PRICE = 200;
	public static final int CHILD_PRICE = 120;
	
}