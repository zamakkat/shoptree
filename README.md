# shoptree

[![Build Status](https://travis-ci.com/zamakkat/shoptree.svg?token=bCR1V8MpYjHu4przYp1u&branch=master)](https://travis-ci.com/zamakkat/shoptree)


## Deployment
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
You first need to run PostgreSQL (database). Optional: Guard (helps you run RSpec on the fly and has livereload for better front end development).

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
To make manual testing easier, some categories data can be generated using the command:
```
$ bin/rake dev:data
```
