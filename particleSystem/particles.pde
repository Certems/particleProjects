ArrayList<particle> particles = new ArrayList<particle>();

class particle{
    PVector pos;
    PVector vel = new PVector(0,0);
    PVector acc = new PVector(0,0);

    float r;

    particle(PVector position, float radius){
        pos = position;
        r = radius;
        //Set random vel
        float speed = random(0.5,2.5);
        float theta = random(0, 2.0*PI);
        vel.x = speed*cos(theta);
        vel.y = speed*sin(theta);
    }

    void display(){
        pushStyle();

        noFill();
        strokeWeight(0.8*r);
        int pCount = 0;
        for(int i=0; i<particles.size(); i++){
            float dist = vecDist(particles.get(i).pos, pos);
            float threshold = r;
            if(dist < threshold){
                stroke(0,0,0, (dist/threshold)*255);
                pCount++;
                PVector midpoint = vecMidpoint(particles.get(i).pos, pos);
                float mag = width/500.0;
                PVector mOffset = new PVector( random(-mag, mag), random(-mag, mag) );
                
                beginShape();
                curveVertex(pos.x, pos.y);
                curveVertex(pos.x, pos.y);
                //curveVertex(midpoint.x +mOffset.x, midpoint.y +mOffset.y);
                curveVertex(particles.get(i).pos.x, particles.get(i).pos.y);
                curveVertex(particles.get(i).pos.x, particles.get(i).pos.y);
                endShape();
            }
        }

        if(pCount <= 1){
            //If none nearby
            fill(0);
            noStroke();
            ellipse(pos.x, pos.y, r, r);
        }

        popStyle();
    }
    void undulateRadius(){
        float rVal = random(0,1.0);
        if(rVal < 0.3 && r < width/20.0){
            r *= 1.05;}
        if(rVal > 0.7 && r > width/80.0){
            r *= 0.95;}
    }
    void reboundWindow(){
        if(pos.x > width || pos.x < 0){
            vel.x *= -1.0;}
        if(pos.y > height || pos.y < 0){
            vel.y *= -1.0;}
    }
    void calcAcc(){
        acc.x = 0;
        acc.y = 0;
    }
    void calcVel(){
        vel.x += acc.x;
        vel.y += acc.y;
    }
    void calcPos(){
        pos.x += vel.x;
        pos.y += vel.y;
    }
}

void drawParticles(){
    for(int i=0; i<particles.size(); i++){
        particles.get(i).display();
    }
}
void calcParticles(){
    for(int i=0; i<particles.size(); i++){
        particles.get(i).calcAcc();
        particles.get(i).calcVel();
    }
    for(int i=0; i<particles.size(); i++){
        particles.get(i).calcPos();
        particles.get(i).reboundWindow();
    }
    
}
void calcParticleEffects(){
    for(int i=0; i<particles.size(); i++){
        particles.get(i).undulateRadius();
    }
}
void createParticles(int x, float r){
    for(int i=0; i<x; i++){
        particle newParticle = new particle(new PVector(random(0,width), random(0,height)), r);
        particles.add(newParticle);
    }
}