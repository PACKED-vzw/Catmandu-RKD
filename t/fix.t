use strict;
use warnings;
use Test::More;

my $pkg;

BEGIN {
    $pkg = 'Catmandu::Fix::rkd_name';
    use_ok $pkg;
}

my $record = {
    record => {
        'author' => {
            'name' => 'Hans Memling'
        }
    }
};

is_deeply $pkg->new('author.name', 'fixer')->fix($record),
    {'author' => {'name' => [
        {
            "artist_link" => "https://rkd.nl/opensearch-eac-cpf?q=kunstenaarsnummer:55174",
            "guid" => "https://rkd.nl/explore/artists/55174",
            "title" => "Memling, Hans",
            "description" => "schilder, tekenaar"
            }
        ]}};

done_testing 2;


