int lastMouseX = 0;
int lastMouseY = 0;
color backgroundColor = color(0,0,0);
int circleDiameter = 3;

void setup() {
    size(400,300);
    frameRate(2);
    background(backgroundColor);
}

void draw() {
}

void mousePressed() {
    lastMouseX = mouseX;
    lastMouseY = mouseY;
}

void mouseDragged() {
    int startX = 0;
    int startY = 0;
    int endX = 0;
    int endY = 0;
    int directional = 0;

    if(lastMouseX > mouseX) {
        startX = mouseX;
        endX = lastMouseX;
        directional = 1;
    } else {
        startX = lastMouseX;
        endX = mouseX;
        directional = -1;
    }

    if(lastMouseY > mouseY) {
        startY = mouseY;
        endY = lastMouseY;
        directional *= 1;
    } else {
        startY = lastMouseY;
        endY = mouseY;
        directional *= -1;
    }

    int diffX = endX - startX;
    int diffY = endY - startY;

    double tanTheta = diffY/diffX;

    if(diffX > diffY) {
        for(int x=startX; x<=endX; x++) {
            int relativeY = tanTheta*(x-startX);
            if(directional == 1) {
                drawEllipse(x, startY+relativeY);
            } else {
                drawEllipse(x, endY-relativeY);
            }
        }
    } else {
        for(int y=startY; y<=endY; y++) {
            int relativeX = (y-startY)/tanTheta;
            if(directional == 1) {
                drawEllipse(startX+relativeX, y);
            } else {
                drawEllipse(endX-relativeX, y);
            }
        }
    }

    lastMouseX = mouseX;
    lastMouseY = mouseY;
}

void drawEllipse(int x, int y) {
    if(x>0 && y>0) {
        color c = color(x*225/(window.innerWidth-1)+31, y*225/(window.innerHeight-1)+31, 175);
        noStroke();
        fill(c);
        ellipse(x, y, circleDiameter, circleDiameter);
    }
}
