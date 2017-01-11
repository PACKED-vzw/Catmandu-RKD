# NAME

<div>
    <a href="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD"><img src="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD.svg?branch=master"></a>
</div>

Catmandu::RKD - Retrieve items from the RKD (Rijksbureau voor Kunsthistorische Documentatie) artist database

# SYNOPSIS

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

# MODULES

- [Catmandu::Store::RKD](https://metacpan.org/pod/Catmandu::Store::RKD)
- [Catmandu::Fix::rkd\_name](https://metacpan.org/pod/Catmandu::Fix::rkd_name)
- [Catmandu::RKD::API::Name](https://metacpan.org/pod/Catmandu::RKD::API::Name)

# AUTHORS

Pieter De Praetere, `pieter at packed.be`

# CONTRIBUTORS

Pieter De Praetere, `pieter at packed.be`

# COPYRIGHT AND LICENSE

This package is copyright (c) 2016 by PACKED vzw.
This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.
