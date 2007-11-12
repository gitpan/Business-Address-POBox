#!/usr/bin/env perl

use warnings;
use strict;
use Business::Address::POBox;
use Test::More;
use Test::Exception;


my @is_not_pobox = (
    'Post Road 123',
    'Post Rd 123',
    'Post Street 123',
    'Post St 123',
    'Post Avenue 123',
    'Post Av 123',
    'Post Alley 123',
    'Post Drive 123',
    'Post Grove 123',
    'Post Walk 123',
    'Post Parkway 123',
    'Post Row 123',
    'Post Lane 123',
    'Post Bridge 123',
    'Post Boulevard 123',
    'Post Square 123',
    'Post Garden 123',
    'Post Strasse 123',
    'Post Allee 123',
    'Post Gasse 123',
    'Post Platz 123',
    'Postsparkassenplatz 1',
    'Postelweg 5',
    'Boxgasse 32',
    'Postfachplatz 11',
    'PFalznerweg 91',
    'aPOSTelweg 12',
);

    
my @is_pobox = (
    'Box 123',
    'Pob',
    'Postbox',
    'Post',
    'Postschachtel',
    'PO 37, Postgasse 5',
    'P O',
    'P O BOX',
    'P.O.',
    'P.O.B.',
    'P.O.BOX',
    'P.O. BOX',
    'P. O.',
    'P. O.BOX',
    'P. O. BOX',
    'POBOX',
    'PF 123',
    'P.F. 37, Post Drive 9',
    'P.O. BOX 37, Post Drive 9',
    'Post Street, P.O.B.',
    'Postfach 41, 1023 Wien',
    'Post Gasse, Postlagernd',
    'POSTBUS'
);


plan tests => @is_not_pobox + @is_pobox;

for my $value (@is_not_pobox) {
    ok(!Business::Address::POBox->new->is_pobox($value),
        "value [$value] is not a pobox");
}

for my $value (@is_pobox) {
    ok(Business::Address::POBox->new->is_pobox($value),
        "value [$value] is a pobox");
}

