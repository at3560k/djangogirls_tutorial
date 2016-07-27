% Django Templates, & Template Extending
% &nbsp;
% 2016-07-24 15:15 ... 15:45

# Django Templates: Overview

- Already covered:
    - Querysets and view rendering 
    - Populating the context of a template
- We'll cover:
    - [Djangogirls: Django Templates](http://tutorial.djangogirls.org/en/django_templates/)
    - [Glossing over css...](http://tutorial.djangogirls.org/en/css/)
    - [Djangogirls: Extending Django Templates](http://tutorial.djangogirls.org/en/template_extending/)
    - Template tags
    - Variables in templates
    - Refactoring templates to use other templates
- Sorry to skip
    - [The CSS Section!](http://tutorial.djangogirls.org/en/css/)

----

## Templates & Template Tags

[Django Docs: Built-In template tags & filters](https://docs.djangoproject.com/en/1.9/ref/templates/builtins/)


The below goes inside your `<body>` tags. 

~~~{.djangotemplate}
{# blog/templates/blog/post_list.html #}
<div>
    <h1><a href="/">Django Girls Blog</a></h1>
</div>

{% for post in posts %}
    <div>
        <p>published: {{ post.published_date }}</p>
        <h1><a href="">{{ post.title }}</a></h1>
        <p>{{ post.text|linebreaksbr }}</p>
    </div>
{% endfor %}
~~~

----

## Important parts:

- Variable fields displayed and looped over
- We've left the links empty for now
- We pass the text through a filter adding `<br/>` tags

---

## Enough CSS to get by

- Adding bootstrap
- Adding staticfiles dir
   - Adding custom CSS into staticfiles
- Adding Google fonts

Don't worry, the extending template section has the code you will want from
this part -- except for [`blog/static/css/blog.css`](http://tutorial.djangogirls.org/en/css/) 
-- take the source from about 2/3 of the way down the tutorial, or
[here](https://raw.githubusercontent.com/at3560k/djangogirls_tutorial/master/src/blog/static/css/blog.css).

It's definitely worth walking through this section later, or playing around in the DOM
inspector.

---

## Refactoring Templates

- Creating a new `base.html` template
    - Check out the new stylesheets, bootstrap, google fonts, and the `%static`
      tag in the new `base.html`'s `<head>`
    - The previosu section's `base.html`, is pruned down, to be populated by a
      block named 'content' that we will define in
      `blog/templates/blog/post_list.html`.  
    - Basically, most of the boilerplate in `post_list` is now reusable in
      `base`

--- 

- [Template Extension/Inheritance](https://docs.djangoproject.com/en/1.7/topics/templates/#template-inheritance)
    - Basically:  If you define a block, it will be replaced in a child
      extending it if that block is also defined
    - Templates are kind of like DRY code -- if something is being repeated, it
      might be time to add a new `{% block %}` somewhere

Remember you may need to stop/restart your local server after editing the templates.

~~~{.bash}
^C # control-c
python manage.py runserver
~~~

---


~~~{.djangotemplate}
{# blog/templates/blog/post_list.html #}
{% extends 'blog/base.html' %}

{% block content %}
    {% for post in posts %}
        <div class="post">
            <div class="date">
                {{ post.published_date }}
            </div>
            <h1><a href="">{{ post.title }}</a></h1>
            <p>{{ post.text|linebreaksbr }}</p>
        </div>
    {% endfor %}
{% endblock %}
~~~


