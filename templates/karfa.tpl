{% extends "default.html" %}

{% block content %}
    {% if tom %}
        <h1>Karfan er tóm</h1>
    {% else %}
        <h1>Vörur í körfu</h1>
        <h3><a href="/eyda"> EYÐA KÖRFU</a></h3>

        <table>    
            <tr>
                <th colspan="2">Smeltu á vöru til að eyða úr henni</th>
            </tr>
            <tr>
                <td>Vara:</td>
                <th>Verd:</th>
            </tr>
            {% for i in k %}
                <tr>
                    <td><a href="/eydavoru/{{ i[0] }}">{{ i[1] }}</a></td>
                    <td><b> {{ i[3] }}</b></td>
                </tr>
            {% endfor %}
                <tr>
                    <td>Samtals:</td>
                    <th> {{ s }} </th>
                </tr>
        </table>
    {% endif %}
        
    <form method="post" action ="result" accept-charset="UTF-8">
        <h3>Viðskiptavinur</h3>
        <label>Nafn:
            <input type="text" name="Nafn" requierd placeholder ="Nafn">
        </label>
        <label>Email:
            <input type="email" name="Email" requierd placeholder ="nam@email.com">
        <label>Sími:
            <input type="text" name="Simi" requierd placeholder ="7829817">
        <input type="hidden" name="Samtals" value="{{ s }}"> 
        <input type = "submit" value = "Kaupa" />
    </form>

    </div>
{% endblock %}