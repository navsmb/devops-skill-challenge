# Skills Assessment - (a.k.a. how awesome are you?)

The purpose behind this skills Assessment is to give us an example of your work. We understand that coding in a room full of people w/out your computer, bookmarks, editors, gaming consoles and fidget cubes can be misleading to your actual skill level. With this assessment we place the comfort back into your hands to write how and when you like to do so.

The idea is to take this application which is ready to be deployed to a server (provided by us, or you can use your own) and:
1) get the server capable of hosting the application
2) get the application onto the server
3) get the appication running and available for the whole world to view.

## Software Requirements
- [Ruby 2.3.1](https://www.ruby-lang.org/en/)
- [bundler gem](https://rubygems.org/gems/bundler/versions/1.14.6)

## Getting the application to run

Environment configurations

    BOOL_API_URL="<FULL_URL_PATH>"

Pre-run commands

    $ cp config/secrets.yml.example config/secrets.yml # setup secrets for the repo - that aren't very secret
    $ bundle install # install necessary application dependencies

Running the service

    $ foreman start

# The application its self
## Ruby on Rails API Consumption assignment
This repository was create to demonstrate an API Consumption application.

### Booleans.io - this service has gone away :-(
The API that is being consumed is from [https://booleans.io](https://booleans.io) (Booleans as a Service - Baas) Because everyone needs to use a service to store their boolean values :-).

I ended up using [httparty](https://github.com/jnunemaker/httparty) for the API consuption, along side some model callbacks. I originally looked at using [ActiveRestClient](https://github.com/whichdigital/active-rest-client) to provide "model" like functionality, but that was a joke. The model being used is keeping a record of the booleans created, but the value in the database is compared to the value via the BaaS when a specific boolean is viewed.

### Giphy.com
There is also a small interface with [giphy's api](http://api.giphy.com) which will pull 1 image from the top 30 results of querying for `true` or `false`. Sometimes they really don't make a lot of sense, but that is giphy for you.

### Design
I've never claimed to be amazing at UX/UI, so I used [zurb's foundation](http://foundation.zurb.com) for some quick and dirty styles.


