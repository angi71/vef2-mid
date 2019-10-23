{% extends "default.html" %}

{% block title %}
    Bensínstöð
{% endblock %}


{% block content %}
    {% for item in gogn['results'] %}
        {% if item.key == k%}
            <h3>Söðulaðili: {{item.company}}</h3>
            <h3>Staður: {{item.name}}</h3>
            <h3>Verð á 1 lítra af Bensíni, 95 oktan: {{item.bensin95}} kr.</h3>
            <h3>Verð á 1 lítra af Dísel olíu: {{item.diesel}} kr.</h3>
        <div class="kort">
            <h4> Staðsetning bensínsstöðvar</h4>
            <ul>
                <li>Breiddargráða: {{item.geo.lat}}</li>
                <li>Lengdargráðar: {{item.geo.lon}}</li>
                <li><a href="https://www.google.com/maps/@{{item.geo.lat}},{{item.geo.lon}},18z/">Staðsetning</a></li>
        </div>
        {% endif %}
    {% endfor %}
{% endblock %}