int R=255,G=0,B=0, stg=0, x=10, y=10;
void setup()
{
   size(400,400, OPENGL); 
   background(0);
}
void draw()
{
    fill(R,G,B);
    ellipse(mouseX, mouseY, x, y);
    
    
    if(R==255 && G==0 && B==0)
      stg=0;
    if(R==255 && G==255 && B==0)
      stg=1;
    if(R==0 && G==255 && B==0)
      stg=2;
    if(R==0 && G==255 && B==255)
      stg=3;
    if(R==0 && G==0 && B==255)
      stg=4;
    if(R==255 && G==0 && B==255)
      stg=5;
    
      
      
    if(stg==0)
      G++;
    if(stg==1)
      R--;
    if(stg==2)
      B++;
    if(stg==3)
      G--;
    if(stg==4)
      R++;
    if(stg==5)
      B--;
    
}
void mousePressed()
{
   x++;
   y++;
}
void keyPressed()
{
   if(key == ' ')
   {
     background(0);
     x=10;
     y=10;
   }
}