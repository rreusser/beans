# beans

### What is your time actually worth?

Cool. You saved $1.57 by going to the store that's a little cheaper. And then you found a quarter at the cash register. That's really great. How many quarters did you spend telling your co-worker about it? I mean let's not obsess over it or anything, but it might be good to at least know.

`beans` is a simple command line tool to help you understand the value of your time.

### Installation

It's not on rubygems right now, but you can install the gem by downloading the source and typing

    $ gem build beans.gemspec
    $ gem install beans

### Configuration

Configuration is specified in `~/.beans.yml`. For example:

    # beans.yml:
    salary: 50000
    per: year
    hours_per_week: 40
    port: 7878

### Usage

To start counting beans, simply type

    $ beans

That's kinda stupid though. Who wants to dedicate a terminal window to a one-line utility. To daemonize a bean counter, just type

    $ beans start

When a daemonized counter is running, you can check your beans with

    $ beans

or watch the beans tick by with

    $ beans -f

Of course you can kill the counter or restart it, respectively, with

    $ beans stop
    $ beans restart

And you can run the server in the foreground with

    $ bean_server
