package Catmandu::Store::RKD;

our $VERSION = '0.01';

use Catmandu::Sane;

use Moo;
use Catmandu::Store::RKD::Bag;

with 'Catmandu::Store';

1;

=head1 NAME

=for html <a href="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD"><img src="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD.svg?branch=master"></a>

Catmandu::Store::RKD - Retrieve items from the RKD

=head1 SEE ALSO

L<Catmandu>

=head1 AUTHORS

Pieter De Praetere, C<< pieter at packed.be >>

=head1 CONTRIBUTORS

Pieter De Praetere, C<< pieter at packed.be >>

=head1 COPYRIGHT AND LICENSE

This package is copyright (c) 2016 by PACKED vzw.
This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.

=cut