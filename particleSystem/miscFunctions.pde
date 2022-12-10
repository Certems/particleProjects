void overlay(){
    pushStyle();

    textSize(20);
    fill(255);
    text(frameRate, 25, 25);

    popStyle();
}

float vecDist(PVector v1, PVector v2){
    return sqrt( pow(v1.x - v2.x, 2) + pow(v1.y - v2.y, 2) );
}
PVector vecMidpoint(PVector v1, PVector v2){
    return new PVector( (v1.x+v2.x)/2.0, (v1.y+v2.y)/2.0 );
}