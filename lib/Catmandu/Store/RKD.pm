package Catmandu::Store::RKD;

our $VERSION = '0.01';

use Catmandu::Sane;

use Moo;
use Catmandu::Store::RKD::Bag;

with 'Catmandu::Store';

1;

__END__

=head1 NAME

=for html <a href="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD"><img src="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD.svg?branch=master"></a>

Catmandu::Store::RKD - Retrieve items from the RKD

=head1 SYNOPSIS

This module contains two submodules; a L<Catmandu::Fix::rkd_name|fix> to lookup a name in 
L<https://rkd.nl/nl/collecties/overige-databases/open-search-rkdartists|RKD>, and a L<Catmandu::Store::RKD|store> to 
lookup an artist id (I<kunstenaarsnummer>) in the RKD database.

=head1 DESCRIPTION

=head2 L<Catmandu::Fix::rkd_name>

The fix takes a name (first name, last name or a combination) and performs a lookup to the RKD artists database. It 
returns an array of results. Every result is of the form:

    {
        'title'       => 'Name of the person',
        'description' => 'Short description, as provided by RKD',
        'artist_link' => 'Link to the artist using the artist id',
        'guid'        => 'Permalink to the record'
    }

For some names, it can/will return multiple possibilities. You must determine yourself which one is the 'correct' one.

=head2 L<Catmandu::Store::RKD>

The fix takes an artist id (I<kunstenaarsnummer>) and performs a lookup to the RKD artists database. It 
returns an array containing either one or no results.  Every result is of the form:

    {
        'title'       => 'Name of the person',
        'description' => 'Short description, as provided by RKD',
        'artist_link' => 'Link to the artist using the artist id',
        'guid'        => 'Permalink to the record'
    }

=head1 SEE ALSO

L<Catmandu>
L<Catmandu::Fix::rkd_name>

=head1 AUTHORS

Pieter De Praetere, C<< pieter at packed.be >>

=head1 CONTRIBUTORS

Pieter De Praetere, C<< pieter at packed.be >>

=head1 COPYRIGHT AND LICENSE

This package is copyright (c) 2016 by PACKED vzw.
This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.

=cut