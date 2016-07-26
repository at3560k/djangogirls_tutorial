% Django Templates, & Template Extending
% &nbsp;
% 2016-07-24 15:15 ... 15:45

# Django Templates: Overview

- [Djangogirls: Django Templates](http://tutorial.djangogirls.org/en/django_templates/)
- [Glossing over...](http://tutorial.djangogirls.org/en/css/)
- [Djangogirls: Extending Django Templates](http://tutorial.djangogirls.org/en/template_extending/)


- Querysets and view rendering were covered previously
    - Populating the context of a template
- We'll cover:
    - Template tags
    - Variables in templates
    - Skipping [the CSS Section!](http://tutorial.djangogirls.org/en/css/)
    - Refactoring templates to use other templates

----

## Templates & Template Tags

[Django Docs: Built-In template tags & filters](https://docs.djangoproject.com/en/1.9/ref/templates/builtins/)


The below goes inside your `<body>` tags. 

~~~{#post .djangotemplate }
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
- We've left the links blank for now
- we pass the text through a filter adding `<br/>` tags

---

## Enough CSS to get by

- Adding bootstrap
- Adding staticfiles dir
   - Adding custom CSS into staticfiles
- Adding google fonts

Don't worry, the extending template section has the code you will want from
this part -- except for `blog/static/css/blog.css` -- take the source from about 2/3 of the way down the tutorial.

---

## Refactoring Templates

- Creating a new `base.html` template
    - Check out the new stylesheets, bootstrap, google fonts, and the `%static`
      tag.
    - We bring in a large 'base.html' from the previous section, and prune it
      down, to be populated by a block named 'content' that we will define in
      `blog/templates/blog/post_list.html` 
- [Template Extension/Inheritance](https://docs.djangoproject.com/en/1.7/topics/templates/#template-inheritance)
    - Basically:  If you define a block, it will be replaced in a child
      extending it if that block is also defined
    - Templates are kind of like DRY code -- if something is being repeated, it
      might be time to add a new `{% block %}` somewhere

