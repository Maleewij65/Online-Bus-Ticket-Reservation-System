package model;

public class Route {
	private int id;
	private String departure;
    private String arrival;
    private double price;
    private String duration;

    public Route() {
    }

    public Route(String departure, String arrival, double price, String duration) {
        this.departure = departure;
        this.arrival = arrival;
        this.price = price;
        this.duration = duration;
    }

    public Route(int id, String departure, String arrival, double price, String duration) {
        this.id = id;
        this.departure = departure;
        this.arrival = arrival;
        this.price = price;
        this.duration = duration;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getDeparture() {
        return departure;
    }

    public void setDeparture(String departure) {
        this.departure = departure;
    }

    public String getArrival() {
        return arrival;
    }

    public void setArrival(String arrival) {
        this.arrival = arrival;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }
}
