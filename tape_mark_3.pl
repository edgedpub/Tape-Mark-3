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

                    $select[0] =~ s/$last0/$last0,/; # add comma 


my ($nth) = $select[1] =~ /(?:\w+\W+){1}(\w+)/;

                   $select[1] =~ s/$nth/$nth <br>/;    # line  broken after second word


(my $last1) = $select[2] =~ /(\s*\S+)\s*$/;

                    $select[2] =~ s/$last1/$last1<br>/; # line end break

                    
(my $last3a) = $select[3] =~ /(\s*\S+)\s*$/;

                    $select[3] =~ s/$last3a/$last3a,/; # line end comma

(my $last4a) = $select[4] =~ /(\s*\S+)\s*$/;

                    $select[4] =~ s/$last4a/$last4a,/; # line end comma

(my $last2) = $select[4] =~ /(\s*\S+)\s*$/;

                    $select[4] =~ s/$last2/<br>$last2/; # line break before last word


(my $last3) = $select[5] =~ /(\s*\S+)\s*$/;

                    $select[5] =~ s/$last3/$last3,<br>/; # line end break


#                  $select[6]; ## stays unchanged


(my $first1) = ($select[7] =~ /\A(.*?) /);

                    $select[7] =~ s/$first1/$first1<br>/; # line end break


(my $last4) = $select[8] =~ /(\s*\S+)\s*$/;

                    $select[8] =~ s/$last4/$last4\.<br>/; # line end break and stop added

my $tape = join ' ', @select; 
print "<html><head><title>Tape Mark 3</title>
</head>
<body 
link=87CEFF
VLINK=BCEE68
 bgcolor=\"sky blue\" text=\"white\">
<div align=\"center\"><big style=\"font-family: arial;\"><big><big><span
 style=\"font-weight: bold;\">Tape Mark 3</span></big></big>
 
<font face=Arial size=3>
<br>A version of Tape Mark 1, by Nanni Balestrini<p><br><div align=\"left\"><b>$tape</b>
<br><p>
<form><input type=\"submit\" value=\"Generate new poem\" action onSubmit=\"http://www.in-vacua.com/tzara.pl\"></form>
<p><br><p><br>
<font face=Arial size=3 text color =\"#e0e0e0\">



<i>Tape Mark 3</i> is a variation of Nanni Balestrini's <i>Tape Mark 1</i><br>
The verses of this poem are composed by the first two strophes of the following poems:<br>
<i>Limits</i> by Jorge Luis Borges; <br>
<i>I Wandered Lonely as a Cloud</i> by William Wordsworth;<br>
<i>Perhaps One Morning Walking</i> by Montale; <br>

<p><br>The sourcecode is <a href='https://github.com/edgedpub/Tape-Mark-3'>here</a> and it was originally developed by <a href='http://www.in-vacua.com/cgi-bin/tapemark.pl'>Wayne Clements

<p><br> <a href='/list.html'><p><p>Home</a></html>"; 


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
