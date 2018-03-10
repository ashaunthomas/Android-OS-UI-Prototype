int screen = 0;
PFont f_title;
PFont f_input;
PImage phone;

void setup() {
 size(800,600);
 f_title = createFont("Ariel",60,true);
 f_input = createFont("Ariel",20,true);
 
}


void draw() {
  background(51);
  textFont(f_title);
  fill(255); //black
  switch (screen) {
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

class InputField {
   int x,y;
   PFont font;
   String msg = "9";
   boolean isPassword;
   int w = 300;
   int h = 50;
   InputField(int x,int y,PFont font,String msg,boolean isPassword) {
     this.x = x;
     this.y = y;
     this.font = font;
     this.msg = msg;
     this.isPassword = isPassword;
   }
   
   void paint() {
     fill(255);
     rect(this.x,this.y,this.w,this.h);
     text(msg,this.x+10,this.y);
     
   }
   
   void setMessage(String msg) {
    this.msg = msg; 
   }
}


void home() {
  InputField pinInput = new InputField(250,300,f_input,"",true);
  pinInput.paint();
}