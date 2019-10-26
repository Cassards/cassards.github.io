

#ifdef _WIN32
extern "C" _declspec(dllexport) unsigned int NvOptimusEnablement = 0x00000001;
#endif

#include <GL/glew.h>
#include <cmath>
#include <cstdlib>
#include <algorithm>
#include <chrono>

#include <stb_image.h>

#include <labhelper.h>
#include <imgui.h>
#include <imgui_impl_sdl_gl3.h>

#include <glm/glm.hpp>
#include <glm/gtx/transform.hpp>
using namespace glm;

#include <Model.h>
#include "hdr.h"
#include "fbo.h"
#include "ParticleSystem.h"




using std::min;
using std::max;

///////////////////////////////////////////////////////////////////////////////
// Various globals
///////////////////////////////////////////////////////////////////////////////
SDL_Window* g_window = nullptr;
float currentTime  = 0.0f;
float previousTime = 0.0f;
float deltaTime    = 0.0f;
bool showUI = false;
int windowWidth, windowHeight;

///////////////////////////////////////////////////////////////////////////////
// Shader programs
///////////////////////////////////////////////////////////////////////////////
GLuint shaderProgram; // Shader for rendering the final image
GLuint simpleShaderProgram; // Shader used to draw the shadow map
GLuint backgroundProgram;
GLuint verySimpleShaderProgram;
GLuint particleProgram;

///////////////////////////////////////////////////////////////////////////////
// Environment
///////////////////////////////////////////////////////////////////////////////
float environment_multiplier = 1.5f;
GLuint environmentMap, irradianceMap, reflectionMap;
const std::string envmap_base_name = "001";

///////////////////////////////////////////////////////////////////////////////
// Light source
///////////////////////////////////////////////////////////////////////////////
vec3 lightPosition;
vec3 point_light_color = vec3(1.f, 1.f, 1.f);

float point_light_intensity_multiplier = 10000.0f;


///////////////////////////////////////////////////////////////////////////////
// Particles global parameters
///////////////////////////////////////////////////////////////////////////////
GLuint vaoParticles;
GLuint particlesBuffer;
GLuint texture;
const int MAX_SIZE = 100000;
ParticleSystem particle_system = ParticleSystem(MAX_SIZE);
std::vector<glm::vec4> data = std::vector<glm::vec4>();
vec3 spawnPos = vec3(17.0f, 3.0f, 0.0f);

///////////////////////////////////////////////////////////////////////////////
// Camera parameters.
///////////////////////////////////////////////////////////////////////////////
vec3 cameraPosition(-70.0f, 50.0f, 70.0f);
vec3 cameraDirection = normalize(vec3(0.0f) - cameraPosition);
float cameraSpeed = 1.0f;

vec3 worldUp(0.0f, 1.0f, 0.0f);

///////////////////////////////////////////////////////////////////////////////
// Models
///////////////////////////////////////////////////////////////////////////////
labhelper::Model *fighterModel = nullptr;
labhelper::Model *landingpadModel = nullptr;
labhelper::Model *sphereModel = nullptr;

mat4 roomModelMatrix;
mat4 landingPadModelMatrix; 
mat4 fighterModelMatrix;


void loadShaders(bool is_reload)
{
	GLuint shader = labhelper::loadShaderProgram("../project/simple.vert", "../project/simple.frag", is_reload);
	if (shader != 0) simpleShaderProgram = shader; 
	shader = labhelper::loadShaderProgram("../project/background.vert", "../project/background.frag", is_reload);
	if (shader != 0) backgroundProgram = shader;
	shader = labhelper::loadShaderProgram("../project/shading.vert", "../project/shading.frag", is_reload);
	if (shader != 0) shaderProgram = shader;
}

