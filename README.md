Ion-server
==========

#### Server for the [Ion](http://github.com/rstacruz/ion) search engine.

Ion-server sets up a RESTful API for Ion services.

Usage
-----

    gem install ion-server

Ensure Redis is running, then:

    REDIS_URL=redis://127.0.0.1:6379/0 ion-server

Then visit http://127.0.0.1:8080/ for reference.

### In your application

Instead of using `Ion.connect`, use:

    Ion.remote = "http://127.0.0.1:8080"

Things will then be performed on that given Ion server, instead of
inline in your application.

Testing
-------

Install the needed gems.

    rvm 1.9.2-p136@ion --rvmrc --create
    rvm gemset import  # or install gems in .gems

When developing alongside Ion itself, it's best you add a symlink of your
Ion working directory to `vendor/ion`. (vendor is gitignore'd)

    mkdir vendor
    ln -s ~/projects/ion vendor/ion

Start a server in one terminal.

    rake start

Now, run the tests in another.

    rake test
