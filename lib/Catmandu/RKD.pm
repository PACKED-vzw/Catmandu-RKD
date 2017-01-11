package Catmandu::RKD;

our $VERSION = '0.04';

use Catmandu::Sane;
use Moo;

1;
__END__

=head1 NAME

=for html <a href="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD"><img src="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD.svg?branch=master"></a>

Catmandu::RKD - Retrieve items from the RKD (Rijksbureau voor Kunsthistorische Documentatie) artist database

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

    # Retrieve a RKD record based on an artist name.
    rkd_name(path)     # path points to name

=head1 MODULES

=over

=item * L<Catmandu::Store::RKD>

=item * L<Catmandu::Fix::rkd_name>

=item * L<Catmandu::RKD::API::Name>

=back

=head1 AUTHORS

Pieter De Praetere, C<< pieter at packed.be >>

=head1 CONTRIBUTORS

Pieter De Praetere, C<< pieter at packed.be >>

=head1 COPYRIGHT AND LICENSE

This package is copyright (c) 2016 by PACKED vzw.
This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.

=cut
