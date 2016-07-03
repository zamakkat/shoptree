# shoptree [![Build Status](https://travis-ci.com/zamakkat/shoptree.svg?token=bCR1V8MpYjHu4przYp1u&branch=master)](https://travis-ci.com/zamakkat/shoptree)
## Introduction
This application lists all the products in a database and allows users to filter them by category. A Product can belong to many Categories. Categories are a tree structure: one category can have multiple sub-categories, those sub-categories might have sub-sub-categories and so on.

## Deployment and Build pipeline
To make changes to the code-base, just issue a pull request to the master branch. An optional staging environment with Heroku's review apps feature can be set up at later stages. TravisCI is used for continuous integration to run all specs to make sure new changes don't break anything.

The application is currently deployed to Heroku at `https://shoptree-production.herokuapp.com`. There is currently no auto-deploy so the master branch is manually deployed on need.

Good to have environment variables:
- `WEB_CONCURRENCY`
- `WEB_MAX_THREADS`

## Development
### 0. Dependencies
- Rails 4.2.6
- PostgreSQL 9.5.3

### 1. Setup
```
$ bin/setup
```

### 2. Run all the stuff
You first need to run PostgreSQL (database). Optional: Guard (helps you run RSpec on the fly and has livereload for better front end development). If you are not using Guard, to run the specs just run:

```
$ bin/rspec
```

Then you can run the Rails web server.

Or you can be lazy and use the [`foreman`](https://github.com/ddollar/foreman) gem and place the following in `Procfile.dev`:
```
web:       bundle exec puma -C config/puma.rb -q -p 3000
postgres:  postgres -D /usr/local/var/postgres
log:       tail -f log/development.log
guard:     bundle exec guard -i
```
Then to run it all just use `$ foreman start --f Procfile.dev`

### 3. Get some dummy data
To make manual testing easier, some nested categories + a lot of dummy products data can be generated using the command:
```
$ bin/rake dev:data
```
