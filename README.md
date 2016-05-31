# Server Example
A simple application to view, edit, insert or delete items from a database table.

# Intro

This application is divided in two parts: a server-side application written in PHP and a client-side application written in Dart and Angular 2. The client-side makes http requests to the server-side in order to list, edit or delete records and the server-side responds by providing XML documents. Those XML documents are interpreted by the client-side.

# Installation

## Creates the database

Creates a MySQL datatabase and import database.sql script included in this repository. You can do this from any MySQL interface, like phpMyAdmin, or directly from command line:

```bash
> mysql your_database -u root -p < database.sql
```

## Install the server-side application

The server-side is installed as a typicall web application (PHP + Apache + MySQL).
