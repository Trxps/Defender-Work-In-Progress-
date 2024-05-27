public class Lander extends Alien {
    private Location location;
    private float speed;
    private int direction;

    public Lander(int number, Location location) {
        super(number);
        this.location = location;
        this.speed = 2.0f;
        this.direction = 1;
    }

    public Location getLocation() {
        return this.location;
    }

    public float getSpeed() {
        return this.speed;
    }

    public int getDirection() {
        return this.direction;
    }

    private void updateY() {
        getLocation().incY(getDirection() * (int) getSpeed());
    }

    public boolean intersect(Projectile projectile) {
        if (dist(projectile.getLocation().getX() + 30, projectile.getLocation().getY(), getLocation().getX() + (Game.CHARACTER_SIZE / 2), getLocation().getY() + (Game.CHARACTER_SIZE / 2)) < Game.CHARACTER_SIZE / 2)
            return true;
        else
            return false;
    }

    public String toString() {
        return "[Lander: number=" + getNumber() + ", location=" + getLocation() + ", speed=" + speed + ", direction=" + direction + "]";
    }

    public void display() {
        fill(Game.LANDER_COLOUR);
        stroke(153);

        pushMatrix();
        updateY();
        translate(getLocation().getX(), getLocation().getY());

        rect(0, 0, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(Game.BLOCK_SIZE * 2, 0, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(0, 10, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(Game.BLOCK_SIZE * 1, 10, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(Game.BLOCK_SIZE * 2, 10, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(0, 20, Game.BLOCK_SIZE, Game.BLOCK_SIZE);
        rect(Game.BLOCK_SIZE * 2, 20, Game.BLOCK_SIZE, Game.BLOCK_SIZE);

        popMatrix();
    }

    // New method to update the Lander's position
    public void update() {
        getLocation().incY(getDirection() * (int) getSpeed());
    }
}
