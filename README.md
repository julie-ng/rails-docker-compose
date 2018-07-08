# Rails Hello World Example

This project is a naked Rails application, showing how to dockerize it for local development.

## Use

1. Build the Rails image, which uses your public working directory

```
$ docker-compose build
```

## Run

```
$ docker-compose up
```

Then open [http://localhost:3000](http://localhost:3000) in your browser.

Because to [create databases](#create-databases) if you're starting project for the first time!

## Database

This project uses Postgres, the Rails community preferrred database.

Because this project uses database inside docker, any database operations **must be run inside Docker**, so all database-related commpands are prefixed with `docker-compose run web`.

### Create Databases

```
$ docker-compose run web rake db:create
```

### Configuration

Be share to compare `config/database.yml` to original, which uses sqllite and MySQL. We want to use Postgres instead.

## Rails Console

To run the Rails Console for development, run

```
$ docker-compose run web rails console
```

## Tests

Even for tests, you will need to run it inside Docker because it needs database access.

```
# sets up database (first-time only)
$ docker-compose run bundle exec rake test:prepare

# runs tests
$ docker-compose run bundle exec rake test
```

## For the lazy

### Scaffolding

Rails has generators. If you use `scaffold`, it will generate the following for you:

- model
- controller
- views
- css
- migrations
- tests

#### Example: `Post`

```
$ docker-compose run web rails generate scaffold Post name:string title:string content:text
```

After running the migration (next step), you can view the scaffold results at [http://localhost:3000/posts](http://localhost:3000/posts).

#### Migration

After creating a scaffold, don't forget to run the database migration

```
$ docker-compose run rake db:migrate
```
