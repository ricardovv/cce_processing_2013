//PRESENT IN MAIN APP
float gridUnit = 20;
float visualX = 0;
float visualY = 0;//160
float visualW = 1020; 
float visualH = 700-gridUnit*2; 

float visualPosX = 240;
float visualPosY = 160;
float visualAreaW;//Width elements
float visualAreaH;//Height Elements


//TOPICS - CHAPTERS & ARTICLES DATA
String[] chaptersNumber = {"I","II","III","IV","V","VI","VII","VIII","IX","X","XI","XII","XIII","XIV","XV","TD"}; 
String[] chaptersTitle = {"Bases of Institutionally","Nationality and Citizenship","Constitutional Rights and Duties","Government","National Congress","Judicial Power","Public Ministry","Constitutional Tribunal","Electoral Justice","Office of the Comptroller General of the Republic","Armed Forces, Forces of Order and Public Security","Council of National Security","Central Bank","Government & Interior Administration of the State","Reform of the Constitution","Transitory Provisions"}; 
int[] chapterStartAt = {1,10,19,24,46,76,83,92,95,98,101,106,108,110,129,132};
int[] articlesCategory = {3,1,2,1,2,2,2,3,3,3,2,2,2,2,1,3,2,3,19,2,3,2,3,2,3,4,3,3,4,3,1,6,2,2,2,1,3,3,3,1,4,3,3,3,2,3,1,1,2,2,1,3,6,5,5,2,1,4,3,2,4,3,1,5,4,4,3,3,2,2,3,3,1,3,2,2,3,4,5,2,3,2,2,4,3,3,3,3,2,2,1,1,4,9,3,4,3,1,3,4,2,3,1,2,3,2,3,3,1,3,2,3,2,4,2,4,2,1,4,3,2,2,2,2,3,1,3,2,3,3,3,1,3,1,2,1,1,1,3,2,1,1,1,3,4,3,1,1,1,1,1,1,1,2,3,1,2};
int[] articlesIdNumber = { 
  1, 2, 3, 4, 5, 6, 7, 8, 9, 
  10,11,12,13,14,15,16,17,18, 
  19,20,21,22,23, 
  24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,
  47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,
  77,78,79,80,81,82,83,
  84,85,86,87,88,89,90,91,92,
  93,94,95,
  96,97,98,
  99,100,101,
  102,103,104,105,106,
  107,108,
  109,110,
  111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,
  129,130,131,
  132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157  
};
String[] articlesTitNumber = { 
  "1","2","3","4","5","6","7","8","9",
  "10","11","12","13","14","15","16","17","18",
  "19","20","21","22","23",
  "24","25","26","27","28","29","30","31","32","33","34","35","36","37","37 bis","38","39","40","41","42","43","44","45",
  "46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75",
  "76","77","78","79","80","81","82",
  "83","84","85","86","87","88","89","90","91",
  "92","93","94",
  "95","96","97",
  "98","99","100",
  "101","102","103","104","105",
  "106","107",
  "108","109",
  "110","111","112","113","114","115","116","117","118","119","120","121","122","123","124","125","126","126 bis",
  "127","128","129",
  "1st","2nd","3th","4th","5th","6th","7th","8th","9th","10th","11th","12th","13th","14th","15th","16th","17th","18th","19th","20th","21th","22th","23th","24th","25th","26th"
/*"FIRST","SECOND","THIRTH","FOURTH","FIFTH","SIXTH","SEVENTH","EIGHT","NINTH","TENTH","ELEVENTH","TWELFTH","THIRTEENTH","FOURTEENTH","FIFTEENTH","SIXTEENTH","SEVENTEENTH","EIGHTEENTH","NINETEENTH","TWENTY","TWENTY FIRST","TWENTY SECOND","TWENTY THIRTH","TWENTY FOURTH","TWENTY FIFTH","TWENTY SIXTH"*/
};
int numberOfArticles = articlesIdNumber.length;

