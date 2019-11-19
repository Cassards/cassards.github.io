---
layout: archive
permalink: /projets/
title: "Mes différents projets"
author_profile: true
header: 
    image: "/images/fort point.png"
---
Vous retrouverez sur cette pages quelques uns des projets auxquels j'ai pu participer.

## Projets Scolaires

### Chalmers University of Technology (Suède)
* [Computer Graphics](/computer-graphics-chalmers/)
* [Gameplay Design](/gameplay-design-chalmers/)
* [Stochastic Optimization Algorithms](/stochastic-optimization-algorithms-chalmers/)
* [Parallel Computer Architecture](/parallel-computer-architecture-chalmers/)
    
### Grenoble INP - Ensimag
* [3D Computer Graphics](/3D-computer-graphics-ensimag/)
* [Reconnaissance de chiffres manuscrits à l'aide de réseaux neuronaux](/issr/)
* [Création d'une interface graphique en C](/projet-c/)

<!-- Ajouter lien vers projets perso -->
------ 

## Projets par catégories
<!-- Copy the code below and put it on the page where your projects will all be listed. -->
{% include base_path %}
{% include group-by-array collection=site.posts field="tags" %}

{% for tag in group_names %}
  {% assign posts = group_items[forloop.index0] %}
  <h2 id="{{ tag | slugify }}" class="archive__subtitle">{{ tag }}</h2>
  {% for post in posts %}
    {% include archive-single.html %}
  {% endfor %}
{% endfor %}