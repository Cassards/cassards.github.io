---
layout: archive
permalink: /projets/
title: "Mes différents projets"
author_profile: true
header: 
    image: "/images/fort point.png"
---
Vous retrouverez sur cette pages l'ensembles des projets que j'ai réalisées ou auxquels j'ai pu participer.

## Projets Scolaires

* Chalmers University of Technology (Suède)
`[checklist : Archi, Bio, Game design, CG]`
* Grenoble INP - Ensimag
`[ checklist : CG, Crowley, POO / Projet gl, algo d'optimisation (projet rust ?), programmation concurrente ]`

## Projets Personnels

* Réalisations personnelles

* Réalisations en groupes

## Projets par catégories
<!-- Copy the code below and put it on the page where your projects will all be listed. -->
test 1
{% include base_path %}
{% include group-by-array collection=site.posts field="tags" %}

{% for tag in group_names %}
  {% assign posts = group_items[forloop.index0] %}
  <h2 id="{{ tag | slugify }}" class="archive__subtitle">{{ tag }}</h2>
  {% for post in posts %}
    {% include archive-single.html %}
  {% endfor %}
{% endfor %}

test 2 
{% include base_path %}
{% include group-by-array collection=site.posts field="tags" %}

{% for tag in group_names %}
  {% assign posts = group_items[forloop.index0] %}
  <h3 id="{{ tag | slugify }}" class="archive__subtitle">{{ tag }}</h3>
  {% for post in posts %}
    {% include archive-single.html %}
  {% endfor %}
{% endfor %}