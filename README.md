# beans

### What is your time actually worth?

Cool. You refactored someone's code into a totally killer feature that's gonna bump sales just a smidge. And then you went to lunch and found a quarter at the cash register. That's really great, but how many quarters did it cost to tell your co-worker about it? I mean let's not obsess over it or anything, but it might be good to know.

`beans` is a simple command line tool to help you understand the value of your time. With Growl notifications just to be sure you don't forget what your time is worth.

### Installation

It's not on rubygems yet, but you can install the gem by downloading the source and typing

    $ gem build beans.gemspec
    $ gem install beans-0.1a

### Configuration

Configuration is specified in `~/.beans.yml`. For example:

    # beans.yml:
    salary: 50000
    per: year
    hours_per_week: 40
    port: 7878
    notify_every: 600

### Usage

To start counting beans, simply type

    $ beans

But that's kinda silly. Who wants to dedicate a terminal window to a single number? To daemonize a bean counter, just type

    $ beansd start

Then you can start and stop the counter with

    $ beans start
    $ beans stop

and query the current value with

    $ beans

or watch the beans tick by with

    $ beans -t

Kill or restart the daemon, respectively, with

    $ beansd stop
    $ beansd restart

And you can run the server in the foreground with

    $ beans-server

But why would anyone do that?
