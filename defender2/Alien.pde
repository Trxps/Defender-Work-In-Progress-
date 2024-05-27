abstract class Alien
{
   int number;
  
  public Alien()
  {
  }
  
  public Alien(int number)
  {
    this.number=number;
  }
public boolean visible()
  {    
    Location location = new Location();
    if (location.getY()>height)
      return false;
    else
      return true;
  }
  public int getNumber()
  {
    return number;
  }
  
  
  
 
  abstract void display(); // this display is NOT used (yet)
}
