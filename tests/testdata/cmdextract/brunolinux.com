<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html; charset=ISO-8859-1"
 http-equiv="content-type">
  <link rel="SHORTCUT ICON"
 href="http://www.brunolinux.com/Images/div/favicon.ico">
<!-- 1-CUT HERE-->
  <title>Find and Replace with Sed</title>
</head>
<!-- 1-CUT HERE-->
<body style="background-color: rgb(238, 238, 238); color: rgb(0, 0, 0);"
 alink="#ee0000" link="#0000ee" vlink="#551a8b">
<!-- 2-CUT HERE-->
<table style="text-align: center; margin-left: auto; margin-right: auto; width: 762px; height: 23px;" border="0" cellpadding="0" cellspacing="0" align="center">
  <tbody> 
  <tr align="center">
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><a href="http://www.brunolinux.com/" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">Tips
Linux Explorers</a><span style="font-size: 10px;">&nbsp;</span></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><img src="../Images/div/carree.png" alt="" border="0" height="10" width="7"></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><span style="font-size: 10px;">&nbsp;</span><a href="http://forums.scotsnewsletter.com/index.php?s=09fc4fb26291380b0bf08c35b5dbb390&amp;act=SF&amp;f=14" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">All
Things Linux Forum</a><span style="font-size: 10px;">&nbsp;</span></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><img src="../Images/div/carree.png" alt="" border="0" height="10" width="7"></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><span style="font-size: 10px;">&nbsp;</span><a href="http://www.brunolinux.com/10-General_Info/Great_Linux_Links.html" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">Great
Linux Links</a><span style="font-size: 10px;">&nbsp;</span></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><img src="../Images/div/carree.png" alt="" border="0" height="10" width="7"></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><span style="font-size: 10px;">&nbsp;</span><a href="http://www.linuxclues.com/" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">LinuxClues.com</a><span style="font-size: 10px;">&nbsp;</span></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><img src="../Images/div/carree.png" alt="" border="0" height="10" width="7"></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><span style="font-size: 10px;">&nbsp;</span><a href="http://www.panoramsterdam.nl" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">Hometown</a><span style="font-size: 10px;">&nbsp;</span></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><img src="../Images/div/carree.png" alt="" border="0" height="10" width="7"></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><span style="font-size: 10px;">&nbsp;</span><a href="mailto:tips&#64;brun&#111;li&#110;ux.com" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">Email</a><span style="font-size: 10px;">&nbsp;</span></td>
    </tr>
  </tbody>
</table>
<!-- 2-CUT HERE-->
<div style="margin-left: 40px;">
<div class="postcolor"> 
<br>
<br>
<br>
FIND AND REPLACE with SED<br>
<br>
<br>
<br>
Let us start off simple:<br>
Imagine
you have a large file ( txt, php, html, anything ) and you want to
replace all the words "ugly" with "beautiful" because you just met your
old friend Sue again and she/he is coming over for a visit.<br>
<br>
<br>
This is the command:<br>
<br>
<!--c1--></div>
<table align="center" border="1" cellpadding="3" cellspacing="1"
 width="95%">
  <tbody>
    <tr>
      <td style="background-color: rgb(255, 255, 255);"><b>CODE</b> </td>
    </tr>
    <tr>
      <td style="background-color: rgb(255, 255, 255);" id="CODE"><!--ec1-->$
sed -i 's/ugly/beautiful/g'
/home/bruno/old-friends/sue.txt<!--c2--></td>
    </tr>
  </tbody>
</table>
<div class="postcolor"><br>
<br>
Well, that command speaks for itself "<b>sed</b>" edits "<b>-i</b> in
place ( on the spot ) and replaces the word "<b>ugly</b> with "<b>beautiful</b>"
in the file "<b>/home/bruno/old-friends/sue.txt</b>"<br>
<br>
<br>
Now, here comes the real magic:<br>
Imagine
you have a whole lot of files in a directory ( all about Sue ) and you
want the same command to do all those files in one go because she/he is
standing right at the door . . <br>
Remember the <a href="../02-The_Terminal/The_Find_Command.html"
 target="_blank">find</a> command ? We will combine the two:<br>
<br>
<!--c1--></div>
<table align="center" border="1" cellpadding="3" cellspacing="1"
 width="95%">
  <tbody>
    <tr>
      <td style="background-color: rgb(255, 255, 255);"><b>CODE</b> </td>
    </tr>
    <tr>
      <td style="background-color: rgb(255, 255, 255);">$
find /home/bruno/old-friends -type f
-exec sed -i 's/ugly/beautiful/g' {} \;<!--c2--></td>
    </tr>
  </tbody>
</table>
<div class="postcolor"><br>
<br>
Sure
in combination with the find command you can do all kind of nice
tricks, even if you don't remember where the files are located !<br>
<br>
<br>
Aditionally I did find a little script <a
 href="http://gabeanderson.com/life/2003/02/20/unixlinux_find_replace_in_multiple_files.php"
 target="_blank">on the net</a> for if you often have to find and
