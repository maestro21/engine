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
Maestro engine has Front controller index.php which calls class(model), passes data to it and echoes template(view)
Classes are kept in 'classes' directory.
Templates are kept in 'tpl' directory.
Module fields are kept in 'ini' directory.

Every class extends Masterclass who has all necessary functionality and variables for data processing and CRUD control. To write your own module you don't need to write it from scratch, you should just extend following Masterclass methods:
* del - is called when you delete element. URL: module/del/id
* save - is called when you save your element. URL: module/save/id .If you call URL without id, new element would be created. 
* item - is called when you open your element for editing. URL: module/item/id
* items - usually default method that basically lists your elements
* view - is called when user views element. URL: module/view/id
* extend - is virtual method that you can use to extend global logic of your class or set up some global values like options. 

This structure is very agile and you can actually develop anything, even file manager which persists in this example.

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
Templates are kept in tpl folder. Unlike some frameworks like Zend, where there is a separate file for every method, our templates are class-based and exact view is returned depending from $do variable that we pass when calling template.
Such approach gives some advantages:
* there are less files. Imagine project with 20 modules with 10 methods each. You need 200 files then. Here you need only 20 which makes it easier to edit
* when you create new module, you shouldn't create view for every method - you should just extend ones you need and call default template in any other case. Example:
```php
<?php switch($do){ 
	case 'view': ?>
	# your view
	<? break;
	default:
		include('default.html');
	break;
}?>
```
While templates are parsed through OB library, you can execute any code in them. You can even load template in template or load class and execute it's method or execute SQL query! 
Maestro engine is very agile.

Functions
------
Such automatization and agility are possible because there are lots of useful functions that do the job for you:

Database functions:
* DBconnect() – connects to your database based on your settings.
* DBquery($sql) – executes SQL query. Analogue to mysql_query();
* DBrow($sql) – returns associative array. Analogue of mysql_fetch_assoc();
* DBcol($sql) – returns array of values of column. I.e. DBcol('SELECT name FROM table').
* DBall($sql) – returns two-dimentional array. Analogue of pg_fetch_all() in PostgreSQL;
* DBfield($sql) and DBcell($sql) – returns single cell. Analogue of mysql_result();
* DBnumrows($sql) – returns number of affected rows. Analogue of mysql_num_rows();
* DBinsertId() - returns inserted ID. Analogue of mysql_insert_id();
* DBfields() - returns table fields.

Template functions:
* tpl($tpl, $params) - returns parsed template with name tpl/$tpl.html and params. After you pass params as array, they are preprocessed in a loop. Example: you pass array('var1' => 1, 'var2' => 2), you can echo them in your template as $var1 and $var2.

Data processing and formating functions:
* striprow(Array $arr) - loops array elements and removes backslaches;
* parseString($string) - prepares string for database insert adding slashes and converting special entities;
* drawForm ($fields,$data,$options) – draws HTML form based on module settings (see 'Creating new module'). $fields are fields of module you defined when you created it, $data is your POST data prepared in Masterclass in save method, $options are options for some types like 'select' defined in getOptions() method in Masterclass.
* sqlFormat($type,$value) - formats $value to SQL format depending on it's database $type defined in module fields settings.
* fDate($date) - returns prefortamed date. 
* getGet($var) - returns variable from GET request.
* getPost($var) - returns variable from POST request.
* getAll($var) - returns variable from both requests.
* inspect($data) - <pre>print_r($data)</pre>

Other functions:
* getVar($var) - gets Session variable;
* setVar($var) - sets Session variable;
* unsetVar($var) - unsets Session variable;
* checkVar($var) - checks if Session variable;
* getLang() - gets current language;
* T($label) - echoes textlabel depending from language;
* G($var) - echoes global variable which is set in Globals module.

Conclusion
------
Maestro engine is agile, lightweigt and automatized engine which allows you to develop your app very fast and comfortable with little code. 
