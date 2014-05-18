Maestro Engine v1 
======

Maestro Engine v1 - this is the first version of my Content Management Framework(CMF) engine created in 2010-2011. 
This is lightweight engine (500kb) with basic principle "less code - more action". This engine contains all basic necessary functionality to allow you to develop your PHP app very fast. You already have Masterclass as basic CRUD Model and Controller and default template(tpl/default.html) as View. When you create new module, you don't need to write it from scratch - you should just extend existing template or module. Creating module itself is very simple - you just create a record in 'Modules' Module, fill in fields for form and table, save it and click on install icon.

This engine was developed as my Diploma work and should stay untouched 'as is' for historic purposes. The engine is fully functional and can be used directly after download. However, this engine is pretty old and was created for demonstration purposes and thus may not contain some functionality(e.g. type check). Since the first release, new versions has been developed or are in development. Most recent stable versions are v2 and v3(Maestro lite). V4 is currently in development.

Installation
------
To install engine you should just download it and launch. The engine would detect it's not installed yet and launch 'install.php'. You will see form where you should enter all basic information about your database and site:  
  
Server - your MySQL server  
User - your MySQL username  
Password - password of your MySQL user  
Database - desired or existing database. If database don't exist, engine would create it for you.  
Base URL - base url of your website. For example, http://localhost/yoursite/ or http://www.yoursite.com/. Please note that trailing slash is necessary for that.  
Email - email of your superadmin site user. However, you can enter anything here(e.g. 'admin'); type check is not implemented.
Password - password of your superadmin site user.  
  
Click install. Database and user will be created for you and you will be redirected to index page. Now you can log in and work.

Usage
------
This CMF follows principle of WYSYWIG meaning there is no directly separated administration(e.g. admin/) and user parts. Administrator is just user with rights and see everything user see plus special options like administration panel on top of the page or content management buttons like edit or delete.

This CMF follows MVC principle with single Front controller. All methods are accessable through URL in a way yoursite.com/Class/Method/other/params e.g. pages/edit/1 means that method 'edit' would be called for class 'pages' for element with id '1'. By default is called default module(class) which you can set up in 'Globals' module. By default it is 'pages'. URL can be mapped i.e. /id1 can be mapped into users/view/1. You don't need .htaccess for it.

While this is pure engine it contains only system modules:
* Users - basic functionality for users (login, logout, register).
* Globals - global variables like default language, module, etc.
* Languages - site languages with text labels.
* File manager - allows you to manage files directly in your browser.
* Pages - pages are basic content for any site. Edit area HTML editor is used.
* Modules - allows you to create and manage modules.

Architecture
------

Creating new module
------
To create new module you should go to modules/ and add new module. Then you should set up it's fields. Every field has name, database type and widget separated by space. I.e. 'news_text text html' would create field in database with type text and would be editable as HTML textarea in module editing.
Following database types supported:
* int – would create integer field
* text – would create TEXT field
* float – would create FLOAT field
* pass – would create TEXT field; would be MD5 encode
* date – would create DATETIME 

Following widgets supported:
hidden – input type=hidden
* text – input type=text
* pass – input type=password
* textarea – textarea
* html – HTML edit_area textarea
* checkbox - checkbox
* select – select. Options can be set up in Masterclass getOptions method
* radio - radio
* multselect - multselect
* date - date widget consisting of 6 small input fields

After you are ready, save your module and click 'install'. Now you can edit it.

Templates
------


Functions
------

Conclusion
------
