package model;

public class Bus {
	private String id;
    private String name;
    private String startLocation;
    private String destination;
    private String departureTime;
    private String licenseInfo;
    private String registrationNo;
    private String numberPlate;

    public Bus() {
    }
    
    public Bus(String name, String startLocation, String destination, String departureTime, String licenseInfo, String registrationNo, String numberPlate) {
        this.name = name;
        this.startLocation = startLocation;
        this.destination = destination;
        this.departureTime = departureTime;
        this.licenseInfo = licenseInfo;
        this.registrationNo = registrationNo;
        this.numberPlate = numberPlate;
    }

    public Bus(String id, String name, String startLocation, String destination, String departureTime, String licenseInfo, String registrationNo, String numberPlate) {
        this.id = id;
        this.name = name;
        this.startLocation = startLocation;
        this.destination = destination;
        this.departureTime = departureTime;
        this.licenseInfo = licenseInfo;
        this.registrationNo = registrationNo;
        this.numberPlate = numberPlate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartLocation() {
        return startLocation;
    }

    public void setStartLocation(String startLocation) {
        this.startLocation = startLocation;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getLicenseInfo() {
        return licenseInfo;
    }

    public void setLicenseInfo(String licenseInfo) {
        this.licenseInfo = licenseInfo;
    }

    public String getRegistrationNo() {
        return registrationNo;
    }

    public void setRegistrationNo(String registrationNo) {
        this.registrationNo = registrationNo;
    }

    public String getNumberPlate() {
        return numberPlate;
    }

    public void setNumberPlate(String numberPlate) {
        this.numberPlate = numberPlate;
    }
}
