#!/usr/bin/perl -w

use Test::More tests => 28;
use CDDB::File;
use strict;

my $file = "data/ee074b12";
my $disc = CDDB::File->new($file);

isa_ok $disc, 'CDDB::File';

is $disc->title, "The double life of Veronika/Kieslowski", "title";
is $disc->artist, "Zbigniew Preisner", "artist";
is $disc->year, 1991, "year";
is $disc->genre, "Classical", "genre";
is $disc->extd, "The soundtrack to La Double Vie De Veronique", "extd";
is $disc->length, 1869, "length";
is $disc->revision, 3, "revision no";
is $disc->submitted_by, "Grip 2.95", "submitter";

is $disc->track_count, 18, "track count";

my @tracks = $disc->tracks;
is scalar @tracks, 18, "So 18 tracks";

isa_ok $tracks[0], 'CDDB::File::Track';
isa_ok $tracks[17], 'CDDB::File::Track';
is $tracks[0]->number, 1, "Track number";
is $tracks[0]->title, 'Weronika', "Track title";
is $tracks[0]->artist, "Zbigniew Preisner", "Track artist = CD artist";
is $tracks[0]->extd, 'Opening song', "Track extd info";
is $tracks[12]->number, 13, 'Track number';
is $tracks[12]->title, 'Theme : 2nd transcription', "multi-line title";

is $tracks[0]->length, 40, "first song length";
is $tracks[17]->length, 85, "last song length";

{
  my $file = "data/be0c140e";
  my $disc = CDDB::File->new($file);
  is $disc->id, "af10420e", "ID correct";
  my @ids = $disc->all_ids;
  is scalar @ids, 2, "Disc has 2 ids";
  ok eq_set(\@ids, [qw/af10420e be0c140e/]), "Both correct";
  my @tracks = $disc->tracks;
  is $tracks[3]->artist, "Various", "no track artist";
  is $tracks[5]->artist, "Radiohead", "track artist";
  is $tracks[13]->artist, "Jill Sobule", "track artist";
  is $tracks[13]->length, 187, "last song length";
}