//Boxes Values
float[] bH = new float[articlesCategory.length];
float[] posY = new float[articlesCategory.length+1];
float articleBoxW = 40.0;
int bHinitial = 12;
float newPosX = 0;
float newPosY = 0;
int countToRight = 0;
float sep = 1.0;
//Boxes Chapters
float boxChapterH = gridUnit;
float boxChapterW = articleBoxW;
float boxChapterX;
float boxChapterY;




void setup() {// - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
  size(1000, 700);background(80);
  noStroke();
  smooth();
  frameRate(1);
//PRESENT IN MAIN APP  
//  visualAreaW = visualW - gridUnit*2;//Width elements
//  visualAreaH = visualH - gridUnit*9;//Height Elements

}//CLOSE SETUP - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





void draw(){// - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
background(80);
  

  chaptersTopDisplay();
  checkCategory();
  
//    for(int i=0; i<numberOfArticles; i++){
//      rect( newPosX ,newPosY  , articleBoxW-sep*5, bH[i]-sep );
//    }
guiSimulation();
}//CLOSE DRAW - - - - - - - - - - - - - - - - - - - - - - - - - - - - 





//1- CHECK CATEGORY  - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void checkCategory(){
  //FOR POSITION Y
  posY[0] = 0;//starting at...
  for(int i=0; i<articlesCategory.length; i++){
    fill(200);
    //1- CHECK CATEGORY HEIGHT OR WIDTHS
    if(articlesCategory[i]==1){ bH[i]  = bHinitial*1.0; }//category 1 & 2 the same
    if(articlesCategory[i]==2){ bH[i]  = bHinitial*1.0; }
    if(articlesCategory[i]==3){ bH[i]  = bHinitial*1.5; }
    if(articlesCategory[i]==4){ bH[i]  = bHinitial*2.0; }//4 & 5 equals
    if(articlesCategory[i]==5){ bH[i]  = bHinitial*2.0; }
    if(articlesCategory[i]==6){ bH[i]  = bHinitial*2.5; }
    if(articlesCategory[i]==7){ bH[i]  = bHinitial*3.0; }// from here 1 point less
    if(articlesCategory[i]==8){ bH[i]  = bHinitial*3.0; }
    if(articlesCategory[i]==9){ bH[i]  = bHinitial*3.5; }
    if(articlesCategory[i]==10){ bH[i] = bHinitial*4.0; }
    if(articlesCategory[i]==11){ bH[i] = bHinitial*4.5; }
    if(articlesCategory[i]==12){ bH[i] = bHinitial*6.0; }
    if(articlesCategory[i]==13){ bH[i] = bHinitial*6.5; }
    if(articlesCategory[i]==14){ bH[i] = bHinitial*7.0; }
    if(articlesCategory[i]==15){ bH[i] = bHinitial*7.5; }
    if(articlesCategory[i]==16){ bH[i] = bHinitial*8.0; }
    if(articlesCategory[i]==17){ bH[i] = bHinitial*8.5; }
    if(articlesCategory[i]==18){ bH[i] = bHinitial*9.0; }
    if(articlesCategory[i]==19){ bH[i] = bHinitial*9.5; }

   //2- CHECK THE STARTING ARTICE NUMBER TO ASIGN NEW X POS TO THE RIGHT
    for(int j=0; j<chapterStartAt.length; j++){
      if(articlesIdNumber[i] == chapterStartAt[j]){
        posY[i] = 0;
        posY[i+1] = posY[i]+bH[i];  
        if(chapterStartAt[j]>1  &&  articlesIdNumber[i]<157) {  countToRight = countToRight+1; } //to aoid to move one more W at start 
      }else {
        posY[i+1] = posY[i]+bH[i];  
      }//close if 
    }//CLOSE LOOP 2
  
    //STORE NEW POSITIONS
    newPosX = visualPosX + articleBoxW*countToRight;
    newPosY = visualPosY + posY[i] + sep;
    //DRAW BOXES
    rect( newPosX ,newPosY  , articleBoxW-sep*5, bH[i]-sep );
    //DRAW TEXT
    textSize(8);fill(100);
    text(i+1, 2+newPosX, newPosY+8);

  }//CLOSE FOR 1- CHECK CATEGORY
}

