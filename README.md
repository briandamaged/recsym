[![Gem Version](https://badge.fury.io/rb/recsym.svg)](http://badge.fury.io/rb/recsym)

# RecSym #

Recursively Symbolize your Hashes!

## Installation ##

    gem install recsym

## Usage ##

    require 'recsym'

    # Let's create some nested Hashes
    # and Arrays.
    x = {"foo" => [1, 2, {"bar" => 3}]}

    # Now, let's make the data
    # structure self-referential.
    x["quuz"] = x
    x["foo"].push x

    # Can RecSym symbolize all of the
    # Hash keys without entering an
    # infinite recursion?  YES IT CAN!
    y = RecSym.this(x)

    puts y
    puts(y[:quuz] == y)     # --> true
    puts(y[:foo][3] == y)   # --> true



