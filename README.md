# Server Communication Example

A simple web application to view or update records from a database table. This application uses the [Router Component](https://angular.io/docs/dart/latest/tutorial/toh-pt5.html) to navigate through different views.

# Introduction

This application is divided in two parts: a server-side application written in PHP and a client-side application written in [Dart](https://www.dartlang.org/) and [Angular 2](https://angular.io/docs/dart/latest/quickstart.html). The client-side makes http requests to the server-side in order to list, insert, edit or delete records and the server-side responds by providing XML documents. Those XML documents are interpreted by the client-side and presented in the diferent views.

# Requirements

You need to be familiar with PHP applications and have a LAMP server installed in your host (Linux + Apache 2 + MySQL + PHP). Also install the [Dart SDK](https://www.dartlang.org/tools/sdk/) software and the [Dartium](https://www.dartlang.org/tools/dartium/) browser. You can follow the instrucctions of the next tutorial:

https://github.com/soloproyectos-docs/google-dart

# Installation

## Create the database

Create a MySQL datatabase and import the database.sql script included in this repository. You can do this from any MySQL interface, like phpMyAdmin, or directly from command line:

```bash
# creates the database structure
> mysql your_database -u root -p < database.sql
```

## Install the server-side application

The server-side is installed as a typical web application (Apache + MySQL + PHP). Place it under an accessible web folder (for example, under /var/www), copy the server/config-php file to server/config.php and change the parameters properly.

The server-side application uses [composer](https://getcomposer.org/) as package manager. Change to the server folder and install the required PHP libraries:

```bash
# change to the server folder and install the PHP libraries
> cd <path-to-server-folder>
> composer install
```

Finally, test it in your browser:

http://yourdomain/<path-to-server-folder>/list.php

If all went well, you will see an XML document showing the list of table recods.

## Install the client-side application

Copy the client/web/config-sample.json file to client/web/config.json and change the `server` parameter:

```json
{
  "server": "http://yourdomain/<path-to-server-folder>"
}
```

Open the command line prompt, navigate to the client folder, install the dependencies and start the development [Dart server](https://www.dartlang.org/tools/pub/cmd/pub-serve.html):

```bash
# change to client folder and get dependencies
> cd <path-to-client-folder>
> pub get

# start the development server (default port: 8080)
> pub serve
```

And finally open the following url in your Dartium browser:

http://localhost:8080
