package Catmandu::Fix::rkd_name;

use strict;

use Catmandu::Sane;
use Moo;

use Catmandu::Fix::Has;
use Catmandu::Fix::Datahub::Util qw(declare_source);

with 'Catmandu::Fix::Base';

has path     => (fix_arg => 1);

sub emit {
    my ($self, $fixer) = @_;
    my $perl = '';

    $perl .= 'use Catmandu::Store::RKD::API::Name;';

    my $name = $fixer->generate_var();
    my $rkd = $fixer->generate_var();

    $perl .= "my ${name};";
    $perl .= declare_source($fixer, $self->path, $name);

    $perl .= "my ${rkd} = Catmandu::Store::RKD::API::Name->new(name_to_search => ${name});";

    $perl .= $fixer->emit_create_path(
        $fixer->var,
        $fixer->split_path($self->path),
        sub {
            my $root = shift;
            my $code = '';
            $code .= "${root} = ${rkd}->results;";

            return $code;
        }
    );

    return $perl;
}

1;