//1- CLOSE CHECK CATEGORY  - - - - - - - - - - - - - - - - - - - - - - - - - - - - 



//BOXES CHAPTERS TOP - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
void chaptersTopDisplay(){
  for (int i=0; i<chaptersNumber.length; i++) {
      boxChapterX = visualPosX + boxChapterW*i;
      boxChapterY = visualPosY - boxChapterH;
      
      fill(240, 100, 20);
      rect(boxChapterX, boxChapterY, boxChapterW-sep*5, boxChapterH);//boxes each section, negative value to show at -height
      fill(250);textAlign(LEFT);textSize(10);
      text(chaptersNumber[i], 4+visualPosX+articleBoxW*i, boxChapterY+10);//boxes each article
      //BOXES ARTICLES
      if (i == 15) {//select first columt to color
        fill(150, 200, 250);
      }else {
        fill(200, 240, 240);
      }
    //BOX VIS ARTICLE TOP ROLLOVER
    if (  (mouseX>boxChapterX && mouseX<boxChapterX+articleBoxW-sep*5)  &&  (mouseY>boxChapterY && mouseY<boxChapterY+boxChapterH)  ) {
      detailsOverVisualizationChapter( mouseX, visualPosY, chaptersTitle[i], "Topic 1, Topic 2, Topic 3, Topic 4, Topic 5, Topic 6" );
    }
  }//close for
}//CLOSE chaptersTopDisplay - - - - - - - - - - - - - - - - - - - - - - - - - - - - 




//OVER VISUALIZATIONS CHAPTER TOP
void detailsOverVisualizationChapter( float _newPosBoxX, float _newPosBoxY, String _chapterTitle, String _chapterDescription ) {  
  int boxW = 260;
  int boxH = 70;
  int boxPosX = -boxW/2;
  int dis = 4;
  noStroke();

  pushMatrix();
    //CHECK IF IS BEYOND WIDTH
    translate(_newPosBoxX, visualPosY-90);
    //TRIANGLE BELOW GRIS
    fill(50, 150); //COLOR BG colorTop[13]-200 
    triangle(-10+dis, dis+boxH-10, 10+dis, dis+boxH-10, 0+dis, dis+boxH);
    rect(boxPosX+dis, -10+dis, boxW, boxH);
    //BOX AND TRIANGE OVER
    fill(250, 150, 50); //COLOR TEXT 
    triangle(-10, boxH-10, 10, boxH-10, 0, boxH);
    rect(boxPosX, -10, boxW, boxH);
    //TEXT
    fill(50);
    textSize(12);
    textAlign(CENTER);textLeading(14);
    text(_chapterTitle, boxPosX+10, -4, boxW-20, boxH-15 );
    textSize(10);
    text(_chapterDescription, boxPosX+10, 35, boxW-20, boxH );
  popMatrix();
}//CLOSE detailsOverVisualizationChapter


void guiSimulation(){
int sz = 40;
fill(20, 100, 200); rect(0, 0, sz, sz);
fill(20, 160, 180); rect(sz, 0, sz, sz);
fill(20, 160, 100); rect(sz*2, 0, sz, sz); textSize(18);
fill(20, 130, 80); rect(sz*3, 0, sz, sz);

fill(180); rect(0, sz, sz*4, sz);
fill(240); textAlign(LEFT); text("TITLE SECTION", 10, sz+25);

fill(40, 50, 60); rect(0, sz*3, sz*4, sz);
fill(50, 60, 80); rect(0, sz*4, sz*4, sz*20);//boc topics
}//ENGD GUI SIMULATION
