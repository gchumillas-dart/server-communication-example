# Server Communication Example
A simple web application to view, edit, insert or delete items from a database table.

# Introduction

This application is divided in two parts: a server-side application written in PHP and a client-side application written in Dart and Angular 2. The client-side makes http requests to the server-side in order to list, insert, edit or delete records and the server-side responds by providing XML documents. Those XML documents are interpreted by the client-side and presented in the diferent views.

# Installation

## Create the database

Create a MySQL datatabase and import the database.sql script included in this repository. You can do this from any MySQL interface, like phpMyAdmin, or directly from command line:

```bash
# creates the database tables
> mysql your_database -u root -p < database.sql
```

## Install the server-side application

The server-side is installed as a typical web application (Apache + MySQL + PHP). Place it under an accessible web folder (for example, under /var/www), copy the server/config-php file to server/config.php and change the parameters properly.

The server-side application uses `composer` as package manager. Change to the server folder and install the required libraries:

```bash
> cd <path-to-server-folder>
> composer install
```

Finally, test it in your browser:

http://yourdomain/<path-to-server-folder>/list.php

If all went well, you will see an XML file showing the list of table recods.

## Install the client-side application

Copy the client/web/config-sample.json file to client/web/config.json and change the `server` parameter:

```json
{
  "server": "http://yourdomain/<path-to-server-folder>"
}
```

Open the command line prompt, navigate to the client folder, install dependencies and start the development Dart server:

```bash
# change to client folder and gets dependencies
> cd <path-to-client-folder>
> pub get

# start the development server (default port: 8080)
> pub serve
```

And finally open the following url in your Dartium browser:

http://localhost:8080
