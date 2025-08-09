# Terratowns Mock Web Server

We will use Ruby Sinatra Web Server to create the Mock Server.

## Working with Ruby

### Bundler

Bundler is a package manager for Ruby. It is the primary way to install Ruby packages (known as gems) for Ruby.

### Install Gems

You need to create a Gemfile and define your gems in that file.

[Source]("https://rubygems.org")

```ruby
gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command.

This will install the gems on the system globally (unlike Nodejs which install packages in place in a folder called `node_modules`)

A `Gemfile.lock` will be created to lock down the gem versions used in this project.

### Executing Ruby Scripts in the Context of Bundler

We have to use `bundle exec` to tell future Ruby scripts to use the gems we installed. This is the way we set context.

### Sinatra

Sinatra is a micro web-framework for ruby to build web-apps.

Its great for mock or development servers or for very simple projects.

You can create a web-server in a single file.

[Sinatra Website](https://sinatrarb.com/)

## Running Web Server

We can run the web server by executing the following commands:

```ruby
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.

## CRUD Operation Scripts

All the scrpits to perform CRUD Operations are present in the `bin/terratowns` directory.