# beans

### What is your time actually worth?

Cool. You refactored someone's code into a totally killer feature that's gonna bump sales just a smidge. And then you went to lunch and found a quarter at the cash register. That's really great, but how many quarters did it cost to tell your co-worker about it? I mean let's not obsess over it or anything, but it might be good to know.

`beans` is a simple command line tool to help you understand the value of your time. With Growl notifications just to be sure you don't forget what your time is worth.

### Installation

Update: Pushed it to rubygems.org, but that seems like a waste of global namespace. In other words, it got downloaded a few times, probably either automatically or beacuase it was confused with something else. Yanked it, so for now you'll just have to download the repo and install it yourself.

    $ gem build beans.gemspec
    $ gem install beans-0.2

### Configuration

Configuration must be specified in `~/.beans.yml`. Port and notification interval are optional. For example:

    # beans.yml:
    salary: 50000
    per: year
    hours_per_week: 40
    notify_every: 600
    port: 7878

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

Remember: you waste twice as much money when you talk to someone. Are you talking to someone. Use the `-n` flag:

    $ beans -n 2
    $ beans -n 2 -t

Kill or restart the daemon, respectively, with

    $ beansd stop
    $ beansd restart

And you can run the server in the foreground with

    $ beans-server

But why would anyone do that?
