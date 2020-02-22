# README - micro-swansons (Dining Philosophers)

[![Build Status](https://travis-ci.org/kingdonb/micro-swansons.svg?branch=master)](https://travis-ci.org/kingdonb/micro-swansons)
[![codecov](https://codecov.io/gh/kingdonb/micro-swansons/branch/master/graph/badge.svg)](https://codecov.io/gh/kingdonb/micro-swansons)

To get started, run:

* `make` - this will build the image, `kingdonb/microswansons-backend:latest`
* `docker-compose up`
* `docker exec -it tables-backend bash --login -c 'rails db:setup'`
* `docker exec -it tables-backend bash --login -c 'rails console'`

The service is running at (localhost):

* [tables-backend](http://127.0.0.1)

You can also run the tests:

* `docker exec -it tables-backend bash --login -c 'rspec'`
