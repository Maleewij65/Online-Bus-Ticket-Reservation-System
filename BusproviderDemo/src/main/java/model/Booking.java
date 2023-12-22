package model;
public class Booking {
    private int id;
    private int busId;
    private String origin;
    private String destination;
    private int adultCount;
    private int childCount;
    private String date;
    private int userId;

    // Constructors
    public Booking() {
        // Default constructor
    }

    public Booking(int id, int busId, String origin, String destination, int adultCount, int childCount, String date, int userId) {
        this.id = id;
        this.busId = busId;
        this.origin = origin;
        this.destination = destination;
        this.adultCount = adultCount;
        this.childCount = childCount;
        this.date = date;
        this.userId = userId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getBusId() {
        return busId;
    }

    public void setBusId(int busId) {
        this.busId = busId;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public int getAdultCount() {
        return adultCount;
    }

    public void setAdultCount(int adultCount) {
        this.adultCount = adultCount;
    }

    public int getChildCount() {
        return childCount;
    }

    public void setChildCount(int childCount) {
        this.childCount = childCount;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
