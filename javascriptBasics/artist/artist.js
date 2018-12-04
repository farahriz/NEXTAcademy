/*
  You have come to the right place!

  This function gets called for you somewhere else.
  You just have to modify it to run your own instructions!
*/


// function picasso(){
//   // Replace with your own instructions
//   moveDown(4);
//   moveLeft(4);
//   drawLineUp(8);
//   drawLineRight(6);
//   drawLineDown(8);
//   moveUp(4);
//   drawLineLeft(6);
// }

function picasso(){
  moveDown(1);
  drawLineUp(2);
  moveLeft(1);
  drawLineLeft(1);
  drawLineUp(1);
  drawLineRight(1);
  drawLineDown(1);
  moveRight(2);
  drawLineRight(1);
  drawLineUp(1);
  drawLineLeft(1);
  drawLineDown(1);
  moveDown(3);
  drawLineLeft(2);
};
  

function wavyRiver(){
  drawLineRight(2);
  drawLineDown(2);
  drawLineRight(2);
  drawLineDown(2);
  drawLineRight(2);
  drawLineDown(2);
  moveDown(1);
  moveLeft(2);
  drawLineUp(2);
  drawLineLeft(2);
  drawLineUp(2);
  drawLineLeft(2);
};

function drawSquareBL() {
  drawLineLeft(1);
  drawLineUp(1);
  drawLineRight(1);
  drawLineDown(1);
};

function drawWindows() {
  moveUp(2);
  drawSquareBL();  
  moveUp(2);
  drawSquareBL();  
  moveUp(2);
  drawSquareBL();
}

function building(){
  moveDown(4);
  drawLineLeft(3);
  drawLineUp(7);
  drawLineRight(5);
  drawLineDown(7);
  drawLineLeft(2);
  moveDown(1);
  moveRight(1);
  drawWindows();
  moveDown(6);
  moveLeft(2);
  drawWindows();
};