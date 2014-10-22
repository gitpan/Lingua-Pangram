#!/usr/local/bin/perl -w

use strict;
use Test::More tests => 15;
use locale; # for the skip determination
            # DON'T change this to a use_ok() !

BEGIN {
  use_ok('Lingua::Pangram');
}

my $pan = Lingua::Pangram->new();

isa_ok($pan, "Lingua::Pangram");

#-----------------------------------------------------------------------------
# Test pangram
#-----------------------------------------------------------------------------

# One that is not a pangram
my $first = $pan->pangram('abc');

isnt($first, undef, "pangram returns defined value");
isnt($first, "", "pangram doesn't return an empty string");
is($first, 0, "pangram('abc') returns 0");

# One that is a simple pangram
my $second = $pan->pangram('abcdefghijklmnopqrstuvwxyz');

isnt($second, undef, "pangram returns defined value");
isnt($second, "", "pangram doesn't return an empty string");
is($second, 1, "pangram('abcdefghijklmnopqrstuvwxyz') returns 1");

# One that is a pangram and has spaces and punctuation
my $third = $pan->pangram('The quick brown fox jumps over a lazy dog.?!');

isnt($third, undef, "pangram returns defined value");
isnt($third, "", "pangram doesn't return an empty string");
is($third, 1, "pangram('The quick brown fox...') returns 1");

# One with extra letters
my $german = Lingua::Pangram->new( ['a'..'z', '�', '�', '�', '�'] );
isa_ok($german, "Lingua::Pangram");

my $fourth = $german->pangram('ZW�LF gro�e BOXK�MPFER jagen Eva quer �ber den Sylter Deich');
# diag "lc � = " . lc('�') . " and lc � = " . lc('�');
# diag "uc � = " . uc('�') . " and uc � = " . uc('�');
SKIP: {
  skip 'different locale', 3 unless lc('�') eq '�';

  isnt($fourth, undef, "pangram returns defined value");
  isnt($fourth, "", "pangram doesn't return an empty string");
  is($fourth, 1, "German pangram returns 1");
}
