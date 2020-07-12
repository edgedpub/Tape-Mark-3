# #!/usr/bin/perl -wT
# https://www.edgedpub.com/Tape_Mark_3.pl -w
use strict;

print "Content-type: text/html\n\n";

my @array = (
    "Of the streets that fade in the setting sun ",
    "there must be one (which one, I can't say) ",
    "that I've already walked for the very last time ",
    "unaware of the secret limits I obey ",
    "There must be someone whose almighty rule ",
    "causes this hidden order to be fixed ",
    "someone who weaves and then unravels ",
    "the dreamlike shadows with which life is mixed ",    # Limits by Jorge Luis Borges:

    "I wandered lonely as a cloud ",
    "That floats on high o'er vales and hills ",
    "When all at once I saw a crowd ",
    "A host, of golden daffodils ",
    "Beside the lake, beneath the trees ",
    "Fluttering and dancing in the breeze ",
    "Continuous as the stars that shine ",
    "And twinkle on the milky way ",
    "They stretched in never-ending line ",
    "Along the margin of a bay ",
    "Ten thousand saw I at a glance ",
    "Tossing their heads in sprightly dance ",    # I Wandered Lonely as a Cloud By William Wordsworth:

    "Perhaps one morning walking in dry glassy air ",
    "I will turn, I will see the miracle complete ",
    "nothingness at my shoulder, the void behind ",
    "me, with a drunkard's terror ",
    "Then, as on a screen, trees houses hills ",
    "will advance swiftly in familiar illusion ",
    "But it will be too late; and I will return, silently ",
    "to men who do not look back, with my secret"
);                                                # Perhaps One Morning Walking by Montale:

## example stanza

#              0                         1
# Hair between lips, || they all return <br>
#                                      2
# to their roots || in the blinding fireball || <br>
#           3                                        4
# I envision their return || until he moves his fingers
#                                      5
# slowly || and although things flourish ||
#                       6                                                       7
# takes on the well known mushroom shape || endeavouring
#                                          8
# to grasp ||  while the multitude of things come into being.
#

my @select;
for ( 0 .. 23 ) {
    push @select, $array[ int( rand( scalar @array ) ) ];
}

$select[0] = ucfirst( $select[0] );    #  cap first line

$select[0] =~ s/(\s*\S+)(\s*)$/$1,$2/;       # add comma
$select[1] =~ s/(\w+\W+)(\w+)/$1<br>$2/;     # line  broken after second word
$select[2] =~ s/(\s*\S+)(\s*)$/$1<br>$2/;    # line end break
$select[3] =~ s/(\s*\S+)(\s*)$/$1<br>$2/;    # line end break
$select[4] =~ s/(\s*\S+)(\s*)$/$1,$2/;       # line end comma
$select[4] =~ s/(\s*\S+)(\s*)$/<br>$1$2/;    # line break before last word

for my $line ( 5 .. 9 ) {
    $select[$line] =~ s/(\s*\S+)(\s*)$/$1<br>$2/;    # line end break
}

$select[10] =~ s/(\s*\S+)(\s*)$/<br>$1$2/;           # line break before last word

for my $line ( 11 .. 22 ) {
    $select[$line] =~ s/(\s*\S+)(\s*)$/$1<br>$2/;    # line end break
}

$select[23] =~ s/(\s*\S+)(\s*)$/$1\.<br>$2/;         # line end break and stop added

my $tape = join ' ', @select;
print "<html><head><title>Tape Mark 3</title>
</head>
<body 
link=87CEFF
VLINK=BCEE68
 bgcolor=\"sky blue\" text=\"white\">
<div align=\"center\"><big style=\"font-family: arial;\"><big><big><span
 style=\"font-weight: bold;\">Tape Mark 3</span></big></big>
 
<font face=Arial size=4>
<br>A version of Tape Mark 1, by Nanni Balestrini<p><br><div align=\"center\"><b>$tape</b>
<br><p>
<form><input type=\"submit\" value=\"Generate new poem\" action onSubmit=></form>
<p><br><p><br>
<font face=Arial size=4 text color =\"#e0e0e0\">


<div align=\"left\">
<i>Tape Mark 3</i> is a variation of Nanni Balestrini's <i>Tape Mark 1</i><br>
The verses of this poem are composed by the first two strophes of the following poems:<br>
<i>I Wandered Lonely as a Cloud</i> by William Wordsworth;<br>
<i>Perhaps One Morning Walking</i> by Montale; <br>
<i>Limits</i> by Jorge Luis Borges; <br><div align=\"left\">

<p><br>The sourcecode is <a href='https://github.com/edgedpub/Tape-Mark-3'>here</a> and it was originally written by <a href='http://www.in-vacua.com/cgi-bin/tapemark.pl'>Wayne Clements</a></html>";

