# beans

### What is your time actually worth?

Cool. You saved $1.57 by going to the store that's a little cheaper than the other store. And then you found a quarter at the cash register. That's really great. How many quarters did you spend telling your co-worker about it? I mean let's not obsess over it or anything, but it might be good to at least know.

`beans` is a simple command line tool to help you understand the value of your time. With Growl notifications just to be sure you get the point.

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

That's kinda silly. Who wants to dedicate a terminal window to a single number? To daemonize a bean counter, just type

    $ beans start

When a daemonized counter is running, you can check your beans with

    $ beans

or watch the beans tick by with

    $ beans -t

Of course you can kill the counter or restart it, respectively, with

    $ beans stop
    $ beans restart

And you can run the server in the foreground with

    $ bean_server

