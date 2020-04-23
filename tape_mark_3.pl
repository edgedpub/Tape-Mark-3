#!/usr/bin/perl -wT
# /home/sites/www.in-vacua.com/web/cgi-bin/tapemark.pl -w
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

my @array = ("while the multitude of things comes into being ",
 "I envisage their return ", 
"although things flourish ", 
 "they all return to their roots ",                             #Lao Tzu’s Tao Te Ching:

"the blinding fireball ", 
 "expands rapidly ", 
"thirty times brighter than the sun ", 
"when it reaches the stratosphere ", 
"at the summit of the cloud ", 
"and takes on the well-known mushroom shape ",  # Michihito Hachiya’s Hiroshima Diary: 

"head pressed on shoulder ", 
"hair between lips ", 
"lay motionless without speaking ", 
"until he moved his fingers slowly ", 
"trying to grasp ");                                                   # Paul Goldwin’s The Mystery of the Elevator: 


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

$seen{int(rand(@array))}++ while scalar keys %seen<9; #a random group of lines will be chosen
                                                              

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
print "<html><head><title>Tape Mark 1</title>

</head>
<body 
link=87CEFF

VLINK=BCEE68

 bgcolor=\"grey\" text=\"white\">

<div align=\"center\"><big style=\"font-family: arial;\"><big><big><span
 style=\"font-weight: bold;\">Tape Mark 1</span></big></big>
 
<font face=Arial size=3>
<br>A version of Tape Mark 1, by Nanni Balestrini<p><br><div align=\"left\"><b>$tape</b>
<br><p>

<form><input type=\"submit\" value=\"More verses\" action onSubmit=\"http://www.in-vacua.com/tzara.pl\"></form>
<p><br><p><br>
<font face=Arial size=3 text color =\"#e0e0e0\">
Tape Mark 1 is a poem by Nanni Balestrini. It dates from 1961. It was exhibited in Cybernetic Serendipity, ICA Gallery, 1968. <br>
It is sometimes credited as the first computer poem. It is a significant early example of computer poetry. <br>
<br> This version has been programmed using the description in the Cybernetic Serendipity catalogue.<br>
The original code is unavailable. The present program produces verses similar to the English translations that are still available.<br> 
There is the occasional oddity in syntax, but according to the catalogue of Cybernetic Serendipity there were, post-computer,<br>
'a few editorial changes in points of grammar and punctuation'.<br> 
It is stated in the catalogue that ten elements were selected. However, on my count the number is nine (see below).<br>
Then this raw text was divided up into six lines of metrical units. <br> The program emulates this approximately.<br><br>



This is an example verse from the Cybernetic Serendipity catalogue. I have indicated where phrases start and finish: <br> <br> 

 Hair between lips, || they all return <br>
          
 to their roots || in the blinding fireball || <br>
    
 I envision their return || until he moves his fingers <br>
                            
 slowly, || and although things flourish || <br>
                                                                            
 takes on the well known mushroom shape || endeavouring <br>
                                         
 to grasp ||  while the multitude of things come into being. <br><br>

Here's another:<br><br>

In the blinding fireball || I envisage<br>

their return || when it reaches the stratosphere ||<br>

while the multitude of things come into being || head pressed <br>

on shoulder || thirty times brighter than the sun || <br>

they all return to their roots || hair <br>

between lips || takes on the well-known mushroom shape.<br><br>



Balestrini sources:<br> <br>   Lao Tzu’s Tao Te Ching: 'While the multitude of things comes into being, I envisage their return. Although things flourish, they all return to their roots.'<br>

 Michihito Hachiya’s Hiroshima Diary: 'The blinding fireball expands rapidly, thirty times brighter than the sun. When it reaches the stratosphere, the summit of the cloud takes on the well-known mushroom shape.'<br>

Paul Goldwin’s The Mystery of the Elevator: 'head pressed on shoulder, hair between lips, lay motionless without speaking, till he moved his fingers slowly, trying to grasp.' <br>

<p><br>The sourcecode is <a href='/tapemark_code.txt'>here</a> <p><br> <a href='/list.html'><p><p>Home</a></html>";


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

