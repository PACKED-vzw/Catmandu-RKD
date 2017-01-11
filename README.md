# NAME

<div>
    <a href="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD"><img src="https://travis-ci.org/PACKED-vzw/Catmandu-Store-RKD.svg?branch=master"></a>
</div>

Catmandu::Store::RKD - Retrieve items from the RKD

# SYNOPSIS

This module contains two submodules; a [fix](https://metacpan.org/pod/Catmandu::Fix::rkd_name) to lookup a name in 
[RKD](https://rkd.nl/nl/collecties/overige-databases/open-search-rkdartists), and a [store](https://metacpan.org/pod/Catmandu::Store::RKD) to 
lookup an artist id (_kunstenaarsnummer_) in the RKD database.

# DESCRIPTION

## [Catmandu::Fix::rkd\_name](https://metacpan.org/pod/Catmandu::Fix::rkd_name)

The fix takes a name (first name, last name or a combination) and performs a lookup to the RKD artists database. It 
returns an array of results. Every result is of the form:

    {
        'title'       => 'Name of the person',
        'description' => 'Short description, as provided by RKD',
        'artist_link' => 'Link to the artist using the artist id',
        'guid'        => 'Permalink to the record'
    }

For some names, it can/will return multiple possibilities. You must determine yourself which one is the 'correct' one.

## [Catmandu::Store::RKD](https://metacpan.org/pod/Catmandu::Store::RKD)

The store takes an artist id (_kunstenaarsnummer_) and performs a lookup to the RKD artists database. It 
returns an array containing either one or no results.  Every result is of the form:

    {
        'title'       => 'Name of the person',
        'description' => 'Short description, as provided by RKD',
        'artist_link' => 'Link to the artist using the artist id',
        'guid'        => 'Permalink to the record'
    }

# SEE ALSO

[Catmandu](https://metacpan.org/pod/Catmandu)
[Catmandu::Fix::rkd\_name](https://metacpan.org/pod/Catmandu::Fix::rkd_name)

# AUTHORS

Pieter De Praetere, `pieter at packed.be`

# CONTRIBUTORS

Pieter De Praetere, `pieter at packed.be`

# COPYRIGHT AND LICENSE

This package is copyright (c) 2016 by PACKED vzw.
This is free software; you can redistribute it and/or modify it under the same terms as the Perl 5 programming language system itself.
