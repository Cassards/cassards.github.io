---
layout: archive
permalink: /section-test/
title: "Un test de section pour mon portfolio"
author_profile: true
header: 
    image: "/images/fort point.png"
---

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