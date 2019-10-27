#include "ParticleSystem.h"

void ParticleSystem::spawn(Particle particle){
    if (particles.size() < max_size){
        particles.push_back(particle);
    }
}

void ParticleSystem::kill(int id){
    Particle tmp = particles[id];
    particles[id] = particles.back();
    particles.back() = tmp;

    particles.pop_back();
}

void ParticleSystem::process_particles(float dt) {
	for (unsigned i = 0; i < particles.size(); ++i) {
        if (particles[i].lifetime > particles[i].life_length){
            kill(i);
        }
	}
	
    for (unsigned i = 0; i < particles.size(); ++i) {
        particles[i].lifetime += dt;
        particles[i].pos += particles[i].velocity*dt;
	}
}