void initGL()
{
	///////////////////////////////////////////////////////////////////////
	//		Load Shaders
	///////////////////////////////////////////////////////////////////////
	backgroundProgram       = labhelper::loadShaderProgram("../project/background.vert", "../project/background.frag");
	shaderProgram           = labhelper::loadShaderProgram("../project/shading.vert",    "../project/shading.frag");
	simpleShaderProgram     = labhelper::loadShaderProgram("../project/simple.vert",     "../project/simple.frag");
	verySimpleShaderProgram = labhelper::loadShaderProgram("../project/verySimpleShader.vert", "../project/verySimpleShader.frag");
	particleProgram         = labhelper::loadShaderProgram("../project/particle.vert", "../project/particle.frag");

	///////////////////////////////////////////////////////////////////////
	// Load models and set up model matrices
	///////////////////////////////////////////////////////////////////////
	fighterModel    = labhelper::loadModelFromOBJ("../scenes/NewShip.obj");
	landingpadModel = labhelper::loadModelFromOBJ("../scenes/landingpad.obj");
	sphereModel     = labhelper::loadModelFromOBJ("../scenes/sphere.obj");

	roomModelMatrix = mat4(1.0f);
	fighterModelMatrix = translate(15.0f * worldUp);
	landingPadModelMatrix = mat4(1.0f);

	///////////////////////////////////////////////////////////////////////
	// Load environment map
	///////////////////////////////////////////////////////////////////////
	const int roughnesses = 8;
	std::vector<std::string> filenames;
	for (int i = 0; i < roughnesses; i++)
		filenames.push_back("../scenes/envmaps/" + envmap_base_name + "_dl_" + std::to_string(i) + ".hdr");

	reflectionMap = labhelper::loadHdrMipmapTexture(filenames);
	environmentMap = labhelper::loadHdrTexture("../scenes/envmaps/" + envmap_base_name + ".hdr");
	irradianceMap = labhelper::loadHdrTexture("../scenes/envmaps/" + envmap_base_name + "_irradiance.hdr");

	///////////////////////////////////////////////////////////////////////
	// Particle system setup
	///////////////////////////////////////////////////////////////////////
    glGenVertexArrays(1, &vaoParticles);
    glGenBuffers(1, &particlesBuffer);
    glBindBuffer(GL_ARRAY_BUFFER, particlesBuffer);
    glBufferData(GL_ARRAY_BUFFER, MAX_SIZE*sizeof(vec4), nullptr, GL_STATIC_DRAW); 
    
    int w, h, comp;
    unsigned char* image = stbi_load("../scenes/explosion.png", &w, &h, &comp, STBI_rgb_alpha);
    glGenTextures(1, &texture);
    glBindTexture(GL_TEXTURE_2D, texture);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA, w, h, 0, GL_RGBA, GL_UNSIGNED_BYTE, image);
    free(image);

    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
  
    glGenerateMipmap(GL_TEXTURE_2D);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR);
    glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAX_ANISOTROPY_EXT, 16.0f); 

    glEnable(GL_DEPTH_TEST);	// enable Z-buffering 
	glDisable(GL_CULL_FACE);	// enables backface culling
}

void debugDrawLight(const glm::mat4 &viewMatrix, const glm::mat4 &projectionMatrix, const glm::vec3 &worldSpaceLightPos)
{
	mat4 modelMatrix = glm::translate(worldSpaceLightPos);
	glUseProgram(shaderProgram);
	labhelper::setUniformSlow(shaderProgram, "modelViewProjectionMatrix", projectionMatrix * viewMatrix * modelMatrix);
	labhelper::render(sphereModel);
	labhelper::setUniformSlow(shaderProgram, "modelViewProjectionMatrix", projectionMatrix * viewMatrix);
	labhelper::debugDrawLine(viewMatrix, projectionMatrix, worldSpaceLightPos);
}


void drawBackground(const mat4 &viewMatrix, const mat4 &projectionMatrix)
{
	glUseProgram(backgroundProgram);
	labhelper::setUniformSlow(backgroundProgram, "environment_multiplier", environment_multiplier);
	labhelper::setUniformSlow(backgroundProgram, "inv_PV", inverse(projectionMatrix * viewMatrix));
	labhelper::setUniformSlow(backgroundProgram, "camera_pos", cameraPosition);
	labhelper::drawFullScreenQuad();
}

