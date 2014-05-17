Maestro Engine v1 
======

Maestro Engine v1 - this is the first version of my Content Management Framework(CMF) engine created in 2010-2011. 
This is lightweight engine (500kb) with basic principle "less code - more action". This engine contains all basic necessary functionality to allow you to develop your PHP app very fast. You already have Masterclass as basic CRUD Model and Controller and default template(tpl/default.html) as View. When you create new module, you don't need to write it from scratch - you should just extend existing template or module. Creating module itself is very simple - you just create a record in 'Modules' Module, fill in fields for form and table, save it and click on install icon.

This engine was developed as my Diploma work and should stay untouched 'as is' for historic purposes.

Installation
======
To install engine you should just download it and launch. The engine would detect it's not installed yet and launch 'install.php'. You will see form where you should enter all basic information about your database and site:

Server - your MySQL server
User - your MySQL username
Password - password of your MySQL user
Database - desired or existing database. If database don't exist, engine would create it for you.
Base URL - base url of your website. For example, http://localhost/yoursite/ or http://www.yoursite.com/. Please note that trailing slash is necessary for that.
Email - email of your superadmin site user.
Password - password of your superadmin site user.

Click install. Database and user will be created for you and you will be redirected to engine. Now you can log in and work.


===
