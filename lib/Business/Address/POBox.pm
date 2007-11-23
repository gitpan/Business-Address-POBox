package Business::Address::POBox;

use strict;
use warnings;
use String::BlackWhiteList;


our $VERSION = '0.04';


use base qw(Class::Accessor::Complex Class::Accessor::Constructor);


__PACKAGE__
    ->mk_constructor
    ->mk_object_accessors('String::BlackWhiteList' => 'matcher')
    ->mk_array_accessors(qw(blacklist whitelist));


use constant DEFAULTS => (
    blacklist => [
        'BOX',
        'POB',
        'POSTBOX',
        'POST',
        'POSTSCHACHTEL',
        'PO',
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
        'PF',
        'P.F.',
        'POSTFACH',
        'POSTLAGERND',
        'POSTBUS'
    ],
    whitelist => [
        'Post Road',
        'Post Rd',
        'Post Street',
        'Post St',
        'Post Avenue',
        'Post Av',
        'Post Alley',
        'Post Drive',
        'Post Grove',
        'Post Walk',
        'Post Parkway',
        'Post Row',
        'Post Lane',
        'Post Bridge',
        'Post Boulevard',
        'Post Square',
        'Post Garden',
        'Post Strasse',
        'Post Allee',
        'Post Gasse',
        'Post Platz',
    ],
);


sub init {
    my $self = shift;
    $self->update;
}


sub update {
    my $self = shift;
    for ($self->matcher) {
        $_->blacklist($self->blacklist);
        $_->whitelist($self->whitelist);
        $_->update;
    }
}


sub is_pobox {
    my ($self, $text) = @_;
    !$self->matcher->valid($text);
}


1;


__END__



=head1 NAME

Business::Address::POBox - Check whether an address looks like a P.O.Box

=head1 SYNOPSIS

    use Business::Address::POBox;

    if (Business::Address::POBox->new->is_pobox($address)) {
        ...
    }

=head1 DESCRIPTION

This class tries to determine whether or not an string refers to a P.O. box.
This is sometims relevant if your business process, for legal reasons, needs a
real address and not a P.O. box.

It has predefined blacklists and whitelists that should catch most english and
german P.O. box addresses, but you can modify these lists with the methods
provided.

Business::Address::POBox inherits from L<Class::Accessor::Complex>,
L<Class::Accessor::Constructor>, and L<Class::Accessor::Constructor::Base>.

The superclass L<Class::Accessor::Complex> defines these methods and
functions:

    carp(), cluck(), croak(), flatten(), mk_abstract_accessors(),
    mk_array_accessors(), mk_boolean_accessors(),
    mk_class_array_accessors(), mk_class_hash_accessors(),
    mk_class_scalar_accessors(), mk_concat_accessors(),
    mk_forward_accessors(), mk_hash_accessors(), mk_integer_accessors(),
    mk_new(), mk_object_accessors(), mk_scalar_accessors(),
    mk_set_accessors(), mk_singleton()

The superclass L<Class::Accessor> defines these methods and functions:

    _carp(), _croak(), _mk_accessors(), accessor_name_for(),
    best_practice_accessor_name_for(), best_practice_mutator_name_for(),
    follow_best_practice(), get(), make_accessor(), make_ro_accessor(),
    make_wo_accessor(), mk_accessors(), mk_ro_accessors(),
    mk_wo_accessors(), mutator_name_for(), set()

The superclass L<Class::Accessor::Installer> defines these methods and
functions:

    install_accessor(), subname()

The superclass L<Class::Accessor::Constructor> defines these methods and
functions:

    NO_DIRTY(), WITH_DIRTY(), _make_constructor(), mk_constructor(),
    mk_constructor_with_dirty(), mk_singleton_constructor()

The superclass L<Data::Inherited> defines these methods and functions:

    every_hash(), every_list(), flush_every_cache_by_key()

The superclass L<Class::Accessor::Constructor::Base> defines these methods
and functions:

    HYGIENIC(), STORE(), clear_dirty(), clear_hygienic(),
    clear_unhygienic(), contains_hygienic(), contains_unhygienic(),
    delete_hygienic(), delete_unhygienic(), dirty(), dirty_clear(),
    dirty_set(), elements_hygienic(), elements_unhygienic(), hygienic(),
    hygienic_clear(), hygienic_contains(), hygienic_delete(),
    hygienic_elements(), hygienic_insert(), hygienic_is_empty(),
    hygienic_size(), insert_hygienic(), insert_unhygienic(),
    is_empty_hygienic(), is_empty_unhygienic(), set_dirty(),
    size_hygienic(), size_unhygienic(), unhygienic(), unhygienic_clear(),
    unhygienic_contains(), unhygienic_delete(), unhygienic_elements(),
    unhygienic_insert(), unhygienic_is_empty(), unhygienic_size()

The superclass L<Tie::StdHash> defines these methods and functions:

    CLEAR(), DELETE(), EXISTS(), FETCH(), FIRSTKEY(), NEXTKEY(), SCALAR(),
    TIEHASH()

=head1 METHODS

=over 4

=item new

    my $obj = Business::Address::POBox->new;
    my $obj = Business::Address::POBox->new(%args);

