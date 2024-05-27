public class Game {
    // Define constants and variables
    public static final int GAME_WIDTH = 800;
    public static final int CHARACTER_SIZE = 30;
    public static final int BLOCK_SIZE = 10;
    public static final int NO_OF_STARS = 25;
    public static final int NO_OF_LANDERS = 3;
    public static final int NO_OF_MUTANTS = 1;
    public static final int INITIAL_LIVES = 3;
    public static final int UP = -1;
    public static final int DOWN = 1;
    public static final int FIRE = 0;
    public static final int DEFENDER_STEP = 20;
    public static final int ALIEN_COLOUR_WHITE = 0xffffff;
    public static final int DEFENDER_COLOUR = 0x6d6a7d;
    public static final int LANDER_COLOUR = 0x118f01;
    public static final int MUTANT_COLOUR = 0x800080;
    public static final int BAITER_COLOUR = 0xff0000;
    public static final int PROJECTILE_COLOUR = 0xeb00eb;
    public static final int DEFENDER_X = 50;
    public static final int DEFENDER_MIN_Y = 40;
    public static final int ALIEN_X_MIN = 150;
    public static final int ALIEN_X_MAX = GAME_WIDTH;
    public static final int LANDER_SCORE = 100;
    public static final int MUTANT_SCORE = 300;

    private int STAR_X[];
    private int STAR_Y[];

    private Defender defender;
    private Lander lander;
    // private ArrayList<Lander> landers;
    private Baiter baiter;
    private ScreenData screenData;
    private boolean showHelpScreen = false; // Added boolean variable

    public Game() {
    // Randomise star locations
    randomiseStars();

    // Create defender
    defender = new Defender(new Location(Game.DEFENDER_X, (int)random(0, height)));

    // Create lander no.1
    lander = new Lander(1, new Location((int)random(ALIEN_X_MIN, ALIEN_X_MAX), height + 100)); // Adjusted y-coordinate

    // No Baiter opponent for now (hence null value)
    baiter = null;

    // Create screenData here
    screenData = new ScreenData();

    // Example of creating SpaceObject with Location and speed
    SpaceObject spaceObject1 = new SpaceObject(new Location(100, 100));
    SpaceObject spaceObject2 = new SpaceObject(new Location(0, 0), 2.0f);

    // Optionally print or use these objects to verify their creation
    System.out.println(spaceObject1);
    System.out.println(spaceObject2);
}


    public void action(int value) {
        switch (value) {
            case Game.UP:
                defender.incY(-Game.DEFENDER_STEP);
                break;
            case Game.DOWN:
                defender.incY(Game.DEFENDER_STEP);
                break;
            case Game.FIRE:
                if (defender.getProjectile() == null) {
                    defender.fire();
                }
                break;
        }
    }

   public void update() {
    // Draw stars
    drawStars();

    // Display screen data
    screenData.display();

    // Display spaceship
    defender.display();

    // Try to create a Baiter (if it doesn't exist)
    if (baiter == null) {
        int chance = (int)random(1, 100); // With current framerate we have a 1/10 chance per second that Baiter opponent is created
        if (chance == 1) baiter = new Baiter(new Location(width, (int)random(0, height)));
    }

    // Display lander
    lander.display(); // In Part 1 you may get a runtime error here when you shoot a lander opponent. You'll sort this with ArrayList solution later.

    // Display Baiter (if it exists)
    if (baiter != null) {
        if (baiter.visible()) {
            baiter.display();

            // Later you'll add code here to detect collision with defender

            // Part 2 (lander collisions) - Later you'll add code here to detect collisions with landers
        } else baiter = null;
    }

    // Part 1 (lander off-screen)
    if (!lander.visible()) {
        lander = null;
        lander = new Lander(1, new Location((int)random(ALIEN_X_MIN, ALIEN_X_MAX), 0)); // Create/respawn a new lander
    }

    // If the projectile is fired
    if (defender.getProjectile() != null) {
        // Display the projectiled
        defender.getProjectile().display();

        // Part 1 (projectile collisions with Lander)
        if (lander.intersect(defender.getProjectile()) == true) {
            lander = null;
        }

        // Part 5 (projectile collisions with Baiter)
        // ...

        // Part 1 (reload) - if the projectile goes beyond the right of screen reload!
        // ...
    }

    // Display help screen if toggled
    if (showHelpScreen) {
        // Code to display help screen goes here
        System.out.println("Welcome to Defender\n\na=UP\nz=DOWN\nSPACE=FIRE\nh=HELP\nq=QUIT");
    }
}


    public void toggleHelpScreen() {
        showHelpScreen = !showHelpScreen; // Toggle help screen display
    }

    void randomiseStars() {
        STAR_X = new int[Game.NO_OF_STARS];
        STAR_Y = new int[Game.NO_OF_STARS];
        for (int i = 0; i < Game.NO_OF_STARS; i++) {
            STAR_X[i] = (int)random(0, width);
            STAR_Y[i] = (int)random(0, height);
        }
    }

    void drawStars() {
        // Draw the stars that twinkle
        // Add your star drawing code here
    }
}
