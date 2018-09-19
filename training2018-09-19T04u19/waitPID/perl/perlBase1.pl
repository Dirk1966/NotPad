#!/usr/bin/env perl
use strict;

exit main();

sub fInit{
    if ( defined( $ENV{ "INSIDE_EMACS" } ) ){
        $| = 1; # Switch off buffering inside emacs
    }
}

sub main{
    fInit();
    my ( $lCmd, $lOut, $lH ) = ( "", [], {} );
    $lCmd = "find -L ~ -type f";
    $lCmd .= " 2>/dev/null";
    printf( "%s\n", $lCmd );
    # my $e = system( $lCmd ); # system just returns the error value
    # @$lOut = `$lCmd`;
    # chomp( @$lOut );
    open( my $lFH, "-|", $lCmd );
    while ( my $l = <$lFH> ){
        printf( "%s", $l );
        chomp( $l );
    }
    return 0;
}
