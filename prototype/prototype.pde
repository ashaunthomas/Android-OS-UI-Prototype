int page = 0;
PFont f_title;
PFont f_input;
PImage phone;
Screen screen;
int s, lastSecond;
EnergyBar energy;
void setup() {
 size(960,540);
 f_title = createFont("Ariel",60,true);
 f_input = createFont("Ariel",20,true);
 phone = loadImage("phone.png");
 screen = new Screen(375,90);
 energy = new EnergyBar(screen);
 
}


void draw() {
  background(51);
  fill(255); //black
  image(phone,0,0);
  screen.paint();
  energy.paint();
  switch (page) {
    case 0: //login
      home();
      break;
    case 1: //home
      break;
    case 2: //withdraw
      break;
    case 3: //large withdraw confirmation
      break;
    case 4: //deposit
      break;
    case 5: //deposit confirmation
      break;
    case 6: //logout confirmation
      break;
    default:
      println("Default triggered...");
  }
  
  //timed events
  s = second();
  if (s != lastSecond) {
    println("A second elapsed");
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
   int x,y,w,h;
   AppColumn(int x,int y) {
     this.x = x;
     this.y = y;
   }
   
   void paint() {
     fill(255);
     rect(this.x,this.y,this.w,this.h);
     
   }
   
}

class App {
   int x,y;
   int counter;
   int w = 209;
   int h = 350;
   App(int x,int y) {
     this.x = x;
     this.y = y;
   }
   
   void paint() {
     fill(255);
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
   App parent;
   int x;
   int y;
   int w = 209;
   int h = 350;
   AppColumnLabel() {
     
     
   }

   void paint() {
     fill(255);
     rect(this.x,this.y,this.w,this.h);
     
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
  //InputField pinInput = new InputField(250,300,f_input,"",true);
   //pinInput.paint();
}