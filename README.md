# symfony-kindle
An ebook download site - backend with PHP7 and Symfony

Visit the deployed version.
Please be patient as the project is hosted on a free heroku plan that needs to start dynos. It may take up to 20 seconds to load:

https://mysterious-headland-25064.herokuapp.com/

To run the project you need Composer installed. https://getcomposer.org/

Please refer to the excellent Symfony documentation: https://symfony.com/doc/current/setup.html

You need to create a database and include this in a .env file at the root directory, for example : 
```
DATABASE_URL=mysql://<user>:<password>@127.0.0.1:8889/<database_name>
```
then run in your project directory
```
composer install
php bin/console server:run
```


As my certification project at IMAGE Formation Training (Backend web developer 2018) I did in 4 days the working backend of a (fake) ebook download side.

- The HTML/CSS template was provided. I only worked on making things work (backend)
- Complete analyse of the different classes and entities required. UML class and use case diagrams
- creation of a MySQL database to store the ebooks
- User authentication and login with different roles
- Creation of a modal/popup to download
- Setting up different pricing plans to restrict downloads
- Working contact form
- 3 testimonials displayed in random order
- version control with git and deployment on Heroku

