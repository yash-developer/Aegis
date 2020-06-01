package aegis.silverwing.com.aegis;

/**
 * Created by admin on 18-Mar-18.
 */

public class EmergencyContact {
    private String station;
    private String contact;
    private String area;
    private String latitude;
    private String longitude;
    public EmergencyContact() {

    }

    public EmergencyContact(String station, String contact, String area, String latitude, String longitude) {
        this.station = station;
        this.contact = contact;
        this.area = area;
        this.latitude = latitude;
        this.longitude = longitude;
    }

    public String getStation() {
        return station;
    }

    public void setStation(String station) {
        this.station = station;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }


}
