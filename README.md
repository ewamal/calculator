# calculator :fire: :fire: :fire:
Statistics calculator computes a number of common statistical values including average, median, mode and more

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

What things you need to install the software and how to install them

```
Ruby 2.5.1
Bundler 1.17.1
PostgreSQL 10.5
```

## Initial Instructions

Clone the repository
```
git clone git@github.com:ewamal/calculator.git
```
then enter

```
cd calculator
```
## Backend setup

Bundle packages

```
bundle install
```
## Set up the databases
```
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:test:prepare

```

## Running the tests

```
bundle exec rspec
```
## Running

Set up
```
bundle exec rake db:seed
bundle exec rackup
```
Go to http://localhost:9292/
