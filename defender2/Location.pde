public class Location {
    private int x;
    private int y;

    // Parameterized constructor
    public Location(int x, int y) {
        this.x = x;
        this.y = y;
    }

    // Default constructor
    public Location() {
        this.x = 0;
        this.y = 0;
    }

    // Getter and setter methods
    public int getX() {
        return x;
    }

    public void setX(int x) {
        this.x = x;
    }

    public int getY() {
        return y;
    }

    public void setY(int y) {
        this.y = y;
    }

    // Methods to increment coordinates
    public void incX(int x) {
        this.x += x;
    }

    public void incY(int y) {
        this.y += y;
    }
}
