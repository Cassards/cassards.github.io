---
title: "Computer Graphics Projects - Chalmers University"
date: 2019-02-19
permalink: /computer-graphics-chalmers/
tags: [opengl, c++, chalmers, graphique 3D]
header:
    image: "/images/ProjectHeaders/CG.png"
excerpt: "Projets de graphiques 3D avec OpenGL."
mathjax: true
toc: true
toc_sticky: true
---

# Computer Graphics
Lors de mon semestre d'études en Suède, j'ai suivi un cours de graphique 3D. J'ai pu travailler de nombreuses notions au travers des différents projets que ce cours proposait.

## Rendu de triangles

### Présentation 
Bases de l'écriture d'une application OpenGL.
### Notions
* buffer objects (BO) / vertex array objects (VAO)
* fragment & vertex shaders

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab1)
<img src="{{ site.url }}{{ site.baseurl }}/images/CG/screens/lab1.png" alt="short video from lab1">


## Textures
### Présentation
Affichage et filtrage de textures.
### Notions
* Paramètre des textures
* Filtrage des textures (mipmapping, anisotropic filtering)
* Alpha blending

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab2-textures)
<img src="{{ site.url }}{{ site.baseurl }}/images/CG/screens/lab2.gif" alt="short video from lab2">

## Animation
### Présentation
Applications de transformations pour déplacer des objets et la caméra.
### Notions
* Modèle Vue Projection Matrice
* Transformations : Translation, rotation, mise à l'échelle.
* Control de la caméra 

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab3-camera)
<img src="{{ site.url }}{{ site.baseurl }}/images/CG/screens/lab3.gif" alt="short video from lab3">

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

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab4-cubemapping)
<img src="{{ site.url }}{{ site.baseurl }}/images/CG/screens/lab4.gif" alt="short video from lab4">

## Post-traitement
### Présentation
Mise à jour dynamique des textures et application de passes de post-traitement.
### Notions
* Framebuffer
* rendu hors écran utilisé comme texture
* fragment shader pour les effets de post-traitement

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab5-rendertotexture)
<img src="{{ site.url }}{{ site.baseurl }}/images/CG/screens/lab5.gif" alt="short video from lab5">

## Shadow Maps
### Présentation
Calcul des ombres en temps réel en utilisant les shadow maps.
### Notions
* Shadow map
* Shadow Acne
* Hardware Support (Percentage Closer Filtering, depth map)

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab6-shadowmaps)
<img src="{{ site.url }}{{ site.baseurl }}/images/CG/screens/lab6.gif" alt="short video from lab6">

## Système de particules
### Présentation
Mise en place un système de particules.
### Notions
* Générer et simuler des particules
* Rendu des particules sur le GPU

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab7-project)
<img src="{{ site.url }}{{ site.baseurl }}/images/CG/screens/project.gif" alt="short video from CG project">