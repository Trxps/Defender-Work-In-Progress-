public class SpaceObject {
    private Location location;
    private float speed;

    // Constructor with Location
    public SpaceObject(Location location) {
        this.location = location;
        this.speed = 0.0f;  // default speed
    }

    // Constructor with Location and speed
    public SpaceObject(Location location, float speed) {
        this.location = location;
        this.speed = speed;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }

    public float getSpeed() {
        return speed;
    }

    public void setSpeed(float speed) {
        this.speed = speed;
    }

    @Override
    public String toString() {
        return "SpaceObject{" + "location=" + location + ", speed=" + speed + '}';
    }
}