Creates and returns a new object. The constructor will accept as arguments a
list of pairs, from component name to initial value. For each pair, the named
component is initialized by calling the method of the same name with the given
value. If called with a single hash reference, it is dereferenced and its
key/value pairs are set as described before.

=item blacklist

    my @values    = $obj->blacklist;
    my $array_ref = $obj->blacklist;
    $obj->blacklist(@values);
    $obj->blacklist($array_ref);

Get or set the array values. If called without an arguments, it returns the
array in list context, or a reference to the array in scalar context. If
called with arguments, it expands array references found therein and sets the
values.

=item blacklist_clear

    $obj->blacklist_clear;

Deletes all elements from the array.

=item blacklist_count

    my $count = $obj->blacklist_count;

Returns the number of elements in the array.

=item blacklist_index

    my $element   = $obj->blacklist_index(3);
    my @elements  = $obj->blacklist_index(@indices);
    my $array_ref = $obj->blacklist_index(@indices);

Takes a list of indices and returns the elements indicated by those indices.
If only one index is given, the corresponding array element is returned. If
several indices are given, the result is returned as an array in list context
or as an array reference in scalar context.

=item blacklist_pop

    my $value = $obj->blacklist_pop;

Pops the last element off the array, returning it.

=item blacklist_push

    $obj->blacklist_push(@values);

Pushes elements onto the end of the array.

=item blacklist_set

    $obj->blacklist_set(1 => $x, 5 => $y);

Takes a list of index/value pairs and for each pair it sets the array element
at the indicated index to the indicated value. Returns the number of elements
that have been set.

=item blacklist_shift

    my $value = $obj->blacklist_shift;

Shifts the first element off the array, returning it.

=item blacklist_splice

    $obj->blacklist_splice(2, 1, $x, $y);
    $obj->blacklist_splice(-1);
    $obj->blacklist_splice(0, -1);

Takes three arguments: An offset, a length and a list.

Removes the elements designated by the offset and the length from the array,
and replaces them with the elements of the list, if any. In list context,
returns the elements removed from the array. In scalar context, returns the
last element removed, or C<undef> if no elements are removed. The array grows
or shrinks as necessary. If the offset is negative then it starts that far
from the end of the array. If the length is omitted, removes everything from
the offset onward. If the length is negative, removes the elements from the
offset onward except for -length elements at the end of the array. If both the
offset and the length are omitted, removes everything. If the offset is past
the end of the array, it issues a warning, and splices at the end of the
array.

=item blacklist_unshift

    $obj->blacklist_unshift(@values);

Unshifts elements onto the beginning of the array.

=item clear_blacklist

    $obj->clear_blacklist;

Deletes all elements from the array.

=item clear_matcher

    $obj->clear_matcher;

Deletes the object.

=item clear_whitelist

    $obj->clear_whitelist;

Deletes all elements from the array.

=item count_blacklist

    my $count = $obj->count_blacklist;

Returns the number of elements in the array.

=item count_whitelist

    my $count = $obj->count_whitelist;

Returns the number of elements in the array.

=item index_blacklist

    my $element   = $obj->index_blacklist(3);
    my @elements  = $obj->index_blacklist(@indices);
    my $array_ref = $obj->index_blacklist(@indices);

Takes a list of indices and returns the elements indicated by those indices.
If only one index is given, the corresponding array element is returned. If
several indices are given, the result is returned as an array in list context
or as an array reference in scalar context.

=item index_whitelist

    my $element   = $obj->index_whitelist(3);
    my @elements  = $obj->index_whitelist(@indices);
    my $array_ref = $obj->index_whitelist(@indices);

Takes a list of indices and returns the elements indicated by those indices.
If only one index is given, the corresponding array element is returned. If
several indices are given, the result is returned as an array in list context
or as an array reference in scalar context.

=item matcher

    my $object = $obj->matcher;
    $obj->matcher($object);
    $obj->matcher(@args);

If called with an argument object of type String::BlackWhiteList it sets the object; further
arguments are discarded. If called with arguments but the first argument is
not an object of type String::BlackWhiteList, a new object of type String::BlackWhiteList is constructed and the
arguments are passed to the constructor.

If called without arguments, it returns the String::BlackWhiteList object stored in this slot;
if there is no such object, a new String::BlackWhiteList object is constructed - no arguments
are passed to the constructor in this case - and stored in the matcher slot
before returning it.

=item matcher_clear

    $obj->matcher_clear;

Deletes the object.

=item pop_blacklist

    my $value = $obj->pop_blacklist;

Pops the last element off the array, returning it.

=item pop_whitelist

    my $value = $obj->pop_whitelist;

Pops the last element off the array, returning it.

=item push_blacklist

    $obj->push_blacklist(@values);

Pushes elements onto the end of the array.

=item push_whitelist

    $obj->push_whitelist(@values);

Pushes elements onto the end of the array.

=item set_blacklist

    $obj->set_blacklist(1 => $x, 5 => $y);

Takes a list of index/value pairs and for each pair it sets the array element
at the indicated index to the indicated value. Returns the number of elements
that have been set.

