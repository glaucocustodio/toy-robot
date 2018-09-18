# README

Make sure you have Ruby 2.4.1 installed in your machine.

Install the dependencies with `bundle` and make sure you have *Redis* running as well.

Ps: I've used Redis instead of ActiveRecord to persist data between requests

## Web version

Run the server `rails s`

Visit `http://localhost:3000`

Type the commands ;) (ex: `place 1,2,south`, `move`, `left`, `right`).

## CLI

Run `bin/rails runner lib/cli.rb` to start the cli

Type the commands (same as above, including `report`)

Ps: you need to use `bin/rails runner` to load rails, a better approach would be to extract the core classes to a gem and have a separate bundle for the cli

## Docker

You can also run using Docker.

Run the docker process then start the services:

`docker-compose up`

Visit `http://localhost:3001` (not 3000)

## Tests

You can run the tests with:

`bundle exec rspec`
