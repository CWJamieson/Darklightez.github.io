int delay=0, rock=0;
int [] rockX = new int [5];
int [] rockY = new int [5];
double [] [] rockspd = new double [5] [2];
int [] rockReal = {0,0,0,0,0};
int rand;
int di, shotnum=0, shots=0, lost = 0, r=1;

int [] shotX = new int[15];
int [] shotY = new int[15];
double [] shotspdX = new double[15];
double [] shotspdY = new double[15];
int start=0;
void setup()
{
   size(600,600);
   background(0);
   
}

void draw()
{
    if(start==1){
    background(0);
    if(lost==1)
    {
       fill(255,0,0);
       ellipse(width/2,height/2,r,r);
       r++;
       if(r>100)
       {
         lose();
       }
    }
    else
    {
    fill(255);
    if(delay==0)
    {
        if(rock==5)
          rock=0;
        rockReal[rock] = 1;
        rand = (int)random(2);
        if(rand%2==0)
        {
           di=600;
        }
        else
        {
           di=0; 
        }
        rand = (int)random(2);
        if(rand%2==0)
        {
           rockX[rock]=di;
           rockY[rock]=(int)random(600);
        }
        else
        {
           rockY[rock]=di;
           rockX[rock]=(int)random(600);
        }
        rockspd[rock][0] = (double)((width/2)-rockX[rock])/((random(2)*3)+50);
        rockspd[rock][1] = (double)((height/2)-rockY[rock])/((random(2)*3)+50);
        rock++;
    }
    //move
    for(int i=0;i<5;i++)
    {
       if(rockReal[i]==1)
       {
          rockX[i] +=rockspd[i][0]; 
          rockY[i] +=rockspd[i][1];
          ellipse(rockX[i],rockY[i],50,50);
          //human collision
          if(abs((width/2)-rockX[i])<25 && abs((height/2)-rockY[i])<25)
          {
            //collision trigger!
             ellipse(width/2+200,height/2,100,100); 
             lost=1;
          }
       }
       
    }
    //fire
    for(int i=0;i<shots;i++)
    {
       shotX[i]+=shotspdX[i];
       shotY[i]+=shotspdY[i];
       
       //shotX.set(i, (int)(shotX.get(i)+shotspdX.get(i))); 
       //shotY.set(i, (int)(shotY.get(i)+shotspdY.get(i)));
       
       fill(255,0,0);
       ellipse(shotX[i],shotY[i],5,5);
       //collision
       for(int j=0;j<5;j++)
       {
          if(rockReal[j]==1)
          {
             if(abs(shotX[i]-rockX[j])<50 &&  abs(shotY[i]-rockY[j])<50)
             {
               //collision trigger!
                 rockReal[j]=0;
             } 
          }
       }
       
    }
    
    fill(255);
    rectMode(CENTER);
    rect(width/2,height/2,20,20);
    delay++;
    if(delay>20)
      delay=0;
    }
    }
}

void mousePressed()
{
   if(start==0)
     start=1;
   else{
   fill(255,0,0);
   shotX[shotnum]=(width/2);
   shotY[shotnum]=(height/2);
   shotspdX[shotnum]=(-((double)(width/2)-mouseX)/10.0);
   shotspdY[shotnum]=(-((double)(height/2)-mouseY)/10.0);
   shotnum++;
   if(shotnum==15)
     shotnum=0;
   if(shots<15)
     shots++;
   }
}

void lose()
{
  
    delay=0;
    rock=0;
    
    for(int i=0;i<5;i++)
    {
       rockReal[i]=0; 
    }
    
    lost = 0;
    r=1;
    shots=0;
    shotnum=0;
    
}