package Catmandu::Store::RKD::Bag;

use Moo;
use LWP::UserAgent;

use Catmandu::Store::RKD::SearchResult;

use Catmandu::Sane;

with 'Catmandu::Bag';


sub generator {
    my $self = shift;
}

sub get {
    my ($self, $id) = @_;
    my $sr = Catmandu::Store::RKD::SearchResult->new(
        search_term => sprintf('naamdeel:(%s)', $id)
    );
    return $sr->results;
}

sub add {
    my $self = shift;
}

sub update {
    my $self = shift;
}

sub delete {
    my $self = shift;
}

sub delete_all {
    my $self = shift;
}

1;