void drawScene(GLuint currentShaderProgram, const mat4 &viewMatrix, const mat4 &projectionMatrix, const mat4 &lightViewMatrix, const mat4 &lightProjectionMatrix)
{
	glUseProgram(currentShaderProgram);
	// Light source
	vec4 viewSpaceLightPosition = viewMatrix * vec4(lightPosition, 1.0f);
	labhelper::setUniformSlow(currentShaderProgram, "point_light_color", point_light_color);
	labhelper::setUniformSlow(currentShaderProgram, "point_light_intensity_multiplier", point_light_intensity_multiplier);
	labhelper::setUniformSlow(currentShaderProgram, "viewSpaceLightPosition", vec3(viewSpaceLightPosition));
	labhelper::setUniformSlow(currentShaderProgram, "viewSpaceLightDir", normalize(vec3(viewMatrix * vec4(-lightPosition, 0.0f))));


	// Environment
	labhelper::setUniformSlow(currentShaderProgram, "environment_multiplier", environment_multiplier);

	// camera
	labhelper::setUniformSlow(currentShaderProgram, "viewInverse", inverse(viewMatrix));

	// landing pad 
	labhelper::setUniformSlow(currentShaderProgram, "modelViewProjectionMatrix", projectionMatrix * viewMatrix * landingPadModelMatrix);
	labhelper::setUniformSlow(currentShaderProgram, "modelViewMatrix", viewMatrix * landingPadModelMatrix);
	labhelper::setUniformSlow(currentShaderProgram, "normalMatrix", inverse(transpose(viewMatrix * landingPadModelMatrix)));

	labhelper::render(landingpadModel);

	// Fighter
	labhelper::setUniformSlow(currentShaderProgram, "modelViewProjectionMatrix", projectionMatrix * viewMatrix * fighterModelMatrix);
	labhelper::setUniformSlow(currentShaderProgram, "modelViewMatrix", viewMatrix * fighterModelMatrix);
	labhelper::setUniformSlow(currentShaderProgram, "normalMatrix", inverse(transpose(viewMatrix * fighterModelMatrix)));

	labhelper::render(fighterModel);
}

void drawParticles(const mat4 &viewMatrix, const mat4 &projectionMatrix, const unsigned int active_particles)
{
    mat4 spawnTranslation = translate(spawnPos);
    //glUseProgram(verySimpleShaderProgram);
	//labhelper::setUniformSlow(verySimpleShaderProgram, "modelViewProjectionMatrix", projectionMatrix * viewMatrix); //* fighterModelMatrix * spawnTranslation);
    
    glUseProgram(particleProgram);
	labhelper::setUniformSlow(particleProgram, "P", projectionMatrix);
    labhelper::setUniformSlow(particleProgram, "screen_x", float(windowWidth));
    labhelper::setUniformSlow(particleProgram, "screen_y", float(windowHeight));
    
    glBindVertexArray(vaoParticles);

    // Enable shader program point size modulation.
    glEnable(GL_PROGRAM_POINT_SIZE);
    // Enable blending.
    glEnable(GL_BLEND);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    
    glActiveTexture(GL_TEXTURE0);                                                                                      
    glBindTexture(GL_TEXTURE_2D, texture); 

    glDrawArrays(GL_POINTS, 0, active_particles);
}

