use ExtUtils::MakeMaker;

WriteMakefile(
    NAME		=> 'CDDB::File',
    VERSION_FROM	=> 'lib/CDDB/File.pm', 
    PREREQ_PM		=> { 
                              Test::More => 0.17,
                           }, 
    ($] > 5.005 ? () : (
      ABSTRACT_FROM => 'lib/CDDB/File.pm', 
      AUTHOR        => 'Tony Bowden <kasei@tmtm.com>',
    )),
);
