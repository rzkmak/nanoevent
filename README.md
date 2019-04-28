# Nanoevent

## Problem Description

We will have many event at one time, each event will be held 
on specific location at specific date, also each event will have one or more ticket that can be purchased by customer.
Create database schedule to accomodate storing event data and export functionalities through HTTP API

for further requirement description, you can go [here](docs/REQUIREMENT.md)

This project was built using :
- Ruby 2.5.3
- Rails 5.2.2

## API Documentation

You can refer the api documrentation here: [https://documenter.getpostman.com/view/1315593/S1LparSo](https://documenter.getpostman.com/view/1315593/S1LparSo)
And also it already deployed so you can try directly on that links.

Or if you want to check manually, you can refer to [157.230.250.125:3000](157.230.250.125:3000)

## Dev Setup

### Docker Environment

Require docker and docker-compose, please refer to the [official doc](https://docs.docker.com/install/)

#### How to Run

For running the application, you need to do this command

```
docker-compose up -d
```

And run the migration
```
docker-compose run nanoevent bundle exec rake db:setup
```

Done.

#### How to Test

For testing the application, firstly you need the application up.

```
docker-compose up -d
```

And then run the testing part
```
docker-compose run nanoevent bundle exec rake spec
```


### Local Environment

#### Dev Dependencies

You need this system dependencies to run this application

- Ruby 2.5.3
- Bundler 2.0.1
- SQLite 3 or PostgreSQL (you can choose one)

#### How to Run

If you use PostgreSQL, you need to make file environment by copying example given.

```
cp .env.example .env
```

And modify that base on your preferences.

If you use SQLite, you dont need to setup env variable

Then install the application dependencies by using this command:
```
bundler
```

And after that, run the database setup (including migration, seeder) with this command
```
rake db:setup
```

And now you can run the application directly
```
rails s
```

#### How to Test

After environment has been setup, you can do the test simply by typing
```
rake spec
```

#### How to Lint
This project use rubocop as default linter, if it not integrated with your IDE.
You can use this command to lint and fix
```
rubocop -a
```

## Application Dependencies

This is list of application dependencies (other than default imported by rails):

- [Active Model Serializer](https://github.com/rails-api/active_model_serializers)
- [Factory Bot Rails](https://github.com/thoughtbot/factory_bot_rails)
- [Should a Matchers](https://github.com/thoughtbot/shoulda-matchers)
- [DotEnv](https://github.com/thoughtbot/shoulda-matchers)
- [Rubocop](https://github.com/rubocop-hq/rubocop)
