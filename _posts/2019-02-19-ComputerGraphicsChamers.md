---
title: "Computer Graphics Projects - Chalmers University"
date: 2019-02-19
permalink: /computer-graphics-chalmers/
tags: [opengl, c++, chalmers, graphique 3D]
header:
    image: "/images/perceptron/percept.jpg"
excerpt: "Projets de graphiques 3D avec OpenGL."
mathjax: true
---

# Computer Graphics
Lors de mon semestre d'études en Suède, j'ai suivi un cours de graphique 3D. J'ai pu travailler de nombreuses notions au travers des différents projets que ce cours proposait.

## Rendu de triangles

### Présentation 
Bases de l'écriture d'une application OpenGL.
### Notions
* buffer objects (BO) / vertex array objects (VAO)
* fragment & vertex shaders
[image]

## Textures
### Présentation
Affichage et filtrage de textures.
### Notions
* Paramètre des textures
* Filtrage des textures (mipmapping, anisotropic filtering)
* Alpha blending
[image]

## Animation
### Présentation
Applications de transformations pour déplacer des objets et la caméra.
### Notions
* Modèle Vue Projection Matrice
* Transformations : Translation, rotation, mise à l'échelle.
* Control de la caméra 
[image]

## Shaders
### Présentation
Création d'un shader basé sur la physique.
Calcul de la quantité de lumière réfléchie depuis une surface vers la caméra. 
Calcul de l'éclairage direct à partir de points lumineux et de la réflexion spéculaire à partir d'une environment map.
### Notions
* Illumination directe / indirecte
* Eclairage diffus / irradiance map
* Réflexions
* Paramètres des matériaux 
* Torrance-Sparrow Microfacet BRDF (Bidirectional Reflectance Distribution Function)
[image]

## Post-traitement
### Présentation
Mise à jour dynamique des textures et application de passes de post-traitement.
### Notions
* Framebuffer
* rendu hors écran utilisé comme texture
* fragment shader pour les effets de post-traitement
[image]

## Shadow Maps
### Présentation
Calcul des ombres en temps réel en utilisant les shadow maps.
### Notions
* Shadow map
* Shadow Acne
* Hardware Support (Percentage Closer Filtering, depth map)
[image]

## Système de particules
### Présentation
Mise en place un système de particules.
### Notions
* Générer et simuler des particules
* Rendu des particules sur le GPU
[image]