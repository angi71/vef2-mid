{% extends "default.html" %}



{% block title %}
    Eldsneytisverð
{% endblock %}

{% block content %}
<div class="wrapper">
    {% set oneCo = [] %}
    {% for item in gogn['results'] %}
        {% if item.company not in oneCo %}
            {% do oneCo.append(item.company) %}
            <div class="box">
                <a href="/company/{{ item.company }}">
                    <img src="static/{{item.company}}.png" title="{{ item.company }}">
                </a>
            </div>
        {% endif %}
    {% endfor %}
    <div class="kort">
        <h2>Besta verðið</h2>
        <h4>Ódýrasta bensínið: <i>{{ minP[0] }}</i> er hjá {{ minP[1] }}, {{ minP[2] }}</h4>
        <h4>Ódýrasta díeselið: <i>{{ minD[0] }}</i> er hjá {{ minD[1] }}, {{ minD[2] }}</h4>
        <p>Síðast uppfært: {{ gogn.timestampPriceCheck | format_time }}</p>
    </div>
</div>
{% endblock %}