void display(void)
{
	///////////////////////////////////////////////////////////////////////////
	// Check if window size has changed and resize buffers as needed
	///////////////////////////////////////////////////////////////////////////
	{
		int w, h;
		SDL_GetWindowSize(g_window, &w, &h);
		if (w != windowWidth || h != windowHeight) {
			windowWidth = w;
			windowHeight = h;
		}
	}

	///////////////////////////////////////////////////////////////////////////
	// setup matrices
	///////////////////////////////////////////////////////////////////////////
	mat4 projMatrix = perspective(radians(45.0f), float(windowWidth) / float(windowHeight), 5.0f, 2000.0f);
	mat4 viewMatrix = lookAt(cameraPosition, cameraPosition + cameraDirection, worldUp);

	vec4 lightStartPosition = vec4(40.0f, 40.0f, 0.0f, 1.0f);
	lightPosition = vec3(rotate(currentTime, worldUp) * lightStartPosition);
	mat4 lightViewMatrix = lookAt(lightPosition, vec3(0.0f), worldUp);
	mat4 lightProjMatrix = perspective(radians(45.0f), 1.0f, 25.0f, 100.0f);

	///////////////////////////////////////////////////////////////////////////
	// Bind the environment map(s) to unused texture units
	///////////////////////////////////////////////////////////////////////////
	glActiveTexture(GL_TEXTURE6);
	glBindTexture(GL_TEXTURE_2D, environmentMap);
	glActiveTexture(GL_TEXTURE7);
	glBindTexture(GL_TEXTURE_2D, irradianceMap);
	glActiveTexture(GL_TEXTURE8);
	glBindTexture(GL_TEXTURE_2D, reflectionMap);
	glActiveTexture(GL_TEXTURE0);



	///////////////////////////////////////////////////////////////////////////
	// Draw from camera
	///////////////////////////////////////////////////////////////////////////
	glBindFramebuffer(GL_FRAMEBUFFER, 0);
	glViewport(0, 0, windowWidth, windowHeight);
	glClearColor(0.2, 0.2, 0.8, 1.0);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);

	drawBackground(viewMatrix, projMatrix);
	drawScene(shaderProgram, viewMatrix, projMatrix, lightViewMatrix, lightProjMatrix);
	debugDrawLight(viewMatrix, projMatrix, vec3(lightPosition));

	///////////////////////////////////////////////////////////////////////////
	// Draw particles 
	///////////////////////////////////////////////////////////////////////////
    
    // Sorting particles
    
    for (int i=0; i<32; i++){
        Particle p;
        vec4 tmpCoord = fighterModelMatrix * vec4(spawnPos, 1);
        p.pos = vec3(tmpCoord);
        p.lifetime = 0;
        p.life_length = 5;
        particle_system.spawn(p);
       
        const float theta = labhelper::uniform_randf(0.f, 2.f * M_PI);
        const float u = labhelper::uniform_randf(0.95f, 1.f);
        
        mat3 velMatrix; 
        velMatrix[0] = normalize( vec3(fighterModelMatrix[0]) );
        velMatrix[1] = normalize( vec3(fighterModelMatrix[1]) );
        velMatrix[2] = normalize( vec3(fighterModelMatrix[2]) );
        
        p.velocity = velMatrix * glm::vec3(u, sqrt(1.f - u * u) * cosf(theta), sqrt(1.f - u * u) * sinf(theta));
        
        p.velocity *= 10.0f;
    }
    particle_system.process_particles(deltaTime);
    unsigned int active_particles = particle_system.particles.size();

    // Extracting data 
    data.resize(active_particles);
    for(int i=0; i < active_particles; i++){
        data[i] = vec4(vec3(viewMatrix * vec4(particle_system.particles[i].pos, 1.0f)), particle_system.particles[i].lifetime);
    }
    
    // Sort particles with sort from c++ standard library
    std::sort(data.begin(), std::next(data.begin(), active_particles), 
    [](const vec4 &lhs, const vec4 &rhs){ return lhs.z < rhs.z; });

    // Uploading data to gpu
    glBindVertexArray(vaoParticles);
    glBindBuffer(GL_ARRAY_BUFFER, particlesBuffer);
    glBufferSubData( GL_ARRAY_BUFFER, 0, sizeof(vec4) * data.size(), data.data() ); 
	glVertexAttribPointer(0, 4, GL_FLOAT, false, 0, 0);
	glEnableVertexAttribArray(0); // Enable the vertex position attribute

    // Drawing VAO 
    drawParticles(viewMatrix, projMatrix, active_particles);
}

