use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    'NAME'	=> 'Lingua::Pangram',
    'VERSION_FROM' => 'Pangram.pm', # finds $VERSION
    ($] >= 5.005 ?    ## Add these new keywords supported since 5.005
      (ABSTRACT_FROM => 'Pangram.pm', # retrieve abstract from module
       AUTHOR     =>
       'Russell Matbouli <lingua-pangram-makefile@russell.matbouli.org>') : ()),


);
