class Button {
  //fields
  Boolean mouseClicked;
  PVector xyPos;
  float Xlength;
  float Xheight;
  float r, g, b;
  
  Button(float posX, float posY, float l, float h, float red, float green, float blue){
    xyPos = new PVector(posX, posY);
    Xlength = l;
    Xheight = h;
    r = red;
    g = green;
    b = blue;
    mouseClicked = false;
  }
  
  //used for buttons that disappear when clicked
  void drawMe(){
    if(r == 255 && g == 255 && b == 255){
      //don't draw, used for hitboxes only
    }
    else{
      if(mouseClicked == true){ 
        //disappears when clicked
      }
      else{
        if(isMouse() == true){
          fill(r*0.8, g*0.8, b*0.8);
        }
        else{
          fill(r, g, b);
        }
        rect(xyPos.x, xyPos.y, Xlength, Xheight, 20);
      }
    }
  }
  
  //used for buttons that don't disappear when clicked
  void drawOtherButton(){
    if(mouseClicked == true || isMouse() == true){
      fill(r*0.8, g*0.8, b*0.8);
      stroke(124,83,79);
      strokeWeight(5);
      rect(xyPos.x, xyPos.y, Xlength, Xheight, 20);
    }
    else{
      fill(r, g, b);
      noStroke();
      rect(xyPos.x, xyPos.y, Xlength, Xheight, 20);
    }
  }
  
  //detects if mouse is on it or not
  boolean isMouse(){
    if(mouseX > xyPos.x && mouseX < xyPos.x+Xlength){
      if(mouseY > xyPos.y && mouseY < xyPos.y+Xheight){
        return true;
      }
      else{
        return false;
      }
    }
    else{
      return false; 
    }
  }
  
  //toggles mouseclicked variable
  void clickMe(){
    if(mouseClicked == false){
      mouseClicked = true;
    }
    else{
      mouseClicked = false;
    }
  }
}