=item set_whitelist

    $obj->set_whitelist(1 => $x, 5 => $y);

Takes a list of index/value pairs and for each pair it sets the array element
at the indicated index to the indicated value. Returns the number of elements
that have been set.

=item shift_blacklist

    my $value = $obj->shift_blacklist;

Shifts the first element off the array, returning it.

=item shift_whitelist

    my $value = $obj->shift_whitelist;

Shifts the first element off the array, returning it.

=item splice_blacklist

    $obj->splice_blacklist(2, 1, $x, $y);
    $obj->splice_blacklist(-1);
    $obj->splice_blacklist(0, -1);

Takes three arguments: An offset, a length and a list.

Removes the elements designated by the offset and the length from the array,
and replaces them with the elements of the list, if any. In list context,
returns the elements removed from the array. In scalar context, returns the
last element removed, or C<undef> if no elements are removed. The array grows
or shrinks as necessary. If the offset is negative then it starts that far
from the end of the array. If the length is omitted, removes everything from
the offset onward. If the length is negative, removes the elements from the
offset onward except for -length elements at the end of the array. If both the
offset and the length are omitted, removes everything. If the offset is past
the end of the array, it issues a warning, and splices at the end of the
array.

=item splice_whitelist

    $obj->splice_whitelist(2, 1, $x, $y);
    $obj->splice_whitelist(-1);
    $obj->splice_whitelist(0, -1);

Takes three arguments: An offset, a length and a list.

Removes the elements designated by the offset and the length from the array,
and replaces them with the elements of the list, if any. In list context,
returns the elements removed from the array. In scalar context, returns the
last element removed, or C<undef> if no elements are removed. The array grows
or shrinks as necessary. If the offset is negative then it starts that far
from the end of the array. If the length is omitted, removes everything from
the offset onward. If the length is negative, removes the elements from the
offset onward except for -length elements at the end of the array. If both the
offset and the length are omitted, removes everything. If the offset is past
the end of the array, it issues a warning, and splices at the end of the
array.

=item unshift_blacklist

    $obj->unshift_blacklist(@values);

Unshifts elements onto the beginning of the array.

=item unshift_whitelist

    $obj->unshift_whitelist(@values);

Unshifts elements onto the beginning of the array.

=item whitelist

    my @values    = $obj->whitelist;
    my $array_ref = $obj->whitelist;
    $obj->whitelist(@values);
    $obj->whitelist($array_ref);

Get or set the array values. If called without an arguments, it returns the
array in list context, or a reference to the array in scalar context. If
called with arguments, it expands array references found therein and sets the
values.

=item whitelist_clear

    $obj->whitelist_clear;

Deletes all elements from the array.

=item whitelist_count

    my $count = $obj->whitelist_count;

Returns the number of elements in the array.

=item whitelist_index

    my $element   = $obj->whitelist_index(3);
    my @elements  = $obj->whitelist_index(@indices);
    my $array_ref = $obj->whitelist_index(@indices);

Takes a list of indices and returns the elements indicated by those indices.
If only one index is given, the corresponding array element is returned. If
several indices are given, the result is returned as an array in list context
or as an array reference in scalar context.

=item whitelist_pop

    my $value = $obj->whitelist_pop;

Pops the last element off the array, returning it.

=item whitelist_push

    $obj->whitelist_push(@values);

Pushes elements onto the end of the array.

=item whitelist_set

    $obj->whitelist_set(1 => $x, 5 => $y);

Takes a list of index/value pairs and for each pair it sets the array element
at the indicated index to the indicated value. Returns the number of elements
that have been set.

=item whitelist_shift

    my $value = $obj->whitelist_shift;

Shifts the first element off the array, returning it.

=item whitelist_splice

    $obj->whitelist_splice(2, 1, $x, $y);
    $obj->whitelist_splice(-1);
    $obj->whitelist_splice(0, -1);

Takes three arguments: An offset, a length and a list.

Removes the elements designated by the offset and the length from the array,
and replaces them with the elements of the list, if any. In list context,
returns the elements removed from the array. In scalar context, returns the
last element removed, or C<undef> if no elements are removed. The array grows
or shrinks as necessary. If the offset is negative then it starts that far
from the end of the array. If the length is omitted, removes everything from
the offset onward. If the length is negative, removes the elements from the
offset onward except for -length elements at the end of the array. If both the
offset and the length are omitted, removes everything. If the offset is past
the end of the array, it issues a warning, and splices at the end of the
array.

=item whitelist_unshift

    $obj->whitelist_unshift(@values);

Unshifts elements onto the beginning of the array.

=item update

Call this method when you've changed the C<whitelist()> or the C<blacklist()>
so the matcher knows about the changes.

=item is_pobox

This is the central method of this class. It takes a string argument and
checks it against the whitelist and the blacklist. Returns a boolean value -
true if the string passes the whitelist or is at least not caught by the
blacklist, false if the string is caught by the blacklist.

=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<businessaddresspobox> tag.

=head1 VERSION 
                   
This document describes version 0.04 of L<Business::Address::POBox>.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<<bug-business-address-pobox@rt.cpan.org>>, or through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHOR

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

