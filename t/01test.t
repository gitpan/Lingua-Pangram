#!/usr/local/bin/perl -w

use strict;
use Test::More tests => 11;

use_ok('Lingua::Pangram');

my $pan = Lingua::Pangram->new();

isa_ok($pan, "Lingua::Pangram");

#-----------------------------------------------------------------------------
# Test pangram
#-----------------------------------------------------------------------------

# One that is not a pangram
my $first = $pan->pangram('abc');

isnt($first, undef, "pangram returns defined value");
isnt($first, "", "pangram doesn't return an empty string");
is($first, 0, "good, returned 0");

# One that is a simple pangram
my $second = $pan->pangram('abcdefghijklmnopqrstuvwxyz');

isnt($second, undef, "returns defined value");
isnt($second, "", "get doesn't return an empty string");
is($second, 1, "good, returned 1");

# One that is a pangram and has spaces and punctuation
my $third = $pan->pangram('The quick brown fox jumps over the lazy dog.?!');

isnt($third, undef, "get returns defined value");
isnt($third, "", "get doesn't return an empty string");
is($third, 1, "good, returned 1");
