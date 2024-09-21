String scaleText = "🟩 "; // A character representing the scale
float scaleWidth;         // Variable to hold the scale width
float scaleHeight = 28;  // Height of each scale
float widthMultiplier = 3; // Set to 4 for  width

void setup() {
  size(400, 380);  // Size of the canvas
  noLoop();        // Stops the draw() function from repeating
  scaleWidth = textWidth(scaleText) * widthMultiplier; // Calculate the width of the scale based on the text
}

void draw() {
  background(20); // Black background
  int rows = 15;         // Number of rows of scales
  int cols = 10;        // Number of columns of scales
  
  // Nested loops to create a pattern of scales
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      float x = j * scaleWidth + (i % 2) * (scaleWidth / 2); // Offset for a staggered effect
      float y = i * scaleHeight;
      scale(x, y); // Call the scale function
    }
  }
}

void scale(float x, float y) {
  // Create a shape for the scale using curves and the text
  fill(100, 200, 100); // Green color
  stroke(50, 100, 50); // Darker outline color
  strokeWeight(2);
  
  beginShape();
  // Top curve
  curveVertex(x + scaleWidth * 0.5, y);
  curveVertex(x + scaleWidth * 0.75, y - scaleHeight * 0.5);
  curveVertex(x + scaleWidth, y);
  // Bottom curve
  curveVertex(x + scaleWidth, y + scaleHeight);
  curveVertex(x + scaleWidth * 0.75, y + scaleHeight * 0.5);
  curveVertex(x + scaleWidth * 0.5, y + scaleHeight);
  endShape(CLOSE);

  // Draw the text in the middle of the scale
  fill(255); // White text color
  textAlign(CENTER, CENTER);
  text(scaleText, x + scaleWidth / 2, y + scaleHeight / 2);

  // Add some texture to the scale with ellipses
  fill(150, 255, 150, 100); // Lighter green with transparency
  for (int i = 0; i < 3; i++) {
    float rx = random(x + 10, x + scaleWidth - 10);
    float ry = random(y + 10, y + scaleHeight - 10);
    ellipse(rx, ry, random(5, 15), random(5, 15));
  }
}
