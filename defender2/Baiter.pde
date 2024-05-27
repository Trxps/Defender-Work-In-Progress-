public class Baiter extends Alien {
    private Location location;
    private float speed;
    private int direction;

    public Baiter(int number, Location location) {
        super(number);
        this.location = location;
        this.speed = 8.0f;
        this.direction = -1;
    }

    public Location getLocation() {
        return this.location;
    }

    public boolean visible() {
        if (getLocation().getX() + ((int) this.speed * 1) < 0)
            return false;
        else
            return true;
    }

    private void updateX() {
        location.setX(getLocation().getX() + (direction * (int) speed));
    }

    public boolean intersect(Lander lander) {
        if (dist(lander.getLocation().getX() + (Game.CHARACTER_SIZE / 2), lander.getLocation().getY() + (Game.CHARACTER_SIZE / 2), location.getX() + (Game.CHARACTER_SIZE / 2), location.getY() + (Game.CHARACTER_SIZE / 2)) < Game.CHARACTER_SIZE)
            return true;
        else
            return false;
    }

    public String toString() {
        return "Baiter: location=" + getLocation() + ", speed=" + speed + ", direction=" + direction + "]";
    }

    public void display() {
        fill(Game.BAITER_COLOUR);
        stroke(153);

        pushMatrix();
        updateX();
        translate(getLocation().getX(), getLocation().getY());

        rect(0, 0, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(Game.BLOCK_SIZE * 1, 0, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(Game.BLOCK_SIZE * 2, 0, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(0, 10, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(Game.BLOCK_SIZE * 2, 10, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(0, 20, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(0, 20, Game.BLOCK_SIZE * 2, Game.BLOCK_SIZE);
        rect(Game.BLOCK_SIZE * 2, 20, Game.BLOCK_SIZE, Game.BLOCK_SIZE);

        popMatrix();
    }

    // New method to update the Baiter's position
    public void update() {
        location.setX(getLocation().getX() + (direction * (int) speed));
    }
}
