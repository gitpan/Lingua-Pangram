package Lingua::Pangram;

use strict;
use vars qw($VERSION @ISA @EXPORT @EXPORT_OK);

require Exporter;

@ISA = qw(Exporter);
# Items to export into callers namespace by default. Note: do not export
# names by default without a very good reason. Use EXPORT_OK instead.
# Do not simply export all your public functions/methods/constants.
@EXPORT = qw( pangram );
$VERSION = '0.01';


# Preloaded methods go here.

# Autoload methods go after =cut, and are processed by the autosplit program.

sub new {
    my $class = shift;
    my $self  = bless {}, $class;
    return $self;
}#new
  
sub pangram {
    my $self = shift;
    my $string = shift;

    my @letters = ('a'..'z');
    my $ret = 1;
    foreach (@letters) {
        $ret = 0 if not $string =~ /$_/;
    }

    return $ret;
}#pangram

1;
__END__
=head1 NAME

Lingua::Pangram - Is this string a pangram

=head1 SYNOPSIS

  use Lingua::Pangram;
  print "is a pangram" if pangram("a string");

=head1 DESCRIPTION

This module exports one function - pangram. It returns 1 if the string passed in
contains all the letters of the alphabet, otherwise returns 0.

=head1 AVAILABILITY

It should be available for download from
F<http://russell.matbouli.org/code/lingua-pangram/>
or from CPAN

=head1 AUTHOR

Russell Matbouli E<lt>lingua-pangram-spam@russell.matbouli.orgE<gt>

F<http://russell.matbouli.org/>

=head1 TODO

Perhaps create minpangram which tests whether the string contains exactly 
one of each letter.

=head1 LICENSE

Distributed under GPL v2. See COPYING included with this distibution.

=head1 SEE ALSO

perl(1).

=cut
