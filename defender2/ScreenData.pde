public class ScreenData
{
  private int score;
  private int lives;

  public ScreenData()
  {
    score=0;
    lives=Game.INITIAL_LIVES;
  }
  public ScreenData(int score, int lives)
  {
    this.score = score;
    this.lives = lives;
  }
  public int getScore()
  {
    return score;
  }
  public void setScore( int score)
  {
    this.score = score;
  }
  public int getLives()
  {
    return lives;
  }
  public void setLives(int lives)
  {
    this.lives = lives;
  }
  public void incScore(int value)
  {
    score += value;
  }
  public void addLife()
  {
    lives += 1;
  }
  public void loseLife()
  {
    lives -= 1;
  }
  
  public String toString(){
    String screenData;
    screenData =("ScreenData: score="+score+", lives="+lives);
    return screenData;
  }
  public void display()
  {
    textSize(28);
    fill(153);    
    // display lives and score
    textSize(32);
    text("Score:"+score, 0, 30);
    text("Lives:"+lives, width-110, 30);
    
  }
  
}
