package Catmandu::Store::RKD;

our $VERSION = '0.04';

use Catmandu::Sane;

use Moo;
use Catmandu::Store::RKD::Bag;

with 'Catmandu::Store';

1;

__END__

=head1 NAME

=for html <a href="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD"><img src="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD.svg?branch=master"></a>

Catmandu::Store::RKD - Retrieve items from the RKD (Rijksbureau voor Kunsthistorische Documentatie) artist database

=head1 SYNOPSIS

    # From the command line
    $ catmandu export VIAF --id 38885 to YAML
    ---
    - artist_link: https://rkd.nl/opensearch-eac-cpf?q=kunstenaarsnummer:38885
      description: hofschilder, schilder, tekenaar
      guid: https://rkd.nl/explore/artists/38885
      title: Hoey, Jan de
    ...

    # From a Catmandu Fix
    lookup_in_store(
        objectName,    # objectName is a field containing the RKD identifier
        RKD
    )

    # From Perl code
    use Catmandu;

    my $store = Catmandu->store('RKD')->bag;

    my $item = $store->get('38885');

    print $item->[0]->{'title'} , "\n";  # Hoey, Jan de

=head1 DESCRIPTION

A Catmandu::Store::VIAF is a Perl package that can query the
L<RKD|https://rkd.nl/nl/collecties/overige-databases/open-search-rkdartists> artist
database by I<kunstenaarsnummer>.

This store supports only one method C<get> to retrieve an AAT record by its identifier

For some names, it can/will return multiple possibilities. You must determine yourself which one is the 'correct' one.

=head1 CONFIGURATION

No options.

=head1 METHODS

=head2 new(%configuration)

Create a new Catmandu::Store::RKD

=head2 get($id)

The store takes an artist id (I<kunstenaarsnummer>) and performs a lookup to the RKD artists database. It
returns an array containing either one or no results.  Every result is of the form:

    {
        'title'       => 'Name of the person',
        'description' => 'Short description, as provided by RKD',
        'artist_link' => 'Link to the artist using the artist id',
        'guid'        => 'Permalink to the record'
    }

=head2 add()

Not supported

=head2 delete()

Not supported

=head2 each()

Not supported

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
