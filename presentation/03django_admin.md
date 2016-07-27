% Django Admin
% &nbsp; 
% 2016-07-25 11:40 ... 12:00

# The Admin

[Djangogirls: Django Admin](http://tutorial.djangogirls.org/en/django_admin/)

[Django Docs: Admin](https://docs.djangoproject.com/en/1.9/ref/contrib/admin/)

----------

## Overview

- Register a model on the admin site
- Creating a superuser to login
- Add some test pages for later

-----

## Registering a model

~~~ {#admin.py .python .numberLines startFrom="1"}
# blog/admin.py
from django.contrib import admin
from .models import Post

admin.site.register(Post)
~~~

Launch your server and visit [the admin](http://127.0.0.1:800/admin): `python
manage.py runserver` 

-----

## Creating a SuperUser

Stop the server, (or launch a new shell) and make your admin user.

<div style="font-size: 80%;">
~~~{.bash}
(myvenv) ~/djangogirls$ python manage.py createsuperuser
Username: admin
Email address: admin@admin.com
Password:
Password (again):
Superuser created successfully.
~~~
</div>

----

## Add Some Test Pages

I recommend filling things in with [bacon ipsum](http://baconipsum.com/)
or [web2.0](http://web20ipsum.com/)

<img src="http://tutorial.djangogirls.org/en/django_admin/images/edit_post3.png" width="95%"/>


