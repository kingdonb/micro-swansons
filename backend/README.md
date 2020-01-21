# README

This is the backend for the micro-swansons game. In it, the client worker application (a Go implementation of Ron Swanson) plays Dining Philosophers with tables and forks that are represented by Rails ActiveRecord models, across a web service.

There are two classes: Table and Fork

Clients are afforded these preconditions:

* Forks are numbered starting from 1 within their respective tables.
* There are N forks per table, and the last fork is numbered N.
* There are at least two forks at any table. (N>1)

Clients are expected to respect these rules:

* Each client is responsible for two forks.
* The clients are aware of each other, they self-organize and do not try to steal each others seats.
* Ron needs two forks to eat. Clients are numbered starting from 1.
* The server allows Ron to pick up a fork if nobody else is holding it.
* First Ron picks up two forks, then he sends "Eat" to the table and it succeeds.

These extra bullets may help to clarify the functionality of the game:

* In a table with 5 forks numbered 1-5, Ron 1 and 5 are competing for Fork 1.
* In that same table with 5 forks, Ron 4 and 5 are competing for Fork 5.
* When any client sends "Eat" to the table without first holding both forks, it fails.
* Any Ron is allowed to hold his fork for 30s at once, then it's automatically returned to the table.
* Any implementation of Ron is fair, but the question is... does he get to eat?

[The Dining Philosophers Problem With Ron Swanson](http://adit.io/posts/2013-05-11-The-Dining-Philosophers-Problem-With-Ron-Swanson.html)

A web frontend is meant to be exposed which can reflect the status of the forks, and show in real-time which clients are eating. Forks can be clean or dirty, but the client is not required to pay attention to that.

---


Boilerplate from `rails new`:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
