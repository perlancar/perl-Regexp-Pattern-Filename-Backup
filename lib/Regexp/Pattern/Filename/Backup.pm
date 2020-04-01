package Regexp::Pattern::Filename::Backup;

# AUTHORITY
# DATE
# DIST
# VERSION

use 5.010001;
use strict;
use warnings;
#use utf8;

use Filename::Backup ();

our %RE;

my $re = join '|', map {quotemeta} sort keys %Filename::Backup::SUFFIXES;
$re = qr((?:$re)\z)i;

$RE{filename_backup} = {
    summary => 'Backup filename',
    pat => $re,
    tags => ['anchored'],
    examples => [
        {str=>'foo', matches=>0, summary=>'No extension'},
        {str=>'gz', matches=>0, summary=>'Not an extension'},
        {str=>'foo~', matches=>1},
        {str=>'foo bar.BAK', matches=>1, summary=>'Case insensitive'},
        {str=>'foo.old is the file', matches=>0, summary=>'Regex is anchored'},
        {str=>'foo.txt', matches=>0},
    ],
};

1;
# ABSTRACT: Backup filename

=head1 DESCRIPTION

This is a L<Regexp::Pattern> wrapper for L<Filename::Backup>.


=head1 SEE ALSO

L<Regexp::Pattern>

L<Filename::Backup>
