#!/usr/bin/perl -wT
# https://www.edgedpub.com/Tape_Mark_3.pl -w
use strict;
use CGI qw(:all);

###############################
# 'Tape Mark 1' (description: generates Balestrini-esque verses)
# Copyright (C) 2013 Wayne Clements
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
# See <http://www.gnu.org/licenses/>. #
#
# The program is presented as it is on my website.
# The html and links are as per in-vacua.com. You can change this as necessary.
#
#  Words and phrases below quote translations by Edwin Morgan of Balestrini.
#
#  Wayne Clements, www.in-vacua.com. email:  invacua_at__btinternet[Do T]com
#
###############################

print "Content-type: text/html\n\n";

srand;

my @array = ("Of the streets that fade in the setting sun ",
 "there must be one (which one, I can't say) ", 
"that I've already walked for the very last time ", 
 "unaware of the secret limits I obey ",
 "There must be someone whose almighty rule ",
"causes this hidden order to be fixed ",
"someone who weaves and then unravels ",
"the dreamlike shadows with which life is mixed ",  # Limits by Jorge Luis Borges:

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
"Tossing their heads in sprightly dance ",  # I Wandered Lonely as a Cloud By William Wordsworth: 

"Perhaps one morning walking in dry glassy air ", 
"I will turn, I will see the miracle complete ", 
"nothingness at my shoulder, the void behind ", 
"me, with a drunkard's terror ",
"Then, as on a screen, trees houses hills ", 
"will advance swiftly in familiar illusion ", 
"But it will be too late; and I will return, silently ", 
"to men who do not look back, with my secret");  # Perhaps One Morning Walking by Montale: 


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


my %seen = ();

$seen{int(rand(@array))}++ while scalar keys %seen<24; #a random group of lines will be chosen
                                                              

my @select = @array[keys %seen];

shuffle(\@select);


                  $select[0] = ucfirst($select[0]);    #  cap first line
 
(my $last0) = $select[0] =~ /(\s*\S+)\s*$/;

                    $select[0] =~ s/\Q$last0/$last0,/; # add comma 

(my $nth) = $select[1] =~ /(?:\w+\W+){1}(\w+)/;

                   $select[1] =~ s/$nth/$nth <br>/;    # line  broken after second word

(my $last1) = $select[2] =~ /(\s*\S+)\s*$/;

                    $select[2] =~ s/\Q$last1/$last1<br>/; # line end break

(my $last3a) = $select[3] =~ /(\s*\S+)\s*$/;

                    $select[3] =~ s/\Q$last3a/$last3a<br>/; # line end break

(my $last4a) = $select[4] =~ /(\s*\S+)\s*$/;

                    $select[4] =~ s/\Q$last4a/$last4a,/; # line end comma

(my $last2) = $select[4] =~ /(\s*\S+)\s*$/;

                    $select[4] =~ s/\Q$last2/<br>$last2/; # line break before last word

(my $last3) = $select[5] =~ /(\s*\S+)\s*$/;

                    $select[5] =~ s/\Q$last3/$last3<br>/; # line end break

(my $last4) = $select[6] =~ /(\s*\S+)\s*$/;

                    $select[6] =~ s/\Q$last4/$last4<br>/; # line end break
                    
(my $last5) = $select[7] =~ /(\s*\S+)\s*$/;
 
                    $select[7] =~ s/\Q$last5/$last5<br>/;  # line end break
                    
(my $last6) = $select[8] =~ /(\s*\S+)\s*$/;
 
                    $select[8] =~ s/\Q$last6/$last6<br>/; # line end break
                    
 (my $last7) = $select[9] =~ /(\s*\S+)\s*$/;
 
                    $select[9] =~ s/\Q$last7/$last7<br>/; # line end break
                    
(my $last8) = $select[10] =~ /(\s*\S+)\s*$/;

                    $select[10] =~ s/\Q$last8/<br>$last8/; # line break before last word

(my $last9) = $select[11] =~ /(\s*\S+)\s*$/;
 
                    $select[11] =~ s/\Q$last9/$last9<br>/;  # line end break
                    
(my $last10) = $select[12] =~ /(\s*\S+)\s*$/;
 
                    $select[12] =~ s/\Q$last10/$last10<br>/;  # line end break

(my $last11) = $select[13] =~ /(\s*\S+)\s*$/;
 
                    $select[13] =~ s/\Q$last11/$last11<br>/;  # line end break                 
(my $last12) = $select[14] =~ /(\s*\S+)\s*$/;
 
                    $select[14] =~ s/\Q$last12/$last12<br>/;  # line end break
                    
(my $last13) = $select[15] =~ /(\s*\S+)\s*$/;
 
                    $select[15] =~ s/\Q$last13/$last13<br>/;  # line end break
                    
(my $last14) = $select[16] =~ /(\s*\S+)\s*$/;
 
                    $select[16] =~ s/\Q$last14/$last14<br>/;  # line end break                    
(my $last15) = $select[17] =~ /(\s*\S+)\s*$/;
 
                    $select[17] =~ s/\Q$last15/$last15<br>/;  # line end break
        
(my $last16) = $select[18] =~ /(\s*\S+)\s*$/;
 
                    $select[18] =~ s/\Q$last16/$last16<br>/;  # line end break
                    
(my $last17) = $select[19] =~ /(\s*\S+)\s*$/;
 
                    $select[19] =~ s/\Q$last17/$last17<br>/;  # line end break

(my $last18) = $select[20] =~ /(\s*\S+)\s*$/;
 
                    $select[20] =~ s/\Q$last18/$last18<br>/;  # line end break

(my $last19) = $select[21] =~ /(\s*\S+)\s*$/;
 
                    $select[21] =~ s/\Q$last19/$last19<br>/;  # line end break

(my $last20) = $select[22] =~ /(\s*\S+)\s*$/;
 
                    $select[22] =~ s/\Q$last20/$last20<br>/;  # line end break
                    
(my $last21) = $select[23] =~ /(\s*\S+)\s*$/;
 
                    $select[23] =~ s/\Q$last21/$last21<br>/;  # line end break and stop added



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


# fisher yates shuffle
sub shuffle {
my($select) = shift();
for (my $i = @$select; --$i; ) {
my($j) = int(rand($i + 1));
next() if ($i == $j);
@$select[$i, $j] = @$select[$j, $i];
}
} #EOSub

exit();
