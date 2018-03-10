int page = 0;
PFont basicFont;
PImage phone;
Screen screen;
int s, lastSecond;
EnergyBar energy;
AppColumn[] columns = new AppColumn[4];
AppColumnLabel[] columnLabels = new AppColumnLabel[4];
String[] messages = {"Tools","Fun","Life","Misc"};
float tempX;
void setup() {
 size(960,540);
 basicFont = createFont("Ariel",20,true);
 
 phone = loadImage("phone.png");
 screen = new Screen(375,90);
 energy = new EnergyBar(screen);
 
 tempX = screen.getX();
 for (int i = 0; i < columns.length; i++) {
    columns[i] = new AppColumn(screen,tempX);
    columns[i].setColor(i);
    tempX += columns[i].getWidth();
    
    columnLabels[i] = new AppColumnLabel(columns[i]);
    columnLabels[i].setMessage(messages[i]);
 }
}


void draw() {
  background(51);
  fill(255); //black
  image(phone,0,0);
  screen.paint();
  energy.paint();
  switch (page) {
    case 0: 
      home();
      break;
    case 1: 
      call();
    case 2: 
      break;
    case 3: 
      wifi();
      break;
    case 4: 
      message();
      break;
    default:
      println("Default triggered...");
  }
  
  //timed events
  s = second();
  if (s != lastSecond) {
    energy.decrease();
    lastSecond = s;
  }
}

class Screen {
   int x,y;
   PFont font;
   String msg = "9";
   boolean isPassword;
   int w = 209;
   int h = 350;
   Screen(int x,int y) {
     this.x = x;
     this.y = y;
   }
   
   void paint() {
     fill(255);
     rect(this.x,this.y,this.w,this.h);
     
   }
   
   int getWidth() { 
     return this.w; 
   }
   
   int getHeight() {
     return this.h; 
   }
   
   int getX() {
    return this.x; 
   }
   
   int getY() {
    return this.y; 
   }
   
   void setMessage(String msg) {
    this.msg = msg; 
   }
}


class AppColumn {
   float x,y,w,h;
   Screen parentScreen;
   color c;
   color[] colors = {#926750, #F4F1BA, #CB8E84, #EECB93};
   float appY;
   
   AppColumn(Screen parentScreen,float x) {
     this.y = parentScreen.getY() + (screen.getHeight() - (screen.getHeight() * 0.98));
     this.w = parentScreen.getWidth() / 4;
     this.h = screen.getHeight() - screen.getHeight()* 0.10;
     this.x = x;
     //this.appY = 
   }
   
   void paint() {
     fill(this.c);
     rect(this.x,this.y,this.w,this.h);
   }
   
   float getWidth() {
     return this.w;
   }
   
   float getX() {
    return this.x; 
   }
   
   float getY() {
    return this.y; 
   }
   
   float getHeight() {
    return this.h; 
   }
   
   void setColor(int colorNum) {
    this.c = colors[colorNum];
   }
   
   float currentAppY() {
     float temp = 0;
     return temp;
   }
   
}

class App {
   float x,y,h,w;
   AppColumn column;
   App(AppColumn parentColumn, int x,int y) {
     this.column = parentColumn;
     this.x = x;
     this.y = y;
   }
   
   void paint() {
     fill(#ff0000);
     rect(this.x,this.y,this.w,this.h);
   }
   
}

class AppLabel {
   App parent;
   int x;
   int y;
   int w = 209;
   int h = 350;
   AppLabel() {
     
     
   }

   void paint() {
     fill(255);
     rect(this.x,this.y,this.w,this.h);
     
   }  
}

class AppColumnLabel {
   float x,y,w,h;
   String message = "title";
   AppColumn parent;
   AppColumnLabel(AppColumn column) {
    this.parent = column;
    this.x = column.getX();
    this.y = column.getY();
    this.w = column.getWidth();
    this.h = column.getHeight() - (column.getHeight() * 0.95);
   }

   void paint() {
     fill(#F7F7DE);
     rect(this.x,this.y,this.w,this.h);
     fill(0);
     text(this.message,this.x + 16,this.y + 12);
   }  
   
   void setMessage(String msg) {
     this.message = msg;
   }
}

class EnergyBar {
   int x,y,maxWidth;
   float h, w;
   color[] settings = { #A5E9CD, #E7D0A8, #E7645B };
   color currentColor = 255;
   Screen parentScreen;
   EnergyBar(Screen screen) {
     this.parentScreen = screen;
     this.maxWidth = screen.getWidth(); 
     this.x = screen.getX();
     this.y = screen.getY();
     this.h = screen.getHeight() - (screen.getHeight() * 0.98);
     this.w = this.maxWidth;
   }

   void paint() {
     if (this.w > (parentScreen.getWidth() * 0.6)) {
      this.setColor("HIGH"); 
     }
     else if (this.w < (parentScreen.getWidth() * 0.6) && this.w > parentScreen.getWidth() * 0.3) {
      this.setColor("MEDIUM"); 
     }
     else {
      this.setColor("LOW"); 
     }
     fill(this.currentColor);
     rect(this.x,this.y,this.w,this.h);
     
   }
   
   void decrease() {
     if (this.w > 0) {
       this.w-=0.2;
     }
     else {
      println("Battery drained"); 
     }
   }
   
   void setColor(String setting) {
     switch (setting) {
      case "HIGH":
        this.currentColor = settings[0];
        break;
      case "MEDIUM":
        this.currentColor = settings[1];
        break;
      case "LOW":
        this.currentColor = settings[2];
        break;
      default:
        println("ERROR IN SETCOLOR -- BAD INPUT");  
        break;
     }
   }
   
}




void home() {
  for (int i = 0; i < columns.length; i++) {
    columns[i].paint(); 
    columnLabels[i].paint();
  }
}

void call() {}

void wifi() {}

void message() {}