bool handleEvents(void)
{
	// check events (keyboard among other)
	SDL_Event event;
	bool quitEvent = false;
	while (SDL_PollEvent(&event)) {
		if (event.type == SDL_QUIT || (event.type == SDL_KEYUP && event.key.keysym.sym == SDLK_ESCAPE)) {
			quitEvent = true;
		}
		if (event.type == SDL_KEYUP && event.key.keysym.sym == SDLK_g) {
			showUI = !showUI;
		}
		if (event.type == SDL_MOUSEMOTION && !ImGui::IsMouseHoveringAnyWindow()) {
			static int prev_xcoord = event.motion.x;
			static int prev_ycoord = event.motion.y;
			int delta_x = event.motion.x - prev_xcoord;
			int delta_y = event.motion.y - prev_ycoord;

			if (event.button.button & SDL_BUTTON(SDL_BUTTON_LEFT)) {
				float rotationSpeed = 0.005f;
				mat4 yaw = rotate(rotationSpeed * -delta_x, worldUp);
				mat4 pitch = rotate(rotationSpeed * -delta_y, normalize(cross(cameraDirection, worldUp)));
				cameraDirection = vec3(pitch * yaw * vec4(cameraDirection, 0.0f));
			}
			prev_xcoord = event.motion.x;
			prev_ycoord = event.motion.y;
		}
	}

	// check keyboard state (which keys are still pressed)
	const uint8_t *state = SDL_GetKeyboardState(nullptr);
	vec3 cameraRight = cross(cameraDirection, worldUp);

    //moving fighter
    float speed = 0.3f;
    static mat4 T(1.0f), R(1.0f);

    //forward / backward
    if (state[SDL_SCANCODE_UP]) {
        T[3] -= speed * R[0];
    }
    if (state[SDL_SCANCODE_DOWN]) {
        T[3] += speed * R[0];
    }

    //Up / down
    if (state[SDL_SCANCODE_SPACE]) {
        T[3] += speed * R[1];
    }
    if (state[SDL_SCANCODE_LCTRL]) {
        T[3] -= speed * R[1];
    }

    //turn left / turn right
    if (state[SDL_SCANCODE_LEFT]) {
        R[0] -= speed*0.1f * R[2];
        // make R orthonormal again
        R[0] = normalize(R[0]);
        R[2] = vec4(cross(vec3(R[0]), vec3(R[1])),  0.0f);
    }
    if (state[SDL_SCANCODE_RIGHT]) {
        R[0] += speed*0.1f * R[2];
        // make R orthonormal again
        R[0] = normalize(R[0]);
        R[2] = vec4(cross(vec3(R[0]), vec3(R[1])),  0.0f);
    }

    fighterModelMatrix = T*R;

	if (state[SDL_SCANCODE_W]) {
		cameraPosition += cameraSpeed* cameraDirection;
	}
	if (state[SDL_SCANCODE_S]) {
		cameraPosition -= cameraSpeed * cameraDirection;
	}
	if (state[SDL_SCANCODE_A]) {
		cameraPosition -= cameraSpeed * cameraRight;
	}
	if (state[SDL_SCANCODE_D]) {
		cameraPosition += cameraSpeed * cameraRight;
	}
	if (state[SDL_SCANCODE_Q]) {
		cameraPosition -= cameraSpeed * worldUp;
	}
	if (state[SDL_SCANCODE_E]) {
		cameraPosition += cameraSpeed * worldUp;
	}
	return quitEvent;
}

void gui()
{
	// Inform imgui of new frame
	ImGui_ImplSdlGL3_NewFrame(g_window);

	// ----------------- Set variables --------------------------
	ImGui::Text("Application average %.3f ms/frame (%.1f FPS)", 1000.0f / ImGui::GetIO().Framerate, ImGui::GetIO().Framerate);
    ImGui::DragFloat3("Spawn Position", &spawnPos[0]);

	// ----------------------------------------------------------
	// Render the GUI.
	ImGui::Render();

}

int main(int argc, char *argv[])
{
	g_window = labhelper::init_window_SDL("OpenGL Project");

	initGL();

	bool stopRendering = false;
	auto startTime = std::chrono::system_clock::now();

	while (!stopRendering) {
		//update currentTime
		std::chrono::duration<float> timeSinceStart = std::chrono::system_clock::now() - startTime;
		previousTime = currentTime;
		currentTime  = timeSinceStart.count();
		deltaTime    = currentTime - previousTime;
		// render to window
		display();

		// Render overlay GUI.
		if (showUI) {
			gui();
		}

		// Swap front and back buffer. This frame will now been displayed.
		SDL_GL_SwapWindow(g_window);

		// check events (keyboard among other)
		stopRendering = handleEvents();
	}
	// Free Models
	labhelper::freeModel(fighterModel);
	labhelper::freeModel(landingpadModel);
	labhelper::freeModel(sphereModel);

	// Shut down everything. This includes the window and all other subsystems.
	labhelper::shutDown(g_window);
	return 0;
}
