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
![screenshot from lab1]({{ site.url }}{{ site.baseurl }}/images/CG/screens/lab1.png)


## Textures
### Présentation
Affichage et filtrage de textures.
### Notions
* Paramètre des textures
* Filtrage des textures (mipmapping, anisotropic filtering)
* Alpha blending

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab2-textures)
![short video from lab2]({{ site.url }}{{ site.baseurl }}/images/CG/screens/lab2.gif)

## Animation
### Présentation
Applications de transformations pour déplacer des objets et la caméra.
### Notions
* Modèle Vue Projection Matrice
* Transformations : Translation, rotation, mise à l'échelle.
* Control de la caméra 

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab3-camera)
![short video from lab3]({{ site.url }}{{ site.baseurl }}/images/CG/screens/lab3.gif)

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
![short video from lab4]({{ site.url }}{{ site.baseurl }}/images/CG/screens/lab4.gif)

## Post-traitement
### Présentation
Mise à jour dynamique des textures et application de passes de post-traitement.
### Notions
* Framebuffer
* rendu hors écran utilisé comme texture
* fragment shader pour les effets de post-traitement

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab5-rendertotexture)
![short video from lab5]({{ site.url }}{{ site.baseurl }}/images/CG/screens/lab5.gif)

## Shadow Maps
### Présentation
Calcul des ombres en temps réel en utilisant les shadow maps.
### Notions
* Shadow map
* Shadow Acne
* Hardware Support (Percentage Closer Filtering, depth map)

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab6-shadowmaps)
![short video from lab6]({{ site.url }}{{ site.baseurl }}/images/CG/screens/lab6.gif)

## Système de particules
### Présentation
Mise en place un système de particules.
### Notions
* Générer et simuler des particules
* Rendu des particules sur le GPU

### Documents
* [Code](https://github.com/Cassards/cassards.github.io/tree/master/documents/Projects/Chalmers/CG/lab7-project)
![short video from CG project]({{ site.url }}{{ site.baseurl }}/images/CG/screens/project.gif)