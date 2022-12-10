void setup(){
    size(800,800);

    createParticles(100, 30.0);
}
void draw(){
    background(120,120,120);

    drawParticles();
    calcParticles();
    calcParticleEffects();

    overlay();
}
void keyPressed(){
    //pass
}
void mousePressed(){
    //pass
}