int page = 0;
PFont f_title;
PFont f_input;
PImage phone;
Screen screen;
void setup() {
 size(960,540);
 f_title = createFont("Ariel",60,true);
 f_input = createFont("Ariel",20,true);
 phone = loadImage("phone.png");
 screen = new Screen(375,90);
}


void draw() {
  background(51);
  fill(255); //black
  image(phone,0,0);
  screen.paint();
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
   
   void setMessage(String msg) {
    this.msg = msg; 
   }
}


class AppColumn {
   int x,y;
   int w = 209;
   int h = 350;
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





void home() {
  //InputField pinInput = new InputField(250,300,f_input,"",true);
   //pinInput.paint();
}