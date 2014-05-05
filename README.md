App Focus
=========

Print notifications to the console when different apps take focus on OS X

Usage
-----

    $ make
    clang -fobjc-arc \
            -framework Foundation \
            -framework AppKit \
            app-focus.m \
            -o app-focus
    $ ./app-focus
    Google Chrome
    Chromium
    TextEdit
    Adium
    Terminal
    ^C

Every time an app takes focus, it's name will be printed to stdout, and subsequent
records will be separated by a newline character.

Based on https://gist.github.com/bahamas10/48e49f5de71f016e4759

License
-------

MIT
