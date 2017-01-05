requires 'perl', '5.008005';

on test => sub {
    requires 'Test::More', '0.96';
};

requires 'Moo';
requires 'XML::Struct';
requires 'LWP::UserAgent';


requires 'Catmandu', '>=1.0304';
requires 'Catmandu::Fix::Datahub', '>=0.01';
