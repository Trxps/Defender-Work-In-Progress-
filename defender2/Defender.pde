public class Defender
{
  private Location location;
  private Projectile projectile;
  
  public Defender(Location location)
  {
    this.location = location;
    this.projectile=null;
  }
  
  public Location getLocation()
  {
    return location;
  }
  
  void incY(int direction) 
  {
    getLocation().incY(direction);
  }
  
  void incX(int direction) 
  {
    getLocation().incX(direction);
  }
  

  public Projectile getProjectile()
  {
    return projectile;
  }

  public void fire()
  {
    projectile = new Projectile(getLocation().getY());
  }
  
  public void reloadProjectile() {
  projectile = null;
}
  
  public String toString(){
    String defender =("Defender: location= [Location :x ="+getLocation().getX()+
    ", y="+getLocation().getY()+"], projectile=[ Projectile: x = "+getLocation().getX()+
    ", y="+getLocation().getY()+"]");
    return defender;
  }
    
    





   
  public void display() 
  {
    fill(Game.DEFENDER_COLOUR);
    stroke(153);

    pushMatrix();   
    translate(getLocation().getX(), getLocation().getY());
    
    rect( 0, 0,Game.BLOCK_SIZE,Game.BLOCK_SIZE);                                                                rect(Game.BLOCK_SIZE*1, 0,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect( 0, 10,Game.BLOCK_SIZE,Game.BLOCK_SIZE);  rect(Game.BLOCK_SIZE*1,10,Game.BLOCK_SIZE,Game.BLOCK_SIZE);  rect(Game.BLOCK_SIZE*2,10,Game.BLOCK_SIZE,Game.BLOCK_SIZE);
    rect( 0, 20,Game.BLOCK_SIZE,Game.BLOCK_SIZE);                                                               rect(Game.BLOCK_SIZE*1,20,Game.BLOCK_SIZE,Game.BLOCK_SIZE); 
    
    popMatrix();
  }
}
