---
layout: archive
permalink: /projets/
title: "Mes différents projets"
author_profile: true
header: 
    image: "/images/fort point.png"
---
Vous retrouverez sur cette pages l'ensembles des projets que j'ai réalisés ou auxquels j'ai pu participer.

## Projets Scolaires

### Chalmers University of Technology (Suède)
* [Computer Graphics](/computer-graphics-chalmers/)
* [Gameplay Design](/gameplay-design-chalmers/)
* [Stochastic Optimization Algorithms](/stochastic-optimization-algorithms-chalmers/)
* [Parallel Computer Architecture](/parallel-computer-architecture-chalmers/)
    
### Grenoble INP - Ensimag
* CG
* Crowley
* POO / Projet gl
* Projet rust ?
* Programmation concurrente 
* Projet web ?

## Projets Personnels

### Réalisations personnelles
* Call of Ducky
* Fragrance of last coffee
* Ring
* Freeze

### Réalisations en groupes
* Grumpy Gramps
* One Day
* MetaWordPhose

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