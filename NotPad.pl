#!/usr/bin/perl
use strict;


sub Usage
{
    my $this = $0;
    if ( $this =~ "^\." )
    {
        use Cwd 'abs_path';
        $this = abs_path( $this );
        my $f = "\/([A-Za-z])\/";
        if ( "msys" eq $^O && $this =~ m/$f/ ) {
            $this =~ s/$f/$1:\//;
        }
    }
    print( "Simple wrapper for Windows' notepad.exe to\n"
         . "  1st  edit Unix files with LF endings with notepad.exe\n"
         . "  2nd  enable the usage of notepad.exe inside\n"
         . "       all versions of \"git for Windows\"\n\n"
         . "Start with " . $0 . " FileName\n\n"
         . "Enable it inside \"git for Windows\" with\n"
         . "    git config --global core.editor \"" . $this . "\"\n"
         . "if is always accessible on this system there.\n\n"
         . "Remark: Files are processed \"inline\", no temporary files are used.\n"
         );
    exit( __LINE__ % 100 + 2 );  # Just end with error code ne 0.
}


# Read file, find and replace content and write result in same file
sub ReadReplaceAndWriteFile
{
    my $pFilNam = shift or die "File name parameter not supplied";
    my $pLinArr = shift or die "Pointer to line array not supplied";
    my $pFind   = shift or die "Find string not supplied";
    my $pRepl   = shift or die "Replace string not supplied";
    my $ch      = 0; # Counts the changes.
    open( my $lFilHdl, "+<", $pFilNam ) or die "Could not open File for reading " . $pFilNam;
    while( my $lLin = <$lFilHdl> ) {
        $ch += $lLin =~ s/$pFind/$pRepl/;
        push( @$pLinArr, $lLin );
    }
    # Only write file if replacements were made.
    if ( 0 != $ch ) {
        seek( $lFilHdl, 0, 0 );
        truncate( $lFilHdl, 0 ); # Fix for perl 5.22 under "git for Windows 2", 2015-09-15
        print( $lFilHdl @$pLinArr );
    }
    else {
        if ( defined( $ENV{ 'DEBUG_NOTPAD' } ) ) {
            print( "No changes were made, will skip writing on file\n" );
        }
    }
    close( $lFilHdl );
}


sub LsAndHexDumpFile {
    my $pFilNam = shift or die "File name parameter not supplied";
    if ( defined( $ENV{ 'DEBUG_NOTPAD' } ) ) {
        system( "ls -l \"" . $pFilNam . "\"" );
        system( "hexdump -C \"" . $pFilNam . "\"" );
    }
}


if ( -1 == $#ARGV ) {
    Usage();
}

my ( $lFilNam, $lCmd, $lRet, $lTextArr ) = ( "", "", 0, [] );

for my $lElem ( @ARGV ) {
    if ( "" eq $lFilNam && -f $lElem ) {
        $lFilNam = $lElem;
    }
    elsif( -f $lElem ) {
        print( STDERR "Warning: Only one file as parameter supported, will stop.\n" );
        exit( __LINE__ % 100 + 2 );
    }
    else {
        print( STDERR "Warning: Parameter \"" . $lElem . "\" unknown, will stop.\n" );
        exit( __LINE__ % 100 + 2 );
    }
}

if ( "" eq $lFilNam ) {
    print( STDERR "No valid file name supplied, \""
                . $0
                . "\" will be stopped.\n"
                );
    exit( __LINE__ % 100 + 2 );
}

LsAndHexDumpFile( $lFilNam );

# Read file, find LF and replace with CRLF
# and write result in same file.
ReadReplaceAndWriteFile( $lFilNam, $lTextArr, "\n", "\r\n" );
delete @$lTextArr[0 .. $#$lTextArr];

LsAndHexDumpFile( $lFilNam );

# Start notepad.exe with file
if ( "linux" ne $^O ) {
    if ( ! defined( $ENV{ 'EDITOR_NOTPAD' } ) ) {
        $lCmd = "notepad.exe \"" . $lFilNam . "\"";
    }
    else {
        $lCmd = $ENV{ 'EDITOR_NOTPAD' } . " \"" . $lFilNam . "\"";
    }
} else {
    if ( ! defined( $ENV{ 'EDITOR_NOTPAD' } ) ) {
       $lCmd = "ls \"" . $lFilNam . "\"";
    }
    else {
       $lCmd = $ENV{ 'EDITOR_NOTPAD' } . " \"" . $lFilNam . "\"";
    }
}
print( $lCmd . "\n" );
$lRet = system( $lCmd );
if ( $lRet ) {
    print( "notepad.exe returned with error value " . $lRet . "\n" );
    exit( $lRet );
}

LsAndHexDumpFile( $lFilNam );

# Write file content with LF, stripped from CRLF.
ReadReplaceAndWriteFile( $lFilNam, $lTextArr, "\r\n", "\n" );

LsAndHexDumpFile( $lFilNam );

# system( "perl -de 0" );

exit( $lRet );
