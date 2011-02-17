Ion-server
==========

#### Server for the [Ion](http://github.com/rstacruz/ion) search engine.

Ion-server sets up a RESTful API for Ion services.

### Why?

You can use Ion inline in your application. However, this means that
searches and indexing will be done on the same threads as your
application in a blocking manner.

Ion-server's goal is to allow you to outsource Ion's work to another
process (or another server). It can run multiple workers, so indexing
can be done in parallel.

Usage
-----

    gem install ion-server

Ensure Redis is running, then:

    REDIS_URL=redis://127.0.0.1:6379/0 ion-server

Then visit http://127.0.0.1:8080/ for reference.

### In your application

Instead of using `Ion.connect url: (redis url)`, use:

    Ion.connect ion: "http://127.0.0.1:8080"

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

Authors
=======

Ion is authored by Rico Sta. Cruz of Sinefunc, Inc.
See more of our work on [www.sinefunc.com](http://www.sinefunc.com)!

License
-------

Copyright (c) 2011 Rico Sta. Cruz.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
