package Catmandu::Store::RKD::SearchResult;

use Moo;
use LWP::UserAgent;
use XML::Struct qw(readXML);

use Catmandu::Sane;

has search_term => (is => 'ro', required => 1);

has engine   => (is => 'lazy');
has results  => (is => 'lazy');

sub _build_engine {
    my $self = shift;
    my $engine = LWP::UserAgent->new();
    return $engine;
}

1;