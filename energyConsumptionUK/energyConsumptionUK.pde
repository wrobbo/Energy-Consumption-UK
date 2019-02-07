//global floats for the energy consumed as a percentage (by fuel)
//these are global as they are updated later so the chart can be:
//changed dynamically:
float electricity = 4;
float gas = 5;
float petroleum = 44;
float solidFuel = 47;
float biomass = 0;
String year = "1970";
//size of the canvas and added noStroke to give a cleaner feel:
void setup() {
  size(640, 360);
  noStroke();
}
//main bulk of the draw function is used for setting up the menu text, columns
//and layout so everything is laid out in a neat and practical way. The global
//floats are used in order to display the percentage and to ensure it is updated
//when the user changes the decade:
void draw() {
  background(170);
  fill(150);
  textSize(14);
  rect(0, 0, 260, height);
  fill(212.5);
  rect(20, 235, 15, 15);
  fill(255);
  text("Biomass" + " " + biomass + "%", 50, 249);
  fill(170);
  rect(20, 260, 15, 15);
  fill(255);
  text("Electricity" + " "  + electricity + "%", 50, 274);
  fill(127.5);
  rect(20, 285, 15, 15);
  fill(255);
  text("Gas" + " "  + gas + "%", 50, 299);
  fill(85);
  rect(20, 310, 15, 15);
  fill(255);
  text("Petroleum" + " "  + petroleum + "%", 50, 324);
  fill(42.5);
  rect(20, 335, 15, 15);
  fill(255);
  text("Solid Fuel" + " "  + solidFuel + "%", 50, 349);
  textSize(24);
  text("Menu and Key", 10, 30);
  textSize(10);
  text("Please press the number that corresponds", 10, 50);
  text("to the date you wish to view:", 10, 62);
  textSize(14);
  text("Total Primary Energy Consumption by Fuel in the UK", 270, 30);
  text("" + year, 430, 50);
  text("1. 1970", 30, 90);
  text("2. 1980", 30, 120);
  text("3. 1990", 30, 150);
  text("4. 2000", 30, 180);
  text("5. 2010", 30, 210);
  //floats in the data multiplied by 3.6 to give a percentage that can be used
  //in a piechart as there are 360 degrees in a circle.
  float[] angles = {(electricity * 3.6), (gas * 3.6), (petroleum * 3.6), (solidFuel * 3.6), (biomass * 3.6)};
  pieChart(280, angles);
}

//piechart code from the processing reference. It looks for the data (supplied by
//the 'angles' array) and constructs arcs based on that data so a full circle is
//formed. Each arc is filled with a different shade of gray depending how many
//elements there are in the array.
void pieChart(float diameter, float[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float gray = map(i, 0, data.length, 0, 255);
    fill(gray);
    arc(width/2 + 130, height/2 + 30, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
    lastAngle += radians(data[i]);
  }
}

//percentages for the consumtion in 1970. Updated when the key is pressed.
//string 'year' is also updated:
void keyPressed() {
  if (key == '1') {
    electricity = 4;
    gas = 5;
    petroleum = 44;
    solidFuel = 47;
    biomass = 0;
    year = "1970";
  }
//percentages for the consumtion in 1980. Updated when the key is pressed.
//string 'year' is also updated:
  if (key == '2') {
    electricity = 5;
    gas = 22;
    petroleum = 37;
    solidFuel = 36;
    biomass = 0;
    year = "1980";
  }
//percentages for the consumtion in 1990. Updated when the key is pressed.
//string 'year' is also updated:
  if (key == '3') {
    electricity = 8;
    gas = 24;
    petroleum = 36;
    solidFuel = 31;
    biomass = 1;
    year = "1990";
  }
//percentages for the consumtion in 2000. Updated when the key is pressed.
//string 'year' is also updated:
  if (key == '4') {
    electricity = 9;
    gas = 41;
    petroleum = 32;
    solidFuel = 17;
    biomass = 1;
    year = "2000";
  }
//percentages for the consumtion in 2010. Updated when the key is pressed.
//string 'year' is also updated:
  if (key == '5') {
    electricity = 7;
    gas = 43;
    petroleum = 32;
    solidFuel = 15;
    biomass = 3;
    year = "2010";
  }
}