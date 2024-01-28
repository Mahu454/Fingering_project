class MasteryList {
  //fields
  PVector xyPos;
  float Xheight, Xlength, yAdjust, yCoor;
  String[] textFile;
  PImage picture;
  SheetMusic sheet;
  
  MasteryList(float x, float y, float l, float h, String[] text, PImage p, SheetMusic m){
    xyPos = new PVector(x, y);
    Xheight = h;
    Xlength = l;
    textFile = new String[text.length];
    arrayCopy(text, textFile);
    printArray(textFile);
    println(textFile[0], textFile[0].charAt(textFile[0].length()-1));
    picture = p;
    sheet = m;
    sheet.size = Xheight/15;
    yAdjust = 0;
  }
  
  void drawMe(){
    imageMode(CORNER);
    image(picture, xyPos.x, xyPos.y, Xlength, Xheight);
    yCoor = xyPos.y + Xheight*0.15 +yAdjust;
    float maxY = xyPos.y+Xheight*0.85-(Xheight/30);
    float xCoor = xyPos.x + Xlength*0.25;
    
    //draws the scrolling line indicator
    float yScroll;
    if(instrument.equals("flute")){
      yScroll = map(yAdjust, -2660, 0, maxY*1.05, xyPos.y+Xheight*0.1);
    }
    else{
      yScroll = map(yAdjust, -2230, 0, maxY*1.05, xyPos.y+Xheight*0.1);
    }
    strokeWeight(10);
    stroke(124,83,79);
    line(xyPos.x+Xlength*0.85, yScroll, xyPos.x+Xlength*0.85, yScroll+Xheight/30);
    for(int i = 0; i<textFile.length; i++){
      fill(0);
      textAlign(LEFT, CENTER);
      textSize(Xheight/35);
      if(yCoor > xyPos.y + Xheight*0.1 && yCoor < maxY*1.1){
        text(textFile[i].substring(0, textFile[i].length()-1), xCoor, yCoor);
        sheet.noteIndex = i;
        sheet.xyPos = new PVector(xyPos.x + Xlength*0.15, yCoor+sheet.size/3);
        sheet.drawMe();
        float tempX = xCoor*1.69;
        String counter = str(textFile[i].charAt(textFile[i].length()-1));
        for(int j = 0; j < int(counter); j++){
          image(star, tempX, yCoor-Xheight/36, sheet.size, sheet.size);
          tempX += sheet.size;
        }
      }
      yCoor += Xheight/10;
    }
  }
}