replace multiple files at once:<br>
<br>
<!--c1--></div>
<table align="center" border="1" cellpadding="3" cellspacing="1"
 width="95%">
  <tbody>
    <tr>
      <td style="background-color: rgb(255, 255, 255);"><b>CODE</b> </td>
    </tr>
    <tr>
      <td style="background-color: rgb(255, 255, 255);">#!/bin/bash<br>
&nbsp; &nbsp; &nbsp;for fl in *.php; do<br>
&nbsp; &nbsp; &nbsp;mv $fl $fl.old<br>
&nbsp; &nbsp; &nbsp;sed 's/FINDSTRING/REPLACESTRING/g' $fl.old &gt; $fl<br>
&nbsp; &nbsp; &nbsp;rm -f $fl.old<br>
&nbsp; &nbsp; &nbsp;done<!--c2--></td>
    </tr>
  </tbody>
</table>
<div class="postcolor"><!--ec2--><br>
just replace the "<b>*.php</b>", "<b>FINDSTRING</b>" and "<b>REPLACESTRING</b>"
make it executable and you are set.<br>
<br>
I
changed a www address in 183 .html files in one go with this little
script . . . but note that you have to use "escape-signs" ( \ ) if
there are slashes in the text you want to replace, so as an example:
's/www.search.yahoo.com\/images/www.google.com\/linux/g' to change
www.search.yahoo.com/images to www.google.com/linux<br>
<br>
<br>
<br>
<br>
For the lovers of perl I also found this one:<br>
<br>
</div>
<table align="center" border="1" cellpadding="3" cellspacing="1"
 width="95%">
  <tbody>
    <tr>
      <td style="background-color: rgb(255, 255, 255);"><b>CODE</b> </td>
    </tr>
    <tr>
      <td style="background-color: rgb(255, 255, 255);">#
perl -e "s/old_string/new_string/g;"
-pi.save $(find DirectoryName -type f)<!--c2--></td>
    </tr>
  </tbody>
</table>
<div class="postcolor"><br>
But
it leaves "traces", e.g it backs up the old file with a .save extension
. . . so is not really effective when Sue comes around ;-/<br>
<br>
<br>
<br>
<img src="../Images/cool.gif" alt=""> Bruno 
<br>
<br>
<br>
<small>-- Jan 4 2005 ( Revised Dec 10 2005 ) --</small>
<br>
<br>
<br>
</div>
</div>
<!-- 3-CUT HERE -->
<table style="text-align: center; margin-left: auto; margin-right: auto; width: 762px; height: 23px;" border="0" cellpadding="0" cellspacing="0" align="center">
  <tbody> 
  <tr align="center">
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><a href="http://www.brunolinux.com/" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">Tips
Linux Explorers</a><span style="font-size: 10px;">&nbsp;</span></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><img src="../Images/div/carree.png" alt="" border="0" height="10" width="7"></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><span style="font-size: 10px;">&nbsp;</span><a href="http://forums.scotsnewsletter.com/index.php?s=09fc4fb26291380b0bf08c35b5dbb390&amp;act=SF&amp;f=14" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">All
Things Linux Forum</a><span style="font-size: 10px;">&nbsp;</span></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><img src="../Images/div/carree.png" alt="" border="0" height="10" width="7"></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><span style="font-size: 10px;">&nbsp;</span><a href="http://www.brunolinux.com/10-General_Info/Great_Linux_Links.html" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">Great
Linux Links</a><span style="font-size: 10px;">&nbsp;</span></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><img src="../Images/div/carree.png" alt="" border="0" height="10" width="7"></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><span style="font-size: 10px;">&nbsp;</span><a href="http://www.linuxclues.com/" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">LinuxClues.com</a><span style="font-size: 10px;">&nbsp;</span></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><img src="../Images/div/carree.png" alt="" border="0" height="10" width="7"></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><span style="font-size: 10px;">&nbsp;</span><a href="http://www.panoramsterdam.nl" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">Hometown</a><span style="font-size: 10px;">&nbsp;</span></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><img src="../Images/div/carree.png" alt="" border="0" height="10" width="7"></td>
      <td style="background-color: rgb(221, 221, 221);" bgcolor="#eeeeee" valign="middle"><span style="font-size: 10px;">&nbsp;</span><a href="mailto:tips&#64;brun&#111;li&#110;ux.com" target="_top" style="font-family: Arial,sans-serif; text-decoration: none; color: rgb(0, 0, 0); font-size: 12px;">Email</a><span style="font-size: 10px;">&nbsp;</span></td>
    </tr>
  </tbody>
</table>
<br>
<!-- 3-CUT HERE-->
</body>
</html>
