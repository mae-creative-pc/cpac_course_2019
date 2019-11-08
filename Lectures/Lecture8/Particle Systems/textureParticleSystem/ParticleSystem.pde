PVector mu=new PVector(0,-1);
float std=.3;

class ParticleSystem{
  ArrayList<Particle> particles;
  PVector origin;
  ParticleSystem(){
    this.particles = new ArrayList<Particle>();
    this.origin=new PVector(width/2, height);
  }
  ParticleSystem(PVector origin){
    this.particles = new ArrayList<Particle>();
    this.origin=origin.copy();
  }
  void addParticle(){
    Particle p=new Particle(this.origin, 10, random(0,255));
    p.velocity = new PVector(randomGaussian(), randomGaussian());
    p.velocity.mult(std);
    p.velocity.add(mu);    
    this.particles.add(p);
  }
  void action(){
    PVector wind= new PVector(map(mouseX, 0, width, -.2, .2),0);
    Particle p;
    for(int i=this.particles.size()-1; i>=0; i--){
      p=this.particles.get(i);
      p.applyForce(wind);
      p.action();
      p.lifespan-=0.3;
      if(p.isDead()){
         particles.remove(i);
         this.addParticle();
      }
    
    }
  }

}
