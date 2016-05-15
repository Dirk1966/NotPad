my $lNum = 20817;
# my $lRESearch = "=\"" . $lNum . "\"";
# my $lRESearch = "( BillSeqNo|^<Att Ty="CHRRI" Id)=\"" . $lNum . "\"";
my $lRESearch = "( BillSeqNo|^<Att Ty=\"CHRRI\" Id)=\"" . $lNum . "\"";
my $lREReplace = "=\"bsno\"";
my @A = ( '<Document xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="/MyNameSpaceMissingSchemaLocation.xsd" Sender="HeumannD" Id="160218BA00226859174" BAId="BA0022685917" BillSeqNo="20817">'
        , '<CustRef Id="ReplaceInTest" CustCode="3.143.33.4" Reseller="N" PartyType="C" BillSeqNo="20817">'
        , '<SumItem PT="P" ArticleString="ReplaceInTest" LZString="" NumItems="1" CollInd="N" BillSeqNo="20817" >'
        , '<Att Ty="CHRRI" Id="20817" />'
        , '<Att Ty="CHRRI" Id="20817" />'
        , '<SumItem PT="P" ArticleString="27071111.17897487.2.25.1.1" LZString="" NumItems="14" CollInd="N" BillSeqNo="20817" >'
        , '<CustRef Id="DoNotReplaceInTest" CustCode="3.143.33.4" Reseller="N" PartyType="C" BillSeqNo="20917">'
        , '<SumItem PT="P" ArticleString="DoNotReplaceInTest" LZString="" NumItems="1" CollInd="N" BillSeqNo="20917" >'
        , '<Att Ty="CHRRI" Id="20917" />'
        , '<Att Ty="CHRRI" Id="20917" />'
        , '<SumItem PT="P" ArticleString="27071111.17897487.2.25.1.1" LZString="" NumItems="14" CollInd="N" BillSeqNo="20917" >'
        );
grep( s/${lRESearch}/${1}${lREReplace}/g, @A );
foreach my $l ( @A )
{
    # my $lR = $l;
    # $lR =~ s/${lRESearch}/${1}${lREReplace}/g;
    print( $l . "\n" );
}
