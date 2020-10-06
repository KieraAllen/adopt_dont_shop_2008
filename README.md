## Adopt Don't Shop
#### BE Mod 2 Week 1 Solo Project
#### Turing School Project [Instructions](https://github.com/turingschool-examples/adopt_dont_shop_2005)
##### Includes:
- Learning goals
- User stories
- Rubric

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Schema](#schema)
- [Testing](#testing)
- [Contributor](#contributor)
- [Extra Fun](#extra-fun)

### Introduction

__Adopt Don't Shop__ was the solo project assigned to the 2008 Back End cohort during Module 2. Students were tasked with creating a...

The app is deployed to Heroku [here]().

### Features
- Ruby 2.5.3
- Rails 5.2.4.3
- PostgreSQL
- Heroku
- ActiveRecord
- Gems
    - [`rspec-rails`](https://github.com/rspec/rspec-rails): testing suite
    - [`capybara`](https://github.com/teamcapybara/capybara): gives tools for feature testing
    - [`launchy`](http://www.launchy.net/): allows for `save_open_page` to see live version of browser
    - [`simplecov`](https://github.com/simplecov-ruby/simplecov): tracks test coverage
    - [`shoulda-matchers`](https://github.com/thoughtbot/shoulda-matchers): simplifies testing syntax
    - [`factory_bot`](https://github.com/thoughtbot/factory_bot): allows for fixture replacement
    - [`orderly`](https://rubygems.org/gems/orderly/versions/0.0.3): Rspec matcher

### Schema

![adopt_dont_shop_schema]()

### Testing

![Coverage]()

SimpleCov was used to track the test coverage and continue with TDD.

### Contributor

Kiera Allen - [Github](https://github.com/KieraAllen)

### Extra Fun

![NYAN](https://raw.githubusercontent.com/mattsears/nyan-cat-formatter/master/nyan_example.gif)

`nyan-cat` was an additional gem used as an [RSpec formatter](https://github.com/mattsears/nyan-cat-formatter) that displays a colorful [Nyan Cat](https://en.wikipedia.org/wiki/Nyan_Cat) when running tests.
