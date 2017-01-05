package Catmandu::Store::RKD::SearchResult;

use Moo;
use LWP::UserAgent;
use XML::Struct qw(readXML);

use Data::Dumper qw(Dumper);

use Catmandu::Sane;

has search_term => (is => 'ro', required => 1);

has engine   => (is => 'lazy');
has results  => (is => 'lazy');

sub _build_engine {
    my $self = shift;
    my $engine = LWP::UserAgent->new();
    return $engine;
}

sub _build_results {
    my $self = shift;
    my $items_raw = $self->__search();
    my $items = [];
    $items_raw = $self->parse($items_raw);
    push @{$items}, @{$items_raw->{'items'}};
    while ($items_raw->{'total'} > $items_raw->{'start'} * $items_raw->{'per_page'}) {
        my $startIndex = $items_raw->{'start'} + $items_raw->{'per_page'};
        $items_raw = $self->parse($self->__search($startIndex));
        push @{$items}, @{$items_raw->{'items'}};
    }
    return $self->extract($items);
}

sub __search {
    my ($self, $startIndex) = @_;
    my $url;
    if (defined($startIndex)) {
        my $template = 'http://opendata.rkd.nl/opensearch/artists/eac-cpf?q=%s&startIndex=%s';
        $url = sprintf($template, $self->search_term, $startIndex);
    } else {
        my $template = 'http://opendata.rkd.nl/opensearch/artists/eac-cpf?q=%s';
        $url = sprintf($template, $self->search_term);
    }
    my $response = $self->engine->get($url);
    if ($response->is_success) {
        return $response->decoded_content;
    } else {
        Catmandu::HTTPError->throw({
                code             => $response->code,
                message          => $response->status_line,
                url              => $response->request->uri,
                method           => $response->request->method,
                request_headers  => [],
                request_body     => $response->request->decoded_content,
                response_headers => [],
                response_body    => $response->decoded_content,
            });
        return undef;
    }
}

sub parse {
    my ($self, $results) = @_;
    my $tree = readXML($results, simple => 1);
    my $items = $tree->{'channel'}->{'item'};
    my $total = $tree->{'channel'}->{'opensearch:totalResults'};
    my $per_page = $tree->{'channel'}->{'opensearch:itemsPerPage'};
    my $start = $tree->{'channel'}->{'opensearch:startIndex'};
    return {
        'items'    => $items,
        'total'    => $total,
        'per_page' => $per_page,
        'start'    => $start
    };
}

sub __extract {
    my ($self, $item) = @_;
    return {
        'guid'        => $item->{'guid'}->{'content'},
        'title'       => $item->{'title'},
        'description' => $item->{'description'}
    };
}

sub extract {
    my ($self, $items) = @_;
    my $extracted = [];
    foreach my $item (@{$items}) {
        push @{$extracted}, $self->__extract($item);
    }
    return $extracted;
}

1;