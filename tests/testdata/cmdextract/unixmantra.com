<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html dir='ltr' xmlns='http://www.w3.org/1999/xhtml' xmlns:b='http://www.google.com/2005/gml/b' xmlns:data='http://www.google.com/2005/gml/data' xmlns:expr='http://www.google.com/2005/gml/expr'>
<head>
<meta content='width=device-width, initial-scale=1.0' name='viewport'/>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,700,300' rel='stylesheet' type='text/css'/>
<link href='http://fonts.googleapis.com/css?family=Bitter:400,700,400italic' rel='stylesheet' type='text/css'/>
<meta content='text/html; charset=UTF-8' http-equiv='Content-Type'/>
<script type="text/javascript">(function() { var b=window,f="chrome",g="tick",k="jstiming";(function(){function d(a){this.t={};this.tick=function(a,d,c){var e=void 0!=c?c:(new Date).getTime();this.t[a]=[e,d];if(void 0==c)try{b.console.timeStamp("CSI/"+a)}catch(h){}};this[g]("start",null,a)}var a;b.performance&&(a=b.performance.timing);var n=a?new d(a.responseStart):new d;b.jstiming={Timer:d,load:n};if(a){var c=a.navigationStart,h=a.responseStart;0<c&&h>=c&&(b[k].srt=h-c)}if(a){var e=b[k].load;0<c&&h>=c&&(e[g]("_wtsrt",void 0,c),e[g]("wtsrt_","_wtsrt",h),e[g]("tbsd_","wtsrt_"))}try{a=null,
b[f]&&b[f].csi&&(a=Math.floor(b[f].csi().pageT),e&&0<c&&(e[g]("_tbnd",void 0,b[f].csi().startE),e[g]("tbnd_","_tbnd",c))),null==a&&b.gtbExternal&&(a=b.gtbExternal.pageT()),null==a&&b.external&&(a=b.external.pageT,e&&0<c&&(e[g]("_tbnd",void 0,b.external.startE),e[g]("tbnd_","_tbnd",c))),a&&(b[k].pt=a)}catch(p){}})();b.tickAboveFold=function(d){var a=0;if(d.offsetParent){do a+=d.offsetTop;while(d=d.offsetParent)}d=a;750>=d&&b[k].load[g]("aft")};var l=!1;function m(){l||(l=!0,b[k].load[g]("firstScrollTime"))}b.addEventListener?b.addEventListener("scroll",m,!1):b.attachEvent("onscroll",m);
 })();</script>
<meta content='blogger' name='generator'/>
<link href='http://www.unixmantra.com/favicon.ico' rel='icon' type='image/x-icon'/>
<link href='http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html' rel='canonical'/>
<link rel="alternate" type="application/atom+xml" title="UnixMantra - Atom" href="http://www.unixmantra.com/feeds/posts/default" />
<link rel="alternate" type="application/rss+xml" title="UnixMantra - RSS" href="http://www.unixmantra.com/feeds/posts/default?alt=rss" />
<link rel="service.post" type="application/atom+xml" title="UnixMantra - Atom" href="http://www.blogger.com/feeds/8572598522221159569/posts/default" />

<link rel="alternate" type="application/atom+xml" title="UnixMantra - Atom" href="http://www.unixmantra.com/feeds/4168024984553371945/comments/default" />
<link href='http://4.bp.blogspot.com/-VrzkScmOMF0/Ur-chEQTmoI/AAAAAAAAAno/bTRNZSJvbSo/s400/xargs-all-in-one.png' rel='image_src'/>
<!--[if IE]> <script> (function() { var html5 = ("abbr,article,aside,audio,canvas,datalist,details," + "figure,footer,header,hgroup,mark,menu,meter,nav,output," + "progress,section,time,video").split(','); for (var i = 0; i < html5.length; i++) { document.createElement(html5[i]); } try { document.execCommand('BackgroundImageCache', false, true); } catch(e) {} })(); </script> <![endif]-->
<!-- Start www.unixmantra.com: Changing the Blogger Title Tag -->
<!-- Meta Title Halaman Error/404 -->
<!-- Meta Title Page Post -->
<title>"xargs" All-IN-One Tutorial Guide - UnixMantra</title>
<!-- Meta Description Page Post active -->
<!-- Show if the Meta Description Page post is not active-->
<meta content='"xargs" All-IN-One Tutorial GuidePlease read the article "xargs" All-IN-One Tutorial Guide More on UnixMantra' name='description'/>
<!-- Meta Keyword Halaman post-->
<meta content='"xargs" All-IN-One Tutorial GuideUnix, AIX, Linux, Howtos, Tutorials, Guides, Articles, News, Tips, Tricks' name='keywords'/>
<!-- End www.unixmantra.com: Changing the Blogger Title Tag -->
<link type='text/css' rel='stylesheet' href='https://www.blogger.com/static/v1/widgets/1278881358-widget_css_bundle.css' />
<link type='text/css' rel='stylesheet' href='//www.google.com/uds/css/gsearch.css' />
<link type='text/css' rel='stylesheet' href='https://www.blogger.com/dyn-css/authorization.css?targetBlogID=8572598522221159569&zx=38106b89-69b1-46ef-8fd9-570d158327f7' />
<style id='page-skin-1' type='text/css'><!--
/*
-----------------------------------------------
Blogger Details
Name:   UNIX Mantra
Author: Surya
URL :  http://www.unixmantra.com
Date:   December 18 2014
----------------------------------------------- */
body#layout ul{list-style-type:none;list-style:none}
body#layout ul li{list-style-type:none;list-style:none}
body#layout #myGallery{display:none}
body#layout .featuredposts{display:none}
body#layout .fp-slider{display:none}
body#layout #navcontainer{display:none}
body#layout .menu-secondary-wrap{display:none}
body#layout .menu-secondary-container{display:none}
body#layout #skiplinks{display:none}
body#layout .feedtwitter{display:none}
body#layout #header-wrapper {margin-bottom:10px;min-height:120px;}
body#layout .social-profiles-widget h3 {display:none;}
/* Variable definitions
====================
<Variable name="bgcolor" description="Page Background Color"
type="color" default="#fff">
<Variable name="textcolor" description="Text Color"
type="color" default="#333">
<Variable name="linkcolor" description="Link Color"
type="color" default="#58a">
<Variable name="pagetitlecolor" description="Blog Title Color"
type="color" default="#666">
<Variable name="descriptioncolor" description="Blog Description Color"
type="color" default="#999">
<Variable name="titlecolor" description="Post Title Color"
type="color" default="#c60">
<Variable name="bordercolor" description="Border Color"
type="color" default="#ccc">
<Variable name="sidebarcolor" description="Sidebar Title Color"
type="color" default="#999">
<Variable name="sidebartextcolor" description="Sidebar Text Color"
type="color" default="#666">
<Variable name="visitedlinkcolor" description="Visited Link Color"
type="color" default="#999">
<Variable name="bodyfont" description="Text Font"
type="font" default="normal normal 100% Georgia, Serif">
<Variable name="headerfont" description="Sidebar Title Font"
type="font"
default="normal normal 78% 'Trebuchet MS',Trebuchet,Arial,Verdana,Sans-serif">
<Variable name="pagetitlefont" description="Blog Title Font"
type="font"
default="normal normal 200% Georgia, Serif">
<Variable name="descriptionfont" description="Blog Description Font"
type="font"
default="normal normal 78% 'Trebuchet MS', Trebuchet, Arial, Verdana, Sans-serif">
<Variable name="postfooterfont" description="Post Footer Font"
type="font"
default="normal normal 78% 'Trebuchet MS', Trebuchet, Arial, Verdana, Sans-serif">
<Variable name="startSide" description="Side where text starts in blog language"
type="automatic" default="left">
<Variable name="endSide" description="Side where text ends in blog language"
type="automatic" default="right">
*/
/* Use this with templates/template-twocol.html */
body{background:url('http://2.bp.blogspot.com/-Yq6kaBDQA6A/VJBvmkcNEII/AAAAAAAAOFM/In-DIX90EWM/s1600/background.png') fixed;color:#555555;font-family: Arial, Helvetica, Sans-serif;font-size: 13px;line-height: 1.4;margin:0px;padding:0px;}
a:link,a:visited{color:#E50808;text-decoration:none;outline:none;}
a:hover{color:#FF6060;text-decoration:none;outline:none;}
a img{border-width:0}
#body-wrapper{margin:0px;padding:0px;}
.section, .widget {margin:0;padding:0;}
/* Header-----------------------------------------------*/
#header-wrapper{width:1050px;margin:0px auto 0px;height:60px;padding:20px 0px 20px 0px;overflow:hidden;background:#fff;}
#header-inner{background-position:center;margin-left:auto;margin-right:auto}
#header{margin:0;border:0 solid #cccccc;color:#424242;float:left;width:40%;overflow:hidden;}
#header h1{color:#424242;text-shadow:0px 1px 0px #fff;margin:0;padding:0px 0px 0px 15px;font-family:&#39;Oswald&#39;,Arial,Helvetica,Sans-serif;font-weight:bold;font-size:24px;line-height:24px;}
#header .description{padding-left:15px;color:#424242;text-shadow:0px 1px 0px #fff;line-height:13px;font-size:13px;padding-top:0px;margin-top:10px;font-family:'Bitter',Arial,Helvetica,Sans-serif;}
#header h1 a,#header h1 a:visited{color:#424242;text-decoration:none}
#header h2{padding-left:5px;color:#424242;font:14px Arial,Helvetica,Sans-serif}
#header2{float:right;width:58%;margin-right:0px;padding-right:0px;overflow:hidden;}
#header2 .widget{padding:0px 15px 0px 0px;float:right}
.social-profiles-widget img{margin:0 4px 0 0}
.social-profiles-widget img:hover{opacity:0.8}
#top-social-profiles{padding:8px 0px 0px 0px;height:32px;text-align:right;}
#top-social-profiles img{margin:0 0 0 6px !important}
#top-social-profiles img:hover{opacity:.8}
#top-social-profiles .widget-container{background:none;padding:0;border:0}
/* Outer-Wrapper----------------------------------------------- */
#outer-wrapper{width:1050px;margin:10px auto 0px;padding:0px;text-align:left;}
#content-wrapper{padding:15px;background:#fff;overflow:hidden;}
#main-wrapper{width:690px;float:left;margin:0px;padding:0px 0px 0px 0px;word-wrap:break-word;overflow:hidden;}
#rsidebar-wrapper{width:310px;float:right;margin:0px;padding:0px 0px 0px 0px;word-wrap:break-word;overflow:hidden;}
/* Headings----------------------------------------------- */
h2{}
/* Posts-----------------------------------------------*/
h2.date-header{margin:1.5em 0 .5em;display:none;}
.wrapfullpost{}
.post{margin-bottom:15px;border:2px solid #E1E1E1;background:#fff;padding:10px;}
.post-title{color:#333333;margin:0 0 10px 0;padding:0;font-family:Oswald,sans-serif;font-size:22px;line-height:26px;font-weight:normal;}
.post-title a,.post-title a:visited,.post-title strong{display:block;text-decoration:none;color:#333333;text-decoration:none;}
.post-title strong,.post-title a:hover{color:#E50808;text-decoration:none;}
.post-body{margin:0px;padding:0px 0px 0px 0px;font-family:Arial, Helvetica, Sans-serif;line-height: 22px;}
.post-footer{margin:5px 0;}
.comment-link{margin-left:.6em}
.post-body img{padding:3px;}
.pbtthumbimg {float:left;margin:0px 10px 5px 0px;padding:6px !important;border:1px solid #eeeeee !important;background:none !important;width:160px;height:auto;}
.postmeta-primary{color:#999999;font-size:13px;line-height:18px;padding:0 0 10px}
.postmeta-secondary{color:#999999;font-size:13px;line-height:18px;padding:0 0 10px}
.meta_author, .meta_date, .meta_categories, .meta_comments {background:url(http://1.bp.blogspot.com/-gp2_t1TIwok/U-Iyyeu03aI/AAAAAAAAMuw/MJtQbFTf-jo/s1600/meta-separator.png) no-repeat right center;padding-right:10px;margin-right:10px;}
.readmore{margin-bottom:5px;float:right}
.readmore a{color:#E50808;background:#EBEBEB;padding:8px 14px;font-size:12px;line-height:12px;display:inline-block;text-decoration:none;text-transform:none}
.readmore a:hover{color:#fff;background:#E50808;text-decoration:none}
/* Sidebar Content----------------------------------------------- */
.sidebar{margin:0 0 10px 0;font-size:13px;color:#212121;}
.sidebar a{text-decoration:none;color:#212121;}
.sidebar a:hover{text-decoration:none;color:#E50808;}
.sidebar h2, h3.widgettitle{border-bottom:3px solid #E50808;margin:0 0 10px;padding:10px 0 7px;color:#414445;font-size:16px;line-height:16px;font-family:'Oswald',sans-serif;font-weight:normal;text-decoration:none;text-transform:uppercase;}
.sidebar ul{list-style-type:none;list-style:none;margin:0px;padding:0px;}
.sidebar ul li{padding:0 0 6px 12px;margin:0 0 6px;background:url(http://4.bp.blogspot.com/-d6x_j8jtdhQ/VJBvsJDIPQI/AAAAAAAAOGE/BCcTjAUOhOo/s1600/widget-list.png) left 7px no-repeat;}
.sidebar .widget{margin:0 0 15px 0;padding:0;color:#212121;font-size:13px;}
.main .widget{margin:0 0 5px;padding:0 0 2px}
.main .Blog{border-bottom-width:0}
.widget-container{list-style-type:none;list-style:none;margin:0 0 15px 0;padding:0;color:#212121;font-size:13px}
/* FOOTER ----------------------------------------------- */
#footer-container{}
#footer{margin-bottom:15px;padding:10px 0;background:#F0EFEF;border-top:2px solid #E50808;height:30px;overflow:hidden}
#copyrights{color:#434141;background:#F0EFEF;float:left;padding-left:15px;width:440px;height:30px;overflow:hidden}
#copyrights a{color:#434141}
#copyrights a:hover{color:#434141;text-decoration:none}
#credits{color:#7D7D7D;font-size:11px;float:right;padding-right:15px;text-align:right;width:470px;height:30px;overflow:hidden}
#credits a{color:#7D7D7D;text-decoration:none}
#credits a:hover{text-decoration:none;color:#7D7D7D}
#footer-widgets-container{}
#footer-widgets{background:#FFF;padding:20px 0 0;border-top:2px solid #E71919}
.footer-widget-box{width:330px;float:left;margin-left:15px}
.footer-widget-box-last{}
#footer-widgets .widget-container{color:#212121;}
#footer-widgets .widget-container a{text-decoration:none;color:#212121;}
#footer-widgets .widget-container a:hover{text-decoration:none;color:#E50808;}
#footer-widgets h2{border-bottom:3px solid #E50808;margin:0 0 10px;padding:10px 0 7px;color:#414445;font-size:16px;line-height:16px;font-family:'Oswald',sans-serif;font-weight:normal;text-decoration:none;text-transform:uppercase;}
#footer-widgets .widget ul{list-style-type:none;list-style:none;margin:0px;padding:0px;}
#footer-widgets .widget ul li{padding:0 0 6px 12px;margin:0 0 6px;background:url(http://4.bp.blogspot.com/-d6x_j8jtdhQ/VJBvsJDIPQI/AAAAAAAAOGE/BCcTjAUOhOo/s1600/widget-list.png) left 7px no-repeat;}
.footersec {}
.footersec .widget{margin-bottom:20px;}
.footersec ul{}
.footersec ul li{}
/* Search ----------------------------------------------- */
#search{border:1px solid #D8D8D8;background:#fff url(http://3.bp.blogspot.com/-z6ctWXQQJ8Q/VJBvraG0-II/AAAAAAAAOF0/U5D63cAvn8I/s1600/search.png) 99% 50% no-repeat;text-align:left;padding:6px 24px 6px 6px}
#search #s{background:none;color:#B4B4B4;border:0;width:100%;padding:0;margin:0;outline:none}
#content-search{width:300px;padding:15px 0}
/* Comments----------------------------------------------- */
#comments{margin-bottom:15px;border:2px solid #E1E1E1;background:#F5F5F5;padding:10px;}
#comments h4{font-size:16px;font-weight:bold;margin:1em 0;}
.deleted-comment{font-style:italic;color:gray}
#blog-pager-newer-link{float:left}
#blog-pager-older-link{float:right}
#blog-pager{text-align:center}
.feed-links{clear:both;line-height:2.5em}
/* Profile ----------------------------------------------- */
.profile-img{float:left;margin-top:0;margin-right:5px;margin-bottom:5px;margin-left:0;padding:4px;border:1px solid #cccccc}
.profile-data{margin:0;text-transform:uppercase;letter-spacing:.1em;font:normal normal 78% 'Trebuchet MS', Trebuchet, Arial, Verdana, Sans-serif;color:#999999;font-weight:bold;line-height:1.6em}
.profile-datablock{margin:.5em 0 .5em}
.profile-textblock{margin:0.5em 0;line-height:1.6em}
.profile-link{font:normal normal 78% 'Trebuchet MS', Trebuchet, Arial, Verdana, Sans-serif;text-transform:uppercase;letter-spacing:.1em}
.author-profile {background:#f6f6f6;border:1px solid #eee;margin:5px 0 10px 0;padding:8px;overflow:hidden;}
.author-profile img {border:1px solid #ddd;float:left;margin-right:10px;}
.post-iconspbt {margin:5px 0 0 0;padding:0px;}
.post-locationpbt {margin:5px 0;padding:0px;}
#navbar-iframe{height:0;visibility:hidden;display:none;}
.separator a[style="margin-left: 1em; margin-right: 1em;"] {margin-left: auto!important;margin-right: auto!important;}
.separator a[style="clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"] {clear: none !important; float: none !important; margin-bottom: 0em !important; margin-right: 0em !important;}
.separator a[style="clear: left; float: left; margin-bottom: 1em; margin-right: 1em;"] img {float: left !important; margin: 0px 10px 10px 0px;}
.separator a[style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"] {clear: none !important; float: none !important; margin-bottom: 0em !important; margin-left: 0em !important;}
.separator a[style="clear: right; float: right; margin-bottom: 1em; margin-left: 1em;"] img {float: right !important; margin: 0px 0px 10px 10px;}
.PopularPosts .item-thumbnail {float: left;margin: 0 5px 5px 0;}
.PopularPosts img {border: 1px solid #eee;padding: 3px;}
/*Its box style------------------------------------------------------------*/
bix {
background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, from(rgb(240, 240, 240)), to(rgb(252, 252, 252)));
background-position: initial initial;
background-repeat: initial initial;
border-bottom-left-radius: 3px;
border-bottom-right-radius: 3px;
border-color: rgb(224, 224, 224);
border-style: solid;
border-top-left-radius: 3px;
border-top-right-radius: 3px;
border-width: 1px 1px 2px;
color: #303030;
padding: 1px 5px;
white-space: nowrap;
margin: 0px 4px 0px 4px;
font-style: italic;
}
#com_box{
background-color: #051e30;
font-size: 12px;
border-color: #289ff4;
border-radius: 6px;
border-style: solid;
border-width: 1px 1px 1px 4px;
color: #ffffff;
font-family: "Courier 10 Pitch",Courier,monospace;
line-height: 19px;
margin: 20px 0px;
overflow-x: auto;
overflow-y: hidden;
padding: 10px 10px 10px 18px;
word-wrap: break-word;
}
#com_box1,#com_box_w,#com_box_back,#com_nasa,#com_con,#com_con1,#com_nrx,#com_gony,#com_bix,pre{
background-attachment: scroll;
background-image: none;
border: 1px solid rgb(221, 221, 221);
display: block;
font-family: Consolas, 'Andale Mono', Monaco, Courier, 'Courier New', Verdana, sans-serif;
font-size: 0.95em;
line-height: 1.5em;
margin:12px 0px 10px 0px;
overflow: auto;
padding: 0.667em 0.917em;
background-position: 0px 0px;
background-repeat: repeat repeat;
}
#com_box1{background-color: #EEEEEE;}
#com_box_w{background-color: #fff;border: 1px solid #04B404}
#com_box_back{background-color: #EEEEEE;color: #4d4a4a;}
pre{background-color: #EEEEEE;color: #4d4a4a;}
#com_nasa{background-color: #1570a6; color: rgb(255, 255, 255);border-left: 5px solid #eee;border-right: 5px solid #eee;}
#com_con{background-color:  #424242; color: rgb(255, 255, 255);border-left: 4px solid #E5E5E5;}
#com_con1{background-color: rgb(66, 66, 66);color: #fff;}
#com_nrx{background-color: #FFFFFF;}
#com_gony{background-color:  #424242;border-left: 3px solid rgb(230, 113, 1);}
#com_bix {background-color: #C0CACF; }
}
blacky{
color: #FFF;
background: #7d7e7d;
background: -moz-linear-gradient(top,#7d7e7d 0%,#0e0e0e 100%);
background: -webkit-gradient(linear,left top,left bottom,color-stop(0%,#7d7e7d),color-stop(100%,#0e0e0e));
background: -webkit-linear-gradient(top,#7d7e7d 0%,#0e0e0e 100%);
background: -o-linear-gradient(top,#7d7e7d 0%,#0e0e0e 100%);
background: -ms-linear-gradient(top,#7d7e7d 0%,#0e0e0e 100%);
background: linear-gradient(to bottom,#7d7e7d 0%,#0e0e0e 100%);
filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#7d7e7d',endColorstr='#0e0e0e',GradientType=0);
border: 1px solid #ccc;
border-radius: 6px;
box-shadow: 1px 1px 1px #ccc;
font-style: bold;
padding: 10px;
}
.info {
background:#e0e5eburl no-repeat 12px 8px;
color:#222
}
.tips {
background:#7CADDE no-repeat 12px 8px;
color:#fff;
}
.warning {
background:#db6161 no-repeat 12px 8px;
color:#fff;
}
.info,.tips,.warning {
line-height:22px;
min-height:38px;
padding:10px 10px;
margin:5px 0;
}
div.surya-title {
font-family: Georgia,Times,"Times New Roman",serif;
padding: 0.5ex 0.5em;
margin: 0.5em 0.4em -0.6em;
background-color: #ccc;
font-size: 95.5%;
}
div.surya {
display: block;
padding: 0.5em;
margin: 0.5em;
font-size: 12px;
border: 1px solid #ccc;
background-color: #f8f8f8;
color: #222;
font-family:monospace;
line-height: 1.3;
overflow: auto;
}
#ind_box {
padding:10px;
background: url(http://4.bp.blogspot.com/-INVXOP88_kA/Umo5ciIxxZI/AAAAAAAAAgc/lKV8abOknoE/s1600/big.gif) rgba(255, 215, 0, 0.6);
border: 2px solid #E9DCD0;
font-size: 15px;
font-weight: 700;
-webkit-box-shadow: -1px 1px 3px 3px rgba(237,242,242,1);
-moz-box-shadow: -1px 1px 3px 3px rgba(237,242,242,1);
box-shadow: -1px 1px 3px 3px rgba(237,242,242,1);
}
#ind_box a{
color: #070F0E;
text-decoration: none;
outline: none;
}
#ind_box a:hover{
color:rgba(65, 7, 167, 0.6);
text-decoration: underline;
outline: none;
#ind_box ol { margin-bottom:-5px;}
}
/*Its box style------------------------------------------------------------*/

--></style>
<script src='http://code.jquery.com/jquery-latest.min.js' type='text/javascript'></script>
<script> 
$('.comment-content a[rel$=nofollow]').replaceWith(function(){return ($(this).text());}); 
</script>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js' type='text/javascript'></script>
<script type='text/javascript'>
//<![CDATA[

/*! jQuery Migrate v1.2.1 | (c) 2005, 2013 jQuery Foundation, Inc. and other contributors | jquery.org/license */
jQuery.migrateMute===void 0&&(jQuery.migrateMute=!0),function(e,t,n){function r(n){var r=t.console;i[n]||(i[n]=!0,e.migrateWarnings.push(n),r&&r.warn&&!e.migrateMute&&(r.warn("JQMIGRATE: "+n),e.migrateTrace&&r.trace&&r.trace()))}function a(t,a,i,o){if(Object.defineProperty)try{return Object.defineProperty(t,a,{configurable:!0,enumerable:!0,get:function(){return r(o),i},set:function(e){r(o),i=e}}),n}catch(s){}e._definePropertyBroken=!0,t[a]=i}var i={};e.migrateWarnings=[],!e.migrateMute&&t.console&&t.console.log&&t.console.log("JQMIGRATE: Logging is active"),e.migrateTrace===n&&(e.migrateTrace=!0),e.migrateReset=function(){i={},e.migrateWarnings.length=0},"BackCompat"===document.compatMode&&r("jQuery is not compatible with Quirks Mode");var o=e("<input/>",{size:1}).attr("size")&&e.attrFn,s=e.attr,u=e.attrHooks.value&&e.attrHooks.value.get||function(){return null},c=e.attrHooks.value&&e.attrHooks.value.set||function(){return n},l=/^(?:input|button)$/i,d=/^[238]$/,p=/^(?:autofocus|autoplay|async|checked|controls|defer|disabled|hidden|loop|multiple|open|readonly|required|scoped|selected)$/i,f=/^(?:checked|selected)$/i;a(e,"attrFn",o||{},"jQuery.attrFn is deprecated"),e.attr=function(t,a,i,u){var c=a.toLowerCase(),g=t&&t.nodeType;return u&&(4>s.length&&r("jQuery.fn.attr( props, pass ) is deprecated"),t&&!d.test(g)&&(o?a in o:e.isFunction(e.fn[a])))?e(t)[a](i):("type"===a&&i!==n&&l.test(t.nodeName)&&t.parentNode&&r("Can't change the 'type' of an input or button in IE 6/7/8"),!e.attrHooks[c]&&p.test(c)&&(e.attrHooks[c]={get:function(t,r){var a,i=e.prop(t,r);return i===!0||"boolean"!=typeof i&&(a=t.getAttributeNode(r))&&a.nodeValue!==!1?r.toLowerCase():n},set:function(t,n,r){var a;return n===!1?e.removeAttr(t,r):(a=e.propFix[r]||r,a in t&&(t[a]=!0),t.setAttribute(r,r.toLowerCase())),r}},f.test(c)&&r("jQuery.fn.attr('"+c+"') may use property instead of attribute")),s.call(e,t,a,i))},e.attrHooks.value={get:function(e,t){var n=(e.nodeName||"").toLowerCase();return"button"===n?u.apply(this,arguments):("input"!==n&&"option"!==n&&r("jQuery.fn.attr('value') no longer gets properties"),t in e?e.value:null)},set:function(e,t){var a=(e.nodeName||"").toLowerCase();return"button"===a?c.apply(this,arguments):("input"!==a&&"option"!==a&&r("jQuery.fn.attr('value', val) no longer sets properties"),e.value=t,n)}};var g,h,v=e.fn.init,m=e.parseJSON,y=/^([^<]*)(<[\w\W]+>)([^>]*)$/;e.fn.init=function(t,n,a){var i;return t&&"string"==typeof t&&!e.isPlainObject(n)&&(i=y.exec(e.trim(t)))&&i[0]&&("<"!==t.charAt(0)&&r("$(html) HTML strings must start with '<' character"),i[3]&&r("$(html) HTML text after last tag is ignored"),"#"===i[0].charAt(0)&&(r("HTML string cannot start with a '#' character"),e.error("JQMIGRATE: Invalid selector string (XSS)")),n&&n.context&&(n=n.context),e.parseHTML)?v.call(this,e.parseHTML(i[2],n,!0),n,a):v.apply(this,arguments)},e.fn.init.prototype=e.fn,e.parseJSON=function(e){return e||null===e?m.apply(this,arguments):(r("jQuery.parseJSON requires a valid JSON string"),null)},e.uaMatch=function(e){e=e.toLowerCase();var t=/(chrome)[ \/]([\w.]+)/.exec(e)||/(webkit)[ \/]([\w.]+)/.exec(e)||/(opera)(?:.*version|)[ \/]([\w.]+)/.exec(e)||/(msie) ([\w.]+)/.exec(e)||0>e.indexOf("compatible")&&/(mozilla)(?:.*? rv:([\w.]+)|)/.exec(e)||[];return{browser:t[1]||"",version:t[2]||"0"}},e.browser||(g=e.uaMatch(navigator.userAgent),h={},g.browser&&(h[g.browser]=!0,h.version=g.version),h.chrome?h.webkit=!0:h.webkit&&(h.safari=!0),e.browser=h),a(e,"browser",e.browser,"jQuery.browser is deprecated"),e.sub=function(){function t(e,n){return new t.fn.init(e,n)}e.extend(!0,t,this),t.superclass=this,t.fn=t.prototype=this(),t.fn.constructor=t,t.sub=this.sub,t.fn.init=function(r,a){return a&&a instanceof e&&!(a instanceof t)&&(a=t(a)),e.fn.init.call(this,r,a,n)},t.fn.init.prototype=t.fn;var n=t(document);return r("jQuery.sub() is deprecated"),t},e.ajaxSetup({converters:{"text json":e.parseJSON}});var b=e.fn.data;e.fn.data=function(t){var a,i,o=this[0];return!o||"events"!==t||1!==arguments.length||(a=e.data(o,t),i=e._data(o,t),a!==n&&a!==i||i===n)?b.apply(this,arguments):(r("Use of jQuery.fn.data('events') is deprecated"),i)};var j=/\/(java|ecma)script/i,w=e.fn.andSelf||e.fn.addBack;e.fn.andSelf=function(){return r("jQuery.fn.andSelf() replaced by jQuery.fn.addBack()"),w.apply(this,arguments)},e.clean||(e.clean=function(t,a,i,o){a=a||document,a=!a.nodeType&&a[0]||a,a=a.ownerDocument||a,r("jQuery.clean() is deprecated");var s,u,c,l,d=[];if(e.merge(d,e.buildFragment(t,a).childNodes),i)for(c=function(e){return!e.type||j.test(e.type)?o?o.push(e.parentNode?e.parentNode.removeChild(e):e):i.appendChild(e):n},s=0;null!=(u=d[s]);s++)e.nodeName(u,"script")&&c(u)||(i.appendChild(u),u.getElementsByTagName!==n&&(l=e.grep(e.merge([],u.getElementsByTagName("script")),c),d.splice.apply(d,[s+1,0].concat(l)),s+=l.length));return d});var Q=e.event.add,x=e.event.remove,k=e.event.trigger,N=e.fn.toggle,T=e.fn.live,M=e.fn.die,S="ajaxStart|ajaxStop|ajaxSend|ajaxComplete|ajaxError|ajaxSuccess",C=RegExp("\\b(?:"+S+")\\b"),H=/(?:^|\s)hover(\.\S+|)\b/,A=function(t){return"string"!=typeof t||e.event.special.hover?t:(H.test(t)&&r("'hover' pseudo-event is deprecated, use 'mouseenter mouseleave'"),t&&t.replace(H,"mouseenter$1 mouseleave$1"))};e.event.props&&"attrChange"!==e.event.props[0]&&e.event.props.unshift("attrChange","attrName","relatedNode","srcElement"),e.event.dispatch&&a(e.event,"handle",e.event.dispatch,"jQuery.event.handle is undocumented and deprecated"),e.event.add=function(e,t,n,a,i){e!==document&&C.test(t)&&r("AJAX events should be attached to document: "+t),Q.call(this,e,A(t||""),n,a,i)},e.event.remove=function(e,t,n,r,a){x.call(this,e,A(t)||"",n,r,a)},e.fn.error=function(){var e=Array.prototype.slice.call(arguments,0);return r("jQuery.fn.error() is deprecated"),e.splice(0,0,"error"),arguments.length?this.bind.apply(this,e):(this.triggerHandler.apply(this,e),this)},e.fn.toggle=function(t,n){if(!e.isFunction(t)||!e.isFunction(n))return N.apply(this,arguments);r("jQuery.fn.toggle(handler, handler...) is deprecated");var a=arguments,i=t.guid||e.guid++,o=0,s=function(n){var r=(e._data(this,"lastToggle"+t.guid)||0)%o;return e._data(this,"lastToggle"+t.guid,r+1),n.preventDefault(),a[r].apply(this,arguments)||!1};for(s.guid=i;a.length>o;)a[o++].guid=i;return this.click(s)},e.fn.live=function(t,n,a){return r("jQuery.fn.live() is deprecated"),T?T.apply(this,arguments):(e(this.context).on(t,this.selector,n,a),this)},e.fn.die=function(t,n){return r("jQuery.fn.die() is deprecated"),M?M.apply(this,arguments):(e(this.context).off(t,this.selector||"**",n),this)},e.event.trigger=function(e,t,n,a){return n||C.test(e)||r("Global events are undocumented and deprecated"),k.call(this,e,t,n||document,a)},e.each(S.split("|"),function(t,n){e.event.special[n]={setup:function(){var t=this;return t!==document&&(e.event.add(document,n+"."+e.guid,function(){e.event.trigger(n,null,t,!0)}),e._data(this,n,e.guid++)),!1},teardown:function(){return this!==document&&e.event.remove(document,n+"."+e._data(this,n)),!1}}})}(jQuery,window);

//]]>
</script>
<script type='text/javascript'>
//<![CDATA[

/**
 * jQuery Mobile Menu 
 * Turn unordered list menu into dropdown select menu
 * version 1.0(31-OCT-2011)
 * 
 * Built on top of the jQuery library
 *   http://jquery.com
 * 
 * Documentation
 * 	 http://github.com/mambows/mobilemenu
 */
(function($){
$.fn.mobileMenu = function(options) {
	
	var defaults = {
			defaultText: 'Navigate to...',
			className: 'select-menu',
			containerClass: 'select-menu-container',
			subMenuClass: 'sub-menu',
			subMenuDash: '&ndash;'
		},
		settings = $.extend( defaults, options ),
		el = $(this);
	
	this.each(function(){
		// ad class to submenu list
		el.find('ul').addClass(settings.subMenuClass);

        // Create base menu
		$('<div />',{
			'class' : settings.containerClass
		}).insertAfter( el );
        
		// Create base menu
		$('<select />',{
			'class' : settings.className
		}).appendTo( '.' + settings.containerClass );

		// Create default option
		$('<option />', {
			"value"		: '#',
			"text"		: settings.defaultText
		}).appendTo( '.' + settings.className );

		// Create select option from menu
		el.find('a').each(function(){
			var $this 	= $(this),
					optText	= '&nbsp;' + $this.text(),
					optSub	= $this.parents( '.' + settings.subMenuClass ),
					len			= optSub.length,
					dash;
			
			// if menu has sub menu
			if( $this.parents('ul').hasClass( settings.subMenuClass ) ) {
				dash = Array( len+1 ).join( settings.subMenuDash );
				optText = dash + optText;
			}

			// Now build menu and append it
			$('<option />', {
				"value"	: this.href,
				"html"	: optText,
				"selected" : (this.href == window.location.href)
			}).appendTo( '.' + settings.className );

		}); // End el.find('a').each

		// Change event on select element
		$('.' + settings.className).change(function(){
			var locations = $(this).val();
			if( locations !== '#' ) {
				window.location.href = $(this).val();
			};
		});

	}); // End this.each

	return this;

};
})(jQuery);

//]]>
</script>
<script type='text/javascript'>
//<![CDATA[

(function($){
	/* hoverIntent by Brian Cherne */
	$.fn.hoverIntent = function(f,g) {
		// default configuration options
		var cfg = {
			sensitivity: 7,
			interval: 100,
			timeout: 0
		};
		// override configuration options with user supplied object
		cfg = $.extend(cfg, g ? { over: f, out: g } : f );

		// instantiate variables
		// cX, cY = current X and Y position of mouse, updated by mousemove event
		// pX, pY = previous X and Y position of mouse, set by mouseover and polling interval
		var cX, cY, pX, pY;

		// A private function for getting mouse position
		var track = function(ev) {
			cX = ev.pageX;
			cY = ev.pageY;
		};

		// A private function for comparing current and previous mouse position
		var compare = function(ev,ob) {
			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
			// compare mouse positions to see if they've crossed the threshold
			if ( ( Math.abs(pX-cX) + Math.abs(pY-cY) ) < cfg.sensitivity ) {
				$(ob).unbind("mousemove",track);
				// set hoverIntent state to true (so mouseOut can be called)
				ob.hoverIntent_s = 1;
				return cfg.over.apply(ob,[ev]);
			} else {
				// set previous coordinates for next time
				pX = cX; pY = cY;
				// use self-calling timeout, guarantees intervals are spaced out properly (avoids JavaScript timer bugs)
				ob.hoverIntent_t = setTimeout( function(){compare(ev, ob);} , cfg.interval );
			}
		};

		// A private function for delaying the mouseOut function
		var delay = function(ev,ob) {
			ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t);
			ob.hoverIntent_s = 0;
			return cfg.out.apply(ob,[ev]);
		};

		// A private function for handling mouse 'hovering'
		var handleHover = function(e) {
			// next three lines copied from jQuery.hover, ignore children onMouseOver/onMouseOut
			var p = (e.type == "mouseover" ? e.fromElement : e.toElement) || e.relatedTarget;
			while ( p && p != this ) { try { p = p.parentNode; } catch(e) { p = this; } }
			if ( p == this ) { return false; }

			// copy objects to be passed into t (required for event object to be passed in IE)
			var ev = jQuery.extend({},e);
			var ob = this;

			// cancel hoverIntent timer if it exists
			if (ob.hoverIntent_t) { ob.hoverIntent_t = clearTimeout(ob.hoverIntent_t); }

			// else e.type == "onmouseover"
			if (e.type == "mouseover") {
				// set "previous" X and Y position based on initial entry point
				pX = ev.pageX; pY = ev.pageY;
				// update "current" X and Y position based on mousemove
				$(ob).bind("mousemove",track);
				// start polling interval (self-calling timeout) to compare mouse coordinates over time
				if (ob.hoverIntent_s != 1) { ob.hoverIntent_t = setTimeout( function(){compare(ev,ob);} , cfg.interval );}

			// else e.type == "onmouseout"
			} else {
				// unbind expensive mousemove event
				$(ob).unbind("mousemove",track);
				// if hoverIntent state is true, then call the mouseOut function after the specified delay
				if (ob.hoverIntent_s == 1) { ob.hoverIntent_t = setTimeout( function(){delay(ev,ob);} , cfg.timeout );}
			}
		};

		// bind the function to the two event listeners
		return this.mouseover(handleHover).mouseout(handleHover);
	};
	
})(jQuery);

//]]>
</script>
<script type='text/javascript'>
//<![CDATA[

/*
 * Superfish v1.4.8 - jQuery menu widget
 * Copyright (c) 2008 Joel Birch
 *
 * Dual licensed under the MIT and GPL licenses:
 * 	http://www.opensource.org/licenses/mit-license.php
 * 	http://www.gnu.org/licenses/gpl.html
 *
 * CHANGELOG: http://users.tpg.com.au/j_birch/plugins/superfish/changelog.txt
 */

;(function($){
	$.fn.superfish = function(op){

		var sf = $.fn.superfish,
			c = sf.c,
			$arrow = $(['<span class="',c.arrowClass,'"> &#187;</span>'].join('')),
			over = function(){
				var $$ = $(this), menu = getMenu($$);
				clearTimeout(menu.sfTimer);
				$$.showSuperfishUl().siblings().hideSuperfishUl();
			},
			out = function(){
				var $$ = $(this), menu = getMenu($$), o = sf.op;
				clearTimeout(menu.sfTimer);
				menu.sfTimer=setTimeout(function(){
					o.retainPath=($.inArray($$[0],o.$path)>-1);
					$$.hideSuperfishUl();
					if (o.$path.length && $$.parents(['li.',o.hoverClass].join('')).length<1){over.call(o.$path);}
				},o.delay);	
			},
			getMenu = function($menu){
				var menu = $menu.parents(['ul.',c.menuClass,':first'].join(''))[0];
				sf.op = sf.o[menu.serial];
				return menu;
			},
			addArrow = function($a){ $a.addClass(c.anchorClass).append($arrow.clone()); };
			
		return this.each(function() {
			var s = this.serial = sf.o.length;
			var o = $.extend({},sf.defaults,op);
			o.$path = $('li.'+o.pathClass,this).slice(0,o.pathLevels).each(function(){
				$(this).addClass([o.hoverClass,c.bcClass].join(' '))
					.filter('li:has(ul)').removeClass(o.pathClass);
			});
			sf.o[s] = sf.op = o;
			
			$('li:has(ul)',this)[($.fn.hoverIntent && !o.disableHI) ? 'hoverIntent' : 'hover'](over,out).each(function() {
				if (o.autoArrows) addArrow( $('>a:first-child',this) );
			})
			.not('.'+c.bcClass)
				.hideSuperfishUl();
			
			var $a = $('a',this);
			$a.each(function(i){
				var $li = $a.eq(i).parents('li');
				$a.eq(i).focus(function(){over.call($li);}).blur(function(){out.call($li);});
			});
			o.onInit.call(this);
			
		}).each(function() {
			var menuClasses = [c.menuClass];
			if (sf.op.dropShadows  && !($.browser.msie && $.browser.version < 7)) menuClasses.push(c.shadowClass);
			$(this).addClass(menuClasses.join(' '));
		});
	};

	var sf = $.fn.superfish;
	sf.o = [];
	sf.op = {};
	sf.IE7fix = function(){
		var o = sf.op;
		if ($.browser.msie && $.browser.version > 6 && o.dropShadows && o.animation.opacity!=undefined)
			this.toggleClass(sf.c.shadowClass+'-off');
		};
	sf.c = {
		bcClass     : 'sf-breadcrumb',
		menuClass   : 'sf-js-enabled',
		anchorClass : 'sf-with-ul',
		arrowClass  : 'sf-sub-indicator',
		shadowClass : 'sf-shadow'
	};
	sf.defaults = {
		hoverClass	: 'sfHover',
		pathClass	: 'overideThisToUse',
		pathLevels	: 1,
		delay		: 800,
		animation	: {opacity:'show'},
		speed		: 'normal',
		autoArrows	: true,
		dropShadows : true,
		disableHI	: false,		// true disables hoverIntent detection
		onInit		: function(){}, // callback functions
		onBeforeShow: function(){},
		onShow		: function(){},
		onHide		: function(){}
	};
	$.fn.extend({
		hideSuperfishUl : function(){
			var o = sf.op,
				not = (o.retainPath===true) ? o.$path : '';
			o.retainPath = false;
			var $ul = $(['li.',o.hoverClass].join(''),this).add(this).not(not).removeClass(o.hoverClass)
					.find('>ul').hide().css('visibility','hidden');
			o.onHide.call($ul);
			return this;
		},
		showSuperfishUl : function(){
			var o = sf.op,
				sh = sf.c.shadowClass+'-off',
				$ul = this.addClass(o.hoverClass)
					.find('>ul:hidden').css('visibility','visible');
			sf.IE7fix.call($ul);
			o.onBeforeShow.call($ul);
			$ul.animate(o.animation,o.speed,function(){ sf.IE7fix.call($ul); o.onShow.call($ul); });
			return this;
		}
	});

})(jQuery);



//]]>
</script>
<script type='text/javascript'>
//<![CDATA[

/*
 * jQuery Cycle Plugin (with Transition Definitions)
 * Examples and documentation at: http://jquery.malsup.com/cycle/
 * Copyright (c) 2007-2010 M. Alsup
 * Version: 2.88 (08-JUN-2010)
 * Dual licensed under the MIT and GPL licenses.
 * http://jquery.malsup.com/license.html
 * Requires: jQuery v1.2.6 or later
 */
(function($){var ver="2.88";if($.support==undefined){$.support={opacity:!($.browser.msie)};}function debug(s){if($.fn.cycle.debug){log(s);}}function log(){if(window.console&&window.console.log){window.console.log("[cycle] "+Array.prototype.join.call(arguments," "));}}$.fn.cycle=function(options,arg2){var o={s:this.selector,c:this.context};if(this.length===0&&options!="stop"){if(!$.isReady&&o.s){log("DOM not ready, queuing slideshow");$(function(){$(o.s,o.c).cycle(options,arg2);});return this;}log("terminating; zero elements found by selector"+($.isReady?"":" (DOM not ready)"));return this;}return this.each(function(){var opts=handleArguments(this,options,arg2);if(opts===false){return;}opts.updateActivePagerLink=opts.updateActivePagerLink||$.fn.cycle.updateActivePagerLink;if(this.cycleTimeout){clearTimeout(this.cycleTimeout);}this.cycleTimeout=this.cyclePause=0;var $cont=$(this);var $slides=opts.slideExpr?$(opts.slideExpr,this):$cont.children();var els=$slides.get();if(els.length<2){log("terminating; too few slides: "+els.length);return;}var opts2=buildOptions($cont,$slides,els,opts,o);if(opts2===false){return;}var startTime=opts2.continuous?10:getTimeout(els[opts2.currSlide],els[opts2.nextSlide],opts2,!opts2.rev);if(startTime){startTime+=(opts2.delay||0);if(startTime<10){startTime=10;}debug("first timeout: "+startTime);this.cycleTimeout=setTimeout(function(){go(els,opts2,0,(!opts2.rev&&!opts.backwards));},startTime);}});};function handleArguments(cont,options,arg2){if(cont.cycleStop==undefined){cont.cycleStop=0;}if(options===undefined||options===null){options={};}if(options.constructor==String){switch(options){case"destroy":case"stop":var opts=$(cont).data("cycle.opts");if(!opts){return false;}cont.cycleStop++;if(cont.cycleTimeout){clearTimeout(cont.cycleTimeout);}cont.cycleTimeout=0;$(cont).removeData("cycle.opts");if(options=="destroy"){destroy(opts);}return false;case"toggle":cont.cyclePause=(cont.cyclePause===1)?0:1;checkInstantResume(cont.cyclePause,arg2,cont);return false;case"pause":cont.cyclePause=1;return false;case"resume":cont.cyclePause=0;checkInstantResume(false,arg2,cont);return false;case"prev":case"next":var opts=$(cont).data("cycle.opts");if(!opts){log('options not found, "prev/next" ignored');return false;}$.fn.cycle[options](opts);return false;default:options={fx:options};}return options;}else{if(options.constructor==Number){var num=options;options=$(cont).data("cycle.opts");if(!options){log("options not found, can not advance slide");return false;}if(num<0||num>=options.elements.length){log("invalid slide index: "+num);return false;}options.nextSlide=num;if(cont.cycleTimeout){clearTimeout(cont.cycleTimeout);cont.cycleTimeout=0;}if(typeof arg2=="string"){options.oneTimeFx=arg2;}go(options.elements,options,1,num>=options.currSlide);return false;}}return options;function checkInstantResume(isPaused,arg2,cont){if(!isPaused&&arg2===true){var options=$(cont).data("cycle.opts");if(!options){log("options not found, can not resume");return false;}if(cont.cycleTimeout){clearTimeout(cont.cycleTimeout);cont.cycleTimeout=0;}go(options.elements,options,1,(!opts.rev&&!opts.backwards));}}}function removeFilter(el,opts){if(!$.support.opacity&&opts.cleartype&&el.style.filter){try{el.style.removeAttribute("filter");}catch(smother){}}}function destroy(opts){if(opts.next){$(opts.next).unbind(opts.prevNextEvent);}if(opts.prev){$(opts.prev).unbind(opts.prevNextEvent);}if(opts.pager||opts.pagerAnchorBuilder){$.each(opts.pagerAnchors||[],function(){this.unbind().remove();});}opts.pagerAnchors=null;if(opts.destroy){opts.destroy(opts);}}function buildOptions($cont,$slides,els,options,o){var opts=$.extend({},$.fn.cycle.defaults,options||{},$.metadata?$cont.metadata():$.meta?$cont.data():{});if(opts.autostop){opts.countdown=opts.autostopCount||els.length;}var cont=$cont[0];$cont.data("cycle.opts",opts);opts.$cont=$cont;opts.stopCount=cont.cycleStop;opts.elements=els;opts.before=opts.before?[opts.before]:[];opts.after=opts.after?[opts.after]:[];opts.after.unshift(function(){opts.busy=0;});if(!$.support.opacity&&opts.cleartype){opts.after.push(function(){removeFilter(this,opts);});}if(opts.continuous){opts.after.push(function(){go(els,opts,0,(!opts.rev&&!opts.backwards));});}saveOriginalOpts(opts);if(!$.support.opacity&&opts.cleartype&&!opts.cleartypeNoBg){clearTypeFix($slides);}if($cont.css("position")=="static"){$cont.css("position","relative");}if(opts.width){$cont.width(opts.width);}if(opts.height&&opts.height!="auto"){$cont.height(opts.height);}if(opts.startingSlide){opts.startingSlide=parseInt(opts.startingSlide);}else{if(opts.backwards){opts.startingSlide=els.length-1;}}if(opts.random){opts.randomMap=[];for(var i=0;i<els.length;i++){opts.randomMap.push(i);}opts.randomMap.sort(function(a,b){return Math.random()-0.5;});opts.randomIndex=1;opts.startingSlide=opts.randomMap[1];}else{if(opts.startingSlide>=els.length){opts.startingSlide=0;}}opts.currSlide=opts.startingSlide||0;var first=opts.startingSlide;$slides.css({position:"absolute",top:0,left:0}).hide().each(function(i){var z;if(opts.backwards){z=first?i<=first?els.length+(i-first):first-i:els.length-i;}else{z=first?i>=first?els.length-(i-first):first-i:els.length-i;}$(this).css("z-index",z);});$(els[first]).css("opacity",1).show();removeFilter(els[first],opts);if(opts.fit&&opts.width){$slides.width(opts.width);}if(opts.fit&&opts.height&&opts.height!="auto"){$slides.height(opts.height);}var reshape=opts.containerResize&&!$cont.innerHeight();if(reshape){var maxw=0,maxh=0;for(var j=0;j<els.length;j++){var $e=$(els[j]),e=$e[0],w=$e.outerWidth(),h=$e.outerHeight();if(!w){w=e.offsetWidth||e.width||$e.attr("width");}if(!h){h=e.offsetHeight||e.height||$e.attr("height");}maxw=w>maxw?w:maxw;maxh=h>maxh?h:maxh;}if(maxw>0&&maxh>0){$cont.css({width:maxw+"px",height:maxh+"px"});}}if(opts.pause){$cont.hover(function(){this.cyclePause++;},function(){this.cyclePause--;});}if(supportMultiTransitions(opts)===false){return false;}var requeue=false;options.requeueAttempts=options.requeueAttempts||0;$slides.each(function(){var $el=$(this);this.cycleH=(opts.fit&&opts.height)?opts.height:($el.height()||this.offsetHeight||this.height||$el.attr("height")||0);this.cycleW=(opts.fit&&opts.width)?opts.width:($el.width()||this.offsetWidth||this.width||$el.attr("width")||0);if($el.is("img")){var loadingIE=($.browser.msie&&this.cycleW==28&&this.cycleH==30&&!this.complete);var loadingFF=($.browser.mozilla&&this.cycleW==34&&this.cycleH==19&&!this.complete);var loadingOp=($.browser.opera&&((this.cycleW==42&&this.cycleH==19)||(this.cycleW==37&&this.cycleH==17))&&!this.complete);var loadingOther=(this.cycleH==0&&this.cycleW==0&&!this.complete);if(loadingIE||loadingFF||loadingOp||loadingOther){if(o.s&&opts.requeueOnImageNotLoaded&&++options.requeueAttempts<100){log(options.requeueAttempts," - img slide not loaded, requeuing slideshow: ",this.src,this.cycleW,this.cycleH);setTimeout(function(){$(o.s,o.c).cycle(options);},opts.requeueTimeout);requeue=true;return false;}else{log("could not determine size of image: "+this.src,this.cycleW,this.cycleH);}}}return true;});if(requeue){return false;}opts.cssBefore=opts.cssBefore||{};opts.animIn=opts.animIn||{};opts.animOut=opts.animOut||{};$slides.not(":eq("+first+")").css(opts.cssBefore);if(opts.cssFirst){$($slides[first]).css(opts.cssFirst);}if(opts.timeout){opts.timeout=parseInt(opts.timeout);if(opts.speed.constructor==String){opts.speed=$.fx.speeds[opts.speed]||parseInt(opts.speed);}if(!opts.sync){opts.speed=opts.speed/2;}var buffer=opts.fx=="shuffle"?500:250;while((opts.timeout-opts.speed)<buffer){opts.timeout+=opts.speed;}}if(opts.easing){opts.easeIn=opts.easeOut=opts.easing;}if(!opts.speedIn){opts.speedIn=opts.speed;}if(!opts.speedOut){opts.speedOut=opts.speed;}opts.slideCount=els.length;opts.currSlide=opts.lastSlide=first;if(opts.random){if(++opts.randomIndex==els.length){opts.randomIndex=0;}opts.nextSlide=opts.randomMap[opts.randomIndex];}else{if(opts.backwards){opts.nextSlide=opts.startingSlide==0?(els.length-1):opts.startingSlide-1;}else{opts.nextSlide=opts.startingSlide>=(els.length-1)?0:opts.startingSlide+1;}}if(!opts.multiFx){var init=$.fn.cycle.transitions[opts.fx];if($.isFunction(init)){init($cont,$slides,opts);}else{if(opts.fx!="custom"&&!opts.multiFx){log("unknown transition: "+opts.fx,"; slideshow terminating");return false;}}}var e0=$slides[first];if(opts.before.length){opts.before[0].apply(e0,[e0,e0,opts,true]);}if(opts.after.length>1){opts.after[1].apply(e0,[e0,e0,opts,true]);}if(opts.next){$(opts.next).bind(opts.prevNextEvent,function(){return advance(opts,opts.rev?-1:1);});}if(opts.prev){$(opts.prev).bind(opts.prevNextEvent,function(){return advance(opts,opts.rev?1:-1);});}if(opts.pager||opts.pagerAnchorBuilder){buildPager(els,opts);}exposeAddSlide(opts,els);return opts;}function saveOriginalOpts(opts){opts.original={before:[],after:[]};opts.original.cssBefore=$.extend({},opts.cssBefore);opts.original.cssAfter=$.extend({},opts.cssAfter);opts.original.animIn=$.extend({},opts.animIn);opts.original.animOut=$.extend({},opts.animOut);$.each(opts.before,function(){opts.original.before.push(this);});$.each(opts.after,function(){opts.original.after.push(this);});}function supportMultiTransitions(opts){var i,tx,txs=$.fn.cycle.transitions;if(opts.fx.indexOf(",")>0){opts.multiFx=true;opts.fxs=opts.fx.replace(/\s*/g,"").split(",");for(i=0;i<opts.fxs.length;i++){var fx=opts.fxs[i];tx=txs[fx];if(!tx||!txs.hasOwnProperty(fx)||!$.isFunction(tx)){log("discarding unknown transition: ",fx);opts.fxs.splice(i,1);i--;}}if(!opts.fxs.length){log("No valid transitions named; slideshow terminating.");return false;}}else{if(opts.fx=="all"){opts.multiFx=true;opts.fxs=[];for(p in txs){tx=txs[p];if(txs.hasOwnProperty(p)&&$.isFunction(tx)){opts.fxs.push(p);}}}}if(opts.multiFx&&opts.randomizeEffects){var r1=Math.floor(Math.random()*20)+30;for(i=0;i<r1;i++){var r2=Math.floor(Math.random()*opts.fxs.length);opts.fxs.push(opts.fxs.splice(r2,1)[0]);}debug("randomized fx sequence: ",opts.fxs);}return true;}function exposeAddSlide(opts,els){opts.addSlide=function(newSlide,prepend){var $s=$(newSlide),s=$s[0];if(!opts.autostopCount){opts.countdown++;}els[prepend?"unshift":"push"](s);if(opts.els){opts.els[prepend?"unshift":"push"](s);}opts.slideCount=els.length;$s.css("position","absolute");$s[prepend?"prependTo":"appendTo"](opts.$cont);if(prepend){opts.currSlide++;opts.nextSlide++;}if(!$.support.opacity&&opts.cleartype&&!opts.cleartypeNoBg){clearTypeFix($s);}if(opts.fit&&opts.width){$s.width(opts.width);}if(opts.fit&&opts.height&&opts.height!="auto"){$slides.height(opts.height);}s.cycleH=(opts.fit&&opts.height)?opts.height:$s.height();s.cycleW=(opts.fit&&opts.width)?opts.width:$s.width();$s.css(opts.cssBefore);if(opts.pager||opts.pagerAnchorBuilder){$.fn.cycle.createPagerAnchor(els.length-1,s,$(opts.pager),els,opts);}if($.isFunction(opts.onAddSlide)){opts.onAddSlide($s);}else{$s.hide();}};}$.fn.cycle.resetState=function(opts,fx){fx=fx||opts.fx;opts.before=[];opts.after=[];opts.cssBefore=$.extend({},opts.original.cssBefore);opts.cssAfter=$.extend({},opts.original.cssAfter);opts.animIn=$.extend({},opts.original.animIn);opts.animOut=$.extend({},opts.original.animOut);opts.fxFn=null;$.each(opts.original.before,function(){opts.before.push(this);});$.each(opts.original.after,function(){opts.after.push(this);});var init=$.fn.cycle.transitions[fx];if($.isFunction(init)){init(opts.$cont,$(opts.elements),opts);}};function go(els,opts,manual,fwd){if(manual&&opts.busy&&opts.manualTrump){debug("manualTrump in go(), stopping active transition");$(els).stop(true,true);opts.busy=false;}if(opts.busy){debug("transition active, ignoring new tx request");return;}var p=opts.$cont[0],curr=els[opts.currSlide],next=els[opts.nextSlide];if(p.cycleStop!=opts.stopCount||p.cycleTimeout===0&&!manual){return;}if(!manual&&!p.cyclePause&&!opts.bounce&&((opts.autostop&&(--opts.countdown<=0))||(opts.nowrap&&!opts.random&&opts.nextSlide<opts.currSlide))){if(opts.end){opts.end(opts);}return;}var changed=false;if((manual||!p.cyclePause)&&(opts.nextSlide!=opts.currSlide)){changed=true;var fx=opts.fx;curr.cycleH=curr.cycleH||$(curr).height();curr.cycleW=curr.cycleW||$(curr).width();next.cycleH=next.cycleH||$(next).height();next.cycleW=next.cycleW||$(next).width();if(opts.multiFx){if(opts.lastFx==undefined||++opts.lastFx>=opts.fxs.length){opts.lastFx=0;}fx=opts.fxs[opts.lastFx];opts.currFx=fx;}if(opts.oneTimeFx){fx=opts.oneTimeFx;opts.oneTimeFx=null;}$.fn.cycle.resetState(opts,fx);if(opts.before.length){$.each(opts.before,function(i,o){if(p.cycleStop!=opts.stopCount){return;}o.apply(next,[curr,next,opts,fwd]);});}var after=function(){$.each(opts.after,function(i,o){if(p.cycleStop!=opts.stopCount){return;}o.apply(next,[curr,next,opts,fwd]);});};debug("tx firing; currSlide: "+opts.currSlide+"; nextSlide: "+opts.nextSlide);opts.busy=1;if(opts.fxFn){opts.fxFn(curr,next,opts,after,fwd,manual&&opts.fastOnEvent);}else{if($.isFunction($.fn.cycle[opts.fx])){$.fn.cycle[opts.fx](curr,next,opts,after,fwd,manual&&opts.fastOnEvent);}else{$.fn.cycle.custom(curr,next,opts,after,fwd,manual&&opts.fastOnEvent);}}}if(changed||opts.nextSlide==opts.currSlide){opts.lastSlide=opts.currSlide;if(opts.random){opts.currSlide=opts.nextSlide;if(++opts.randomIndex==els.length){opts.randomIndex=0;}opts.nextSlide=opts.randomMap[opts.randomIndex];if(opts.nextSlide==opts.currSlide){opts.nextSlide=(opts.currSlide==opts.slideCount-1)?0:opts.currSlide+1;}}else{if(opts.backwards){var roll=(opts.nextSlide-1)<0;if(roll&&opts.bounce){opts.backwards=!opts.backwards;opts.nextSlide=1;opts.currSlide=0;}else{opts.nextSlide=roll?(els.length-1):opts.nextSlide-1;opts.currSlide=roll?0:opts.nextSlide+1;}}else{var roll=(opts.nextSlide+1)==els.length;if(roll&&opts.bounce){opts.backwards=!opts.backwards;opts.nextSlide=els.length-2;opts.currSlide=els.length-1;}else{opts.nextSlide=roll?0:opts.nextSlide+1;opts.currSlide=roll?els.length-1:opts.nextSlide-1;}}}}if(changed&&opts.pager){opts.updateActivePagerLink(opts.pager,opts.currSlide,opts.activePagerClass);}var ms=0;if(opts.timeout&&!opts.continuous){ms=getTimeout(els[opts.currSlide],els[opts.nextSlide],opts,fwd);}else{if(opts.continuous&&p.cyclePause){ms=10;}}if(ms>0){p.cycleTimeout=setTimeout(function(){go(els,opts,0,(!opts.rev&&!opts.backwards));},ms);}}$.fn.cycle.updateActivePagerLink=function(pager,currSlide,clsName){$(pager).each(function(){$(this).children().removeClass(clsName).eq(currSlide).addClass(clsName);});};function getTimeout(curr,next,opts,fwd){if(opts.timeoutFn){var t=opts.timeoutFn.call(curr,curr,next,opts,fwd);while((t-opts.speed)<250){t+=opts.speed;}debug("calculated timeout: "+t+"; speed: "+opts.speed);if(t!==false){return t;}}return opts.timeout;}$.fn.cycle.next=function(opts){advance(opts,opts.rev?-1:1);};$.fn.cycle.prev=function(opts){advance(opts,opts.rev?1:-1);};function advance(opts,val){var els=opts.elements;var p=opts.$cont[0],timeout=p.cycleTimeout;if(timeout){clearTimeout(timeout);p.cycleTimeout=0;}if(opts.random&&val<0){opts.randomIndex--;if(--opts.randomIndex==-2){opts.randomIndex=els.length-2;}else{if(opts.randomIndex==-1){opts.randomIndex=els.length-1;}}opts.nextSlide=opts.randomMap[opts.randomIndex];}else{if(opts.random){opts.nextSlide=opts.randomMap[opts.randomIndex];}else{opts.nextSlide=opts.currSlide+val;if(opts.nextSlide<0){if(opts.nowrap){return false;}opts.nextSlide=els.length-1;}else{if(opts.nextSlide>=els.length){if(opts.nowrap){return false;}opts.nextSlide=0;}}}}var cb=opts.onPrevNextEvent||opts.prevNextClick;if($.isFunction(cb)){cb(val>0,opts.nextSlide,els[opts.nextSlide]);}go(els,opts,1,val>=0);return false;}function buildPager(els,opts){var $p=$(opts.pager);$.each(els,function(i,o){$.fn.cycle.createPagerAnchor(i,o,$p,els,opts);});opts.updateActivePagerLink(opts.pager,opts.startingSlide,opts.activePagerClass);}$.fn.cycle.createPagerAnchor=function(i,el,$p,els,opts){var a;if($.isFunction(opts.pagerAnchorBuilder)){a=opts.pagerAnchorBuilder(i,el);debug("pagerAnchorBuilder("+i+", el) returned: "+a);}else{a='<a href="#">'+(i+1)+"</a>";}if(!a){return;}var $a=$(a);if($a.parents("body").length===0){var arr=[];if($p.length>1){$p.each(function(){var $clone=$a.clone(true);$(this).append($clone);arr.push($clone[0]);});$a=$(arr);}else{$a.appendTo($p);}}opts.pagerAnchors=opts.pagerAnchors||[];opts.pagerAnchors.push($a);$a.bind(opts.pagerEvent,function(e){e.preventDefault();opts.nextSlide=i;var p=opts.$cont[0],timeout=p.cycleTimeout;if(timeout){clearTimeout(timeout);p.cycleTimeout=0;}var cb=opts.onPagerEvent||opts.pagerClick;if($.isFunction(cb)){cb(opts.nextSlide,els[opts.nextSlide]);}go(els,opts,1,opts.currSlide<i);});if(!/^click/.test(opts.pagerEvent)&&!opts.allowPagerClickBubble){$a.bind("click.cycle",function(){return false;});}if(opts.pauseOnPagerHover){$a.hover(function(){opts.$cont[0].cyclePause++;},function(){opts.$cont[0].cyclePause--;});}};$.fn.cycle.hopsFromLast=function(opts,fwd){var hops,l=opts.lastSlide,c=opts.currSlide;if(fwd){hops=c>l?c-l:opts.slideCount-l;}else{hops=c<l?l-c:l+opts.slideCount-c;}return hops;};function clearTypeFix($slides){debug("applying clearType background-color hack");function hex(s){s=parseInt(s).toString(16);return s.length<2?"0"+s:s;}function getBg(e){for(;e&&e.nodeName.toLowerCase()!="html";e=e.parentNode){var v=$.css(e,"background-color");if(v.indexOf("rgb")>=0){var rgb=v.match(/\d+/g);return"#"+hex(rgb[0])+hex(rgb[1])+hex(rgb[2]);}if(v&&v!="transparent"){return v;}}return"#ffffff";}$slides.each(function(){$(this).css("background-color",getBg(this));});}$.fn.cycle.commonReset=function(curr,next,opts,w,h,rev){$(opts.elements).not(curr).hide();opts.cssBefore.opacity=1;opts.cssBefore.display="block";if(w!==false&&next.cycleW>0){opts.cssBefore.width=next.cycleW;}if(h!==false&&next.cycleH>0){opts.cssBefore.height=next.cycleH;}opts.cssAfter=opts.cssAfter||{};opts.cssAfter.display="none";$(curr).css("zIndex",opts.slideCount+(rev===true?1:0));$(next).css("zIndex",opts.slideCount+(rev===true?0:1));};$.fn.cycle.custom=function(curr,next,opts,cb,fwd,speedOverride){var $l=$(curr),$n=$(next);var speedIn=opts.speedIn,speedOut=opts.speedOut,easeIn=opts.easeIn,easeOut=opts.easeOut;$n.css(opts.cssBefore);if(speedOverride){if(typeof speedOverride=="number"){speedIn=speedOut=speedOverride;}else{speedIn=speedOut=1;}easeIn=easeOut=null;}var fn=function(){$n.animate(opts.animIn,speedIn,easeIn,cb);};$l.animate(opts.animOut,speedOut,easeOut,function(){if(opts.cssAfter){$l.css(opts.cssAfter);}if(!opts.sync){fn();}});if(opts.sync){fn();}};$.fn.cycle.transitions={fade:function($cont,$slides,opts){$slides.not(":eq("+opts.currSlide+")").css("opacity",0);opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts);opts.cssBefore.opacity=0;});opts.animIn={opacity:1};opts.animOut={opacity:0};opts.cssBefore={top:0,left:0};}};$.fn.cycle.ver=function(){return ver;};$.fn.cycle.defaults={fx:"fade",timeout:4000,timeoutFn:null,continuous:0,speed:1000,speedIn:null,speedOut:null,next:null,prev:null,onPrevNextEvent:null,prevNextEvent:"click.cycle",pager:null,onPagerEvent:null,pagerEvent:"click.cycle",allowPagerClickBubble:false,pagerAnchorBuilder:null,before:null,after:null,end:null,easing:null,easeIn:null,easeOut:null,shuffle:null,animIn:null,animOut:null,cssBefore:null,cssAfter:null,fxFn:null,height:"auto",startingSlide:0,sync:1,random:0,fit:0,containerResize:1,pause:0,pauseOnPagerHover:0,autostop:0,autostopCount:0,delay:0,slideExpr:null,cleartype:!$.support.opacity,cleartypeNoBg:false,nowrap:0,fastOnEvent:0,randomizeEffects:1,rev:0,manualTrump:true,requeueOnImageNotLoaded:true,requeueTimeout:250,activePagerClass:"activeSlide",updateActivePagerLink:null,backwards:false};})(jQuery);
/*
 * jQuery Cycle Plugin Transition Definitions
 * This script is a plugin for the jQuery Cycle Plugin
 * Examples and documentation at: http://malsup.com/jquery/cycle/
 * Copyright (c) 2007-2010 M. Alsup
 * Version:	 2.72
 * Dual licensed under the MIT and GPL licenses:
 * http://www.opensource.org/licenses/mit-license.php
 * http://www.gnu.org/licenses/gpl.html
 */
(function($){$.fn.cycle.transitions.none=function($cont,$slides,opts){opts.fxFn=function(curr,next,opts,after){$(next).show();$(curr).hide();after();};};$.fn.cycle.transitions.scrollUp=function($cont,$slides,opts){$cont.css("overflow","hidden");opts.before.push($.fn.cycle.commonReset);var h=$cont.height();opts.cssBefore={top:h,left:0};opts.cssFirst={top:0};opts.animIn={top:0};opts.animOut={top:-h};};$.fn.cycle.transitions.scrollDown=function($cont,$slides,opts){$cont.css("overflow","hidden");opts.before.push($.fn.cycle.commonReset);var h=$cont.height();opts.cssFirst={top:0};opts.cssBefore={top:-h,left:0};opts.animIn={top:0};opts.animOut={top:h};};$.fn.cycle.transitions.scrollLeft=function($cont,$slides,opts){$cont.css("overflow","hidden");opts.before.push($.fn.cycle.commonReset);var w=$cont.width();opts.cssFirst={left:0};opts.cssBefore={left:w,top:0};opts.animIn={left:0};opts.animOut={left:0-w};};$.fn.cycle.transitions.scrollRight=function($cont,$slides,opts){$cont.css("overflow","hidden");opts.before.push($.fn.cycle.commonReset);var w=$cont.width();opts.cssFirst={left:0};opts.cssBefore={left:-w,top:0};opts.animIn={left:0};opts.animOut={left:w};};$.fn.cycle.transitions.scrollHorz=function($cont,$slides,opts){$cont.css("overflow","hidden").width();opts.before.push(function(curr,next,opts,fwd){$.fn.cycle.commonReset(curr,next,opts);opts.cssBefore.left=fwd?(next.cycleW-1):(1-next.cycleW);opts.animOut.left=fwd?-curr.cycleW:curr.cycleW;});opts.cssFirst={left:0};opts.cssBefore={top:0};opts.animIn={left:0};opts.animOut={top:0};};$.fn.cycle.transitions.scrollVert=function($cont,$slides,opts){$cont.css("overflow","hidden");opts.before.push(function(curr,next,opts,fwd){$.fn.cycle.commonReset(curr,next,opts);opts.cssBefore.top=fwd?(1-next.cycleH):(next.cycleH-1);opts.animOut.top=fwd?curr.cycleH:-curr.cycleH;});opts.cssFirst={top:0};opts.cssBefore={left:0};opts.animIn={top:0};opts.animOut={left:0};};$.fn.cycle.transitions.slideX=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$(opts.elements).not(curr).hide();$.fn.cycle.commonReset(curr,next,opts,false,true);opts.animIn.width=next.cycleW;});opts.cssBefore={left:0,top:0,width:0};opts.animIn={width:"show"};opts.animOut={width:0};};$.fn.cycle.transitions.slideY=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$(opts.elements).not(curr).hide();$.fn.cycle.commonReset(curr,next,opts,true,false);opts.animIn.height=next.cycleH;});opts.cssBefore={left:0,top:0,height:0};opts.animIn={height:"show"};opts.animOut={height:0};};$.fn.cycle.transitions.shuffle=function($cont,$slides,opts){var i,w=$cont.css("overflow","visible").width();$slides.css({left:0,top:0});opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,true,true,true);});if(!opts.speedAdjusted){opts.speed=opts.speed/2;opts.speedAdjusted=true;}opts.random=0;opts.shuffle=opts.shuffle||{left:-w,top:15};opts.els=[];for(i=0;i<$slides.length;i++){opts.els.push($slides[i]);}for(i=0;i<opts.currSlide;i++){opts.els.push(opts.els.shift());}opts.fxFn=function(curr,next,opts,cb,fwd){var $el=fwd?$(curr):$(next);$(next).css(opts.cssBefore);var count=opts.slideCount;$el.animate(opts.shuffle,opts.speedIn,opts.easeIn,function(){var hops=$.fn.cycle.hopsFromLast(opts,fwd);for(var k=0;k<hops;k++){fwd?opts.els.push(opts.els.shift()):opts.els.unshift(opts.els.pop());}if(fwd){for(var i=0,len=opts.els.length;i<len;i++){$(opts.els[i]).css("z-index",len-i+count);}}else{var z=$(curr).css("z-index");$el.css("z-index",parseInt(z)+1+count);}$el.animate({left:0,top:0},opts.speedOut,opts.easeOut,function(){$(fwd?this:curr).hide();if(cb){cb();}});});};opts.cssBefore={display:"block",opacity:1,top:0,left:0};};$.fn.cycle.transitions.turnUp=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,true,false);opts.cssBefore.top=next.cycleH;opts.animIn.height=next.cycleH;});opts.cssFirst={top:0};opts.cssBefore={left:0,height:0};opts.animIn={top:0};opts.animOut={height:0};};$.fn.cycle.transitions.turnDown=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,true,false);opts.animIn.height=next.cycleH;opts.animOut.top=curr.cycleH;});opts.cssFirst={top:0};opts.cssBefore={left:0,top:0,height:0};opts.animOut={height:0};};$.fn.cycle.transitions.turnLeft=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,false,true);opts.cssBefore.left=next.cycleW;opts.animIn.width=next.cycleW;});opts.cssBefore={top:0,width:0};opts.animIn={left:0};opts.animOut={width:0};};$.fn.cycle.transitions.turnRight=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,false,true);opts.animIn.width=next.cycleW;opts.animOut.left=curr.cycleW;});opts.cssBefore={top:0,left:0,width:0};opts.animIn={left:0};opts.animOut={width:0};};$.fn.cycle.transitions.zoom=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,false,false,true);opts.cssBefore.top=next.cycleH/2;opts.cssBefore.left=next.cycleW/2;opts.animIn={top:0,left:0,width:next.cycleW,height:next.cycleH};opts.animOut={width:0,height:0,top:curr.cycleH/2,left:curr.cycleW/2};});opts.cssFirst={top:0,left:0};opts.cssBefore={width:0,height:0};};$.fn.cycle.transitions.fadeZoom=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,false,false);opts.cssBefore.left=next.cycleW/2;opts.cssBefore.top=next.cycleH/2;opts.animIn={top:0,left:0,width:next.cycleW,height:next.cycleH};});opts.cssBefore={width:0,height:0};opts.animOut={opacity:0};};$.fn.cycle.transitions.blindX=function($cont,$slides,opts){var w=$cont.css("overflow","hidden").width();opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts);opts.animIn.width=next.cycleW;opts.animOut.left=curr.cycleW;});opts.cssBefore={left:w,top:0};opts.animIn={left:0};opts.animOut={left:w};};$.fn.cycle.transitions.blindY=function($cont,$slides,opts){var h=$cont.css("overflow","hidden").height();opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts);opts.animIn.height=next.cycleH;opts.animOut.top=curr.cycleH;});opts.cssBefore={top:h,left:0};opts.animIn={top:0};opts.animOut={top:h};};$.fn.cycle.transitions.blindZ=function($cont,$slides,opts){var h=$cont.css("overflow","hidden").height();var w=$cont.width();opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts);opts.animIn.height=next.cycleH;opts.animOut.top=curr.cycleH;});opts.cssBefore={top:h,left:w};opts.animIn={top:0,left:0};opts.animOut={top:h,left:w};};$.fn.cycle.transitions.growX=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,false,true);opts.cssBefore.left=this.cycleW/2;opts.animIn={left:0,width:this.cycleW};opts.animOut={left:0};});opts.cssBefore={width:0,top:0};};$.fn.cycle.transitions.growY=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,true,false);opts.cssBefore.top=this.cycleH/2;opts.animIn={top:0,height:this.cycleH};opts.animOut={top:0};});opts.cssBefore={height:0,left:0};};$.fn.cycle.transitions.curtainX=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,false,true,true);opts.cssBefore.left=next.cycleW/2;opts.animIn={left:0,width:this.cycleW};opts.animOut={left:curr.cycleW/2,width:0};});opts.cssBefore={top:0,width:0};};$.fn.cycle.transitions.curtainY=function($cont,$slides,opts){opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,true,false,true);opts.cssBefore.top=next.cycleH/2;opts.animIn={top:0,height:next.cycleH};opts.animOut={top:curr.cycleH/2,height:0};});opts.cssBefore={left:0,height:0};};$.fn.cycle.transitions.cover=function($cont,$slides,opts){var d=opts.direction||"left";var w=$cont.css("overflow","hidden").width();var h=$cont.height();opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts);if(d=="right"){opts.cssBefore.left=-w;}else{if(d=="up"){opts.cssBefore.top=h;}else{if(d=="down"){opts.cssBefore.top=-h;}else{opts.cssBefore.left=w;}}}});opts.animIn={left:0,top:0};opts.animOut={opacity:1};opts.cssBefore={top:0,left:0};};$.fn.cycle.transitions.uncover=function($cont,$slides,opts){var d=opts.direction||"left";var w=$cont.css("overflow","hidden").width();var h=$cont.height();opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,true,true,true);if(d=="right"){opts.animOut.left=w;}else{if(d=="up"){opts.animOut.top=-h;}else{if(d=="down"){opts.animOut.top=h;}else{opts.animOut.left=-w;}}}});opts.animIn={left:0,top:0};opts.animOut={opacity:1};opts.cssBefore={top:0,left:0};};$.fn.cycle.transitions.toss=function($cont,$slides,opts){var w=$cont.css("overflow","visible").width();var h=$cont.height();opts.before.push(function(curr,next,opts){$.fn.cycle.commonReset(curr,next,opts,true,true,true);if(!opts.animOut.left&&!opts.animOut.top){opts.animOut={left:w*2,top:-h/2,opacity:0};}else{opts.animOut.opacity=0;}});opts.cssBefore={left:0,top:0};opts.animIn={left:0};};$.fn.cycle.transitions.wipe=function($cont,$slides,opts){var w=$cont.css("overflow","hidden").width();var h=$cont.height();opts.cssBefore=opts.cssBefore||{};var clip;if(opts.clip){if(/l2r/.test(opts.clip)){clip="rect(0px 0px "+h+"px 0px)";}else{if(/r2l/.test(opts.clip)){clip="rect(0px "+w+"px "+h+"px "+w+"px)";}else{if(/t2b/.test(opts.clip)){clip="rect(0px "+w+"px 0px 0px)";}else{if(/b2t/.test(opts.clip)){clip="rect("+h+"px "+w+"px "+h+"px 0px)";}else{if(/zoom/.test(opts.clip)){var top=parseInt(h/2);var left=parseInt(w/2);clip="rect("+top+"px "+left+"px "+top+"px "+left+"px)";}}}}}}opts.cssBefore.clip=opts.cssBefore.clip||clip||"rect(0px 0px 0px 0px)";var d=opts.cssBefore.clip.match(/(\d+)/g);var t=parseInt(d[0]),r=parseInt(d[1]),b=parseInt(d[2]),l=parseInt(d[3]);opts.before.push(function(curr,next,opts){if(curr==next){return;}var $curr=$(curr),$next=$(next);$.fn.cycle.commonReset(curr,next,opts,true,true,false);opts.cssAfter.display="block";var step=1,count=parseInt((opts.speedIn/13))-1;(function f(){var tt=t?t-parseInt(step*(t/count)):0;var ll=l?l-parseInt(step*(l/count)):0;var bb=b<h?b+parseInt(step*((h-b)/count||1)):h;var rr=r<w?r+parseInt(step*((w-r)/count||1)):w;$next.css({clip:"rect("+tt+"px "+rr+"px "+bb+"px "+ll+"px)"});(step++<=count)?setTimeout(f,13):$curr.css("display","none");})();});opts.cssBefore={display:"block",opacity:1,top:0,left:0};opts.animIn={left:0};opts.animOut={left:0};};})(jQuery);

//]]>
</script>
<script type='text/javascript'>
//<![CDATA[

/*global jQuery */
/*jshint browser:true */
/*!
* FitVids 1.1
*
* Copyright 2013, Chris Coyier - http://css-tricks.com + Dave Rupert - http://daverupert.com
* Credit to Thierry Koblentz - http://www.alistapart.com/articles/creating-intrinsic-ratios-for-video/
* Released under the WTFPL license - http://sam.zoy.org/wtfpl/
*
*/

(function( $ ){

  "use strict";

  $.fn.fitVids = function( options ) {
    var settings = {
      customSelector: null,
      ignore: null
    };

    if(!document.getElementById('fit-vids-style')) {
      // appendStyles: https://github.com/toddmotto/fluidvids/blob/master/dist/fluidvids.js
      var head = document.head || document.getElementsByTagName('head')[0];
      var css = '.fluid-width-video-wrapper{width:100%;position:relative;padding:0;}.fluid-width-video-wrapper iframe,.fluid-width-video-wrapper object,.fluid-width-video-wrapper embed {position:absolute;top:0;left:0;width:100%;height:100%;}';
      var div = document.createElement('div');
      div.innerHTML = '<p>x</p><style id="fit-vids-style">' + css + '</style>';
      head.appendChild(div.childNodes[1]);
    }

    if ( options ) {
      $.extend( settings, options );
    }

    return this.each(function(){
      var selectors = [
        "iframe[src*='player.vimeo.com']",
        "iframe[src*='youtube.com']",
        "iframe[src*='youtube-nocookie.com']",
        "iframe[src*='kickstarter.com'][src*='video.html']",
        "object",
        "embed"
      ];

      if (settings.customSelector) {
        selectors.push(settings.customSelector);
      }

      var ignoreList = '.fitvidsignore';

      if(settings.ignore) {
        ignoreList = ignoreList + ', ' + settings.ignore;
      }

      var $allVideos = $(this).find(selectors.join(','));
      $allVideos = $allVideos.not("object object"); // SwfObj conflict patch
      $allVideos = $allVideos.not(ignoreList); // Disable FitVids on this video.

      $allVideos.each(function(){
        var $this = $(this);
        if($this.parents(ignoreList).length > 0) {
          return; // Disable FitVids on this video.
        }
        if (this.tagName.toLowerCase() === 'embed' && $this.parent('object').length || $this.parent('.fluid-width-video-wrapper').length) { return; }
        if ((!$this.css('height') && !$this.css('width')) && (isNaN($this.attr('height')) || isNaN($this.attr('width'))))
        {
          $this.attr('height', 9);
          $this.attr('width', 16);
        }
        var height = ( this.tagName.toLowerCase() === 'object' || ($this.attr('height') && !isNaN(parseInt($this.attr('height'), 10))) ) ? parseInt($this.attr('height'), 10) : $this.height(),
            width = !isNaN(parseInt($this.attr('width'), 10)) ? parseInt($this.attr('width'), 10) : $this.width(),
            aspectRatio = height / width;
        if(!$this.attr('id')){
          var videoID = 'fitvid' + Math.floor(Math.random()*999999);
          $this.attr('id', videoID);
        }
        $this.wrap('<div class="fluid-width-video-wrapper"></div>').parent('.fluid-width-video-wrapper').css('padding-top', (aspectRatio * 100)+"%");
        $this.removeAttr('height').removeAttr('width');
      });
    });
  };
// Works with either jQuery or Zepto
})( window.jQuery || window.Zepto );

//]]>
</script>
<script type='text/javascript'>
//<![CDATA[

jQuery.noConflict();
jQuery(function () {
    jQuery('ul.menu-primary').superfish({
        animation: {
            opacity: 'show'
        },
        autoArrows: true,
        dropShadows: false,
        speed: 200,
        delay: 800
    });
});

jQuery(document).ready(function() {
jQuery('.menu-primary-container').mobileMenu({
    defaultText: 'Menu',
    className: 'menu-primary-responsive',
    containerClass: 'menu-primary-responsive-container',
    subMenuDash: '&ndash;'
});
});

jQuery(document).ready(function() {
var blloc = window.location.href;
jQuery("#pagelistmenusblogul li a").each(function() {
  var blloc2 = jQuery(this).attr('href');
  if(blloc2 == blloc) {
     jQuery(this).parent('li').addClass('current-cat');
  }
});
});

jQuery(function () {
    jQuery('ul.menu-secondary').superfish({
        animation: {
            opacity: 'show'
        },
        autoArrows: true,
        dropShadows: false,
        speed: 200,
        delay: 800
    });
});

jQuery(document).ready(function() {
jQuery('.menu-secondary-container').mobileMenu({
    defaultText: 'Navigation',
    className: 'menu-secondary-responsive',
    containerClass: 'menu-secondary-responsive-container',
    subMenuDash: '&ndash;'
});
jQuery(".post").fitVids();
});

jQuery(document).ready(function () {
    jQuery('.fp-slides').cycle({
        fx: 'scrollHorz',
        timeout: 4000,
        delay: 0,
        speed: 400,
        next: '.fp-next',
        prev: '.fp-prev',
        pager: '.fp-pager',
        continuous: 0,
        sync: 1,
        pause: 1,
        pauseOnPagerHover: 1,
        cleartype: true,
        cleartypeNoBg: true
    });
});

//]]>
</script>
<script type='text/javascript'>
//<![CDATA[

function showrecentcomments(json){for(var i=0;i<a_rc;i++){var b_rc=json.feed.entry[i];var c_rc;if(i==json.feed.entry.length)break;for(var k=0;k<b_rc.link.length;k++){if(b_rc.link[k].rel=='alternate'){c_rc=b_rc.link[k].href;break;}}c_rc=c_rc.replace("#","#comment-");var d_rc=c_rc.split("#");d_rc=d_rc[0];var e_rc=d_rc.split("/");e_rc=e_rc[5];e_rc=e_rc.split(".html");e_rc=e_rc[0];var f_rc=e_rc.replace(/-/g," ");f_rc=f_rc.link(d_rc);var g_rc=b_rc.published.$t;var h_rc=g_rc.substring(0,4);var i_rc=g_rc.substring(5,7);var j_rc=g_rc.substring(8,10);var k_rc=new Array();k_rc[1]="Jan";k_rc[2]="Feb";k_rc[3]="Mar";k_rc[4]="Apr";k_rc[5]="May";k_rc[6]="Jun";k_rc[7]="Jul";k_rc[8]="Aug";k_rc[9]="Sep";k_rc[10]="Oct";k_rc[11]="Nov";k_rc[12]="Dec";if("content" in b_rc){var l_rc=b_rc.content.$t;}else if("summary" in b_rc){var l_rc=b_rc.summary.$t;}else var l_rc="";var re=/<\S[^>]*>/g;l_rc=l_rc.replace(re,"");if(m_rc==true)document.write('On '+k_rc[parseInt(i_rc,10)]+' '+j_rc+' ');document.write('<a href="'+c_rc+'">'+b_rc.author[0].name.$t+'</a> commented');if(n_rc==true)document.write(' on '+f_rc);document.write(': ');if(l_rc.length<o_rc){document.write('<i>&#8220;');document.write(l_rc);document.write('&#8221;</i><br/><br/>');}else{document.write('<i>&#8220;');l_rc=l_rc.substring(0,o_rc);var p_rc=l_rc.lastIndexOf(" ");l_rc=l_rc.substring(0,p_rc);document.write(l_rc+'&hellip;&#8221;</i>');document.write('<br/><br/>');}}}

function rp(json){document.write('<ul>');for(var i=0;i<numposts;i++){document.write('<li>');var entry=json.feed.entry[i];var posttitle=entry.title.$t;var posturl;if(i==json.feed.entry.length)break;for(var k=0;k<entry.link.length;k++){if(entry.link[k].rel=='alternate'){posturl=entry.link[k].href;break}}posttitle=posttitle.link(posturl);var readmorelink="(more)";readmorelink=readmorelink.link(posturl);var postdate=entry.published.$t;var cdyear=postdate.substring(0,4);var cdmonth=postdate.substring(5,7);var cdday=postdate.substring(8,10);var monthnames=new Array();monthnames[1]="Jan";monthnames[2]="Feb";monthnames[3]="Mar";monthnames[4]="Apr";monthnames[5]="May";monthnames[6]="Jun";monthnames[7]="Jul";monthnames[8]="Aug";monthnames[9]="Sep";monthnames[10]="Oct";monthnames[11]="Nov";monthnames[12]="Dec";if("content"in entry){var postcontent=entry.content.$t}else if("summary"in entry){var postcontent=entry.summary.$t}else var postcontent="";var re=/<\S[^>]*>/g;postcontent=postcontent.replace(re,"");document.write(posttitle);if(showpostdate==true)document.write(' - '+monthnames[parseInt(cdmonth,10)]+' '+cdday);if(showpostsummary==true){if(postcontent.length<numchars){document.write(postcontent)}else{postcontent=postcontent.substring(0,numchars);var quoteEnd=postcontent.lastIndexOf(" ");postcontent=postcontent.substring(0,quoteEnd);document.write(postcontent+'...'+readmorelink)}}document.write('</li>')}document.write('</ul>')}

//]]>
</script>
<script type='text/javascript'>
summary_noimg = 350;
summary_img = 275;
img_thumb_height = 150;
img_thumb_width = 200; 
</script>
<script type='text/javascript'>
//<![CDATA[

function removeHtmlTag(strx,chop){ 
	if(strx.indexOf("<")!=-1)
	{
		var s = strx.split("<"); 
		for(var i=0;i<s.length;i++){ 
			if(s[i].indexOf(">")!=-1){ 
				s[i] = s[i].substring(s[i].indexOf(">")+1,s[i].length); 
			} 
		} 
		strx =  s.join(""); 
	}
	chop = (chop < strx.length-1) ? chop : strx.length-2; 
	while(strx.charAt(chop-1)!=' ' && strx.indexOf(' ',chop)!=-1) chop++; 
	strx = strx.substring(0,chop-1); 
	return strx+'...'; 
}

function createSummaryAndThumb(pID){
	var div = document.getElementById(pID);
	var imgtag = "";
	var img = div.getElementsByTagName("img");
	var summ = summary_noimg;
	if(img.length>=1) {	
		imgtag = '<img src="'+img[0].src+'" class="pbtthumbimg"/>';
		summ = summary_img;
	}
	
	var summary = imgtag + '<div>' + removeHtmlTag(div.innerHTML,summ) + '</div>';
	div.innerHTML = summary;
}

//]]>
</script>
<style type='text/css'>
.clearfix:after{content:"\0020";display:block;height:0;clear:both;visibility:hidden;overflow:hidden}
#container,#header,#main,#main-fullwidth,#footer,.clearfix{display:block}
.clear{clear:both}
body {font-family:'Bitter', Arial, Helvetica, Sans-serif;}
.post-body {font-family:'Bitter', Arial, Helvetica, Sans-serif;}
h1,h2,h3,h4,h5,h6{margin-bottom:16px;font-weight:normal;line-height:1;color: #aa4b80;}
h1{font-size:30px}
h2{font-size:25px}
h3{font-size:20px}
h4{font-size:16px}
h5{font-size:14px}
h6{font-size:12px}
h1 img,h2 img,h3 img,h4 img,h5 img,h6 img{margin:0}
table{margin-bottom:20px;width:100%}
th{font-weight:bold}
thead th{background:#c3d9ff}
th,td,caption{padding:4px 10px 4px 5px}
tr.even td{background:#e5ecf9}
tfoot{font-style:italic}
caption{background:#eee}
li ul,li ol{margin:0}
ul,ol{margin:0 20px 20px 0;padding-left:20px}
ul{list-style-type:disc}
ol{list-style-type:decimal}
dl{margin:0 0 20px 0}
dl dt{font-weight:bold}
dd{margin-left:20px}
blockquote{margin:20px;color:#666;}
pre{margin:20px 0;white-space:pre}
code,tt{font:13px 'andale mono','lucida console',monospace;line-height:18px}
#search {overflow:hidden;}
#header h1{font-family:'Oswald',Arial,Helvetica,Sans-serif;}
#header .description{font-family:Bitter,Arial,Helvetica,Sans-serif;}
.post-title {font-family:'Oswald',sans-serif;}
.sidebar h2{font-family:'Oswald',sans-serif;}
#footer-widgets .widgettitle, #footer-widgets .widget h2{font-family:'Oswald',Arial,Helvetica,Sans-serif;}
.menus,.menus *{margin:0;padding:0;list-style:none;list-style-type:none;line-height:1.0}
.menus ul{position:absolute;top:-999em;width:100%}
.menus ul li{width:100%}
.menus li:hover{visibility:inherit}
.menus li{float:left;position:relative}
.menus a{display:block;position:relative}
.menus li:hover ul,.menus li.sfHover ul{left:0;top:100%;z-index:99}
.menus li:hover li ul,.menus li.sfHover li ul{top:-999em}
.menus li li:hover ul,.menus li li.sfHover ul{left:100%;top:0}
.menus li li:hover li ul,.menus li li.sfHover li ul{top:-999em}
.menus li li li:hover ul,.menus li li li.sfHover ul{left:100%;top:0}
.sf-shadow ul{padding:0 8px 9px 0;-moz-border-radius-bottomleft:17px;-moz-border-radius-topright:17px;-webkit-border-top-right-radius:17px;-webkit-border-bottom-left-radius:17px}
.menus .sf-shadow ul.sf-shadow-off{background:transparent}
.menu-primary-container{float:right;padding:0;position:relative;height:34px;background:none;z-index:400}
.menu-primary ul{min-width:160px}
.menu-primary li a{color:#7B7B7B;padding:11px 15px;text-decoration:none;font-family:'Oswald',sans-serif;font-size:12px;line-height:12px;text-transform:uppercase;font-weight:normal;margin:0 3px 2px 0}
.menu-primary li a:hover,.menu-primary li a:active,.menu-primary li a:focus,.menu-primary li:hover > a,.menu-primary li.current-cat > a,.menu-primary li.current_page_item > a,.menu-primary li.current-menu-item > a{color:#E50808;outline:0;border-bottom:2px solid #E61515;margin:0 3px 0 0}
.menu-primary li li a{color:#FFF;text-transform:none;background:#666;padding:10px 15px;margin:0;border:0;font-weight:normal}
.menu-primary li li a:hover,.menu-primary li li a:active,.menu-primary li li a:focus,.menu-primary li li:hover > a,.menu-primary li li.current-cat > a,.menu-primary li li.current_page_item > a,.menu-primary li li.current-menu-item > a{color:#FFF;background:#E50808;outline:0;border-bottom:0;text-decoration:none;margin:0}
.menu-primary a.sf-with-ul{padding-right:20px;min-width:1px}
.menu-primary .sf-sub-indicator{position:absolute;display:block;overflow:hidden;right:0;top:0;padding:10px 10px 0 0}
.menu-primary li li .sf-sub-indicator{padding:9px 10px 0 0}
.wrap-menu-primary .sf-shadow ul{background:url(http://3.bp.blogspot.com/-wF6aF2849Zo/VJBvpJEibnI/AAAAAAAAOFs/AI6pn51ORu4/s1600/menu-primary-shadow.png) no-repeat bottom right}
.menu-secondary-container{position:relative;height:44px;z-index:300;background:#F0EFEF;border-bottom:3px solid #E50808;border-top:3px solid #FFF}
.menu-secondary ul{min-width:160px}
.menu-secondary li a{color:#555;padding:16px 15px 15px;text-decoration:none;font-family:'Oswald',sans-serif;font-size:13px;line-height:13px;text-transform:uppercase;font-weight:normal;margin-bottom:3px}
.menu-secondary li a:hover,.menu-secondary li a:active,.menu-secondary li a:focus,.menu-secondary li:hover > a,.menu-secondary li.current-cat > a,.menu-secondary li.current_page_item > a,.menu-secondary li.current-menu-item > a{color:#FFF;background:#E50808;outline:0;border-top:3px solid #C40E0E;margin-top:-3px}
.menu-secondary li li a{color:#fff;background:#E50808;padding:10px 15px;text-transform:none;margin:0;font-weight:normal}
.menu-secondary li li a:hover,.menu-secondary li li a:active,.menu-secondary li li a:focus,.menu-secondary li li:hover > a,.menu-secondary li li.current-cat > a,.menu-secondary li li.current_page_item > a,.menu-secondary li li.current-menu-item > a{color:#fff;background:#C40E0E;outline:0;border-top:0;margin-top:0}
.menu-secondary a.sf-with-ul{padding-right:26px;min-width:1px}
.menu-secondary .sf-sub-indicator{position:absolute;display:block;overflow:hidden;right:0;top:0;padding:15px 13px 0 0}
.menu-secondary li li .sf-sub-indicator{padding:9px 13px 0 0}
.wrap-menu-secondary .sf-shadow ul{background:url(http://3.bp.blogspot.com/-DfngTI0EFMw/VJBvpXpvBxI/AAAAAAAAOFk/dOlQ08rqhQQ/s1600/menu-secondary-shadow.png) no-repeat bottom right}
.fp-slider{margin:0 auto 15px auto;padding:0px;width:930px;height:332px;overflow:hidden;position:relative;}
.fp-slides-container{}
.fp-slides,.fp-thumbnail,.fp-prev-next,.fp-nav{width:930px;}
.fp-slides,.fp-thumbnail{height:300px;overflow:hidden;position:relative}
.fp-title{color:#fff;text-shadow:0px 1px 0px #000;font:normal 18px Oswald,Arial,Helvetica,Sans-serif;padding:0 0 2px 0;margin:0}
.fp-title a,.fp-title a:hover{color:#fff;text-shadow:0px 1px 0px #000;text-decoration:none}
.fp-content{position:absolute;bottom:0;left:0;right:0;background:#111;opacity:0.7;filter:alpha(opacity = 70);padding:10px 15px;overflow:hidden}
.fp-content p{color:#fff;text-shadow:0px 1px 0px #000;padding:0;margin:0;line-height:18px}
.fp-more,.fp-more:hover{color:#fff;font-weight:bold}
.fp-nav{height:12px;text-align:center;padding:10px 0;background:#333;}
.fp-pager a{background-image:url(http://3.bp.blogspot.com/-_668d43Op_0/T2aDUoc25DI/AAAAAAAAEKY/psYROX1ZRhA/s1600/featured-pager.png);cursor:pointer;margin:0 8px 0 0;padding:0;display:inline-block;width:12px;height:12px;overflow:hidden;text-indent:-999px;background-position:0 0;float:none;line-height:1;opacity:0.7;filter:alpha(opacity = 70)}
.fp-pager a:hover,.fp-pager a.activeSlide{text-decoration:none;background-position:0 -112px;opacity:1.0;filter:alpha(opacity = 100)}
.fp-prev-next-wrap{position:relative;z-index:200}
.fp-prev-next{position:absolute;bottom:130px;left:0;right:0;height:37px}
.fp-prev{margin-top:-180px;float:left;margin-left:14px;width:37px;height:37px;background:url(http://3.bp.blogspot.com/-ZRxI7cg9obU/T2aDVpbxNOI/AAAAAAAAEKg/segBpoEkvss/s1600/featured-prev.png) left top no-repeat;opacity:0.6;filter:alpha(opacity = 60)}
.fp-prev:hover{opacity:0.8;filter:alpha(opacity = 80)}
.fp-next{margin-top:-180px;float:right;width:36px;height:37px;margin-right:14px;background:url(http://2.bp.blogspot.com/-PAv4EZRomGI/T2aDUGqVfCI/AAAAAAAAEKQ/kwsDqWHBhH8/s1600/featured-next.png) right top no-repeat;opacity:0.6;filter:alpha(opacity = 60)}
.fp-next:hover{opacity:0.8;filter:alpha(opacity = 80)}
/* -- number page navigation -- */
#blog-pager {padding:6px;font-size:13px;margin: 10px 0;}
.tabs-widget{list-style:none;list-style-type:none;margin:0 0 10px;padding:0;height:26px}
.tabs-widget li{list-style:none;list-style-type:none;margin:0 0 0 4px;padding:0;float:left}
.tabs-widget li:first-child{margin:0}
.tabs-widget li a{color:#E50808;background:#F0EFEF;padding:6px 16px;font-family:Arial,Helvetica,Sans-serif;font-weight:bold;display:block;text-decoration:none;font-size:12px;line-height:12px}
.tabs-widget li a:hover,.tabs-widget li a.tabs-widget-current{background:#E50808;color:#fff;text-decoration:none}
.tabs-widget-content{}
.tabviewsection{margin-top:10px;margin-bottom:10px;}
#crosscol-wrapper{display:none;}
.PopularPosts .item-title{font-weight:bold;padding-bottom:0.2em;text-shadow:0px 1px 0px #fff;}
.PopularPosts .widget-content ul li{padding:5px 0px;background:none}
.tabviewsection .PopularPosts .widget-content ul li{margin:0px !important;}
#search #s {font-family: Bitter;}
.related-postbwrap{margin:10px auto 0;}
.related-postbwrap h4{font-weight: bold;margin:0 0 .5em;}
.related-post-style-2,.related-post-style-2 li{list-style:none;margin:0;padding:0;}
.related-post-style-2 li{border-top:1px solid #eee;overflow:hidden;padding:10px 0px;}
.related-post-style-2 li:first-child{border-top:none;}
.related-post-style-2 .related-post-item-thumbnail{width:80px;height:80px;max-width:none;max-height:none;background-color:transparent;border:none;float:left;margin:2px 10px 0 0;padding:0;}
.related-post-style-2 .related-post-item-title{font-weight:bold;font-size:100%;}
.related-post-style-2 .related-post-item-summary{display:block;}
.related-post-style-3,.related-post-style-3 li{margin:0;padding:0;list-style:none;word-wrap:break-word;overflow:hidden}
.related-post-style-3 .related-post-item{display:block;float:left;width:100px;height:auto;padding:10px;border-left:0px solid #eee;margin-bottom:-989px;padding-bottom:999px}
.related-post-style-3 .related-post-item:first-child{border-left:none}
.related-post-style-3 .related-post-item-thumbnail{display:block;margin:0 0 10px;width:100px;height:auto;max-width:100%;max-height:none;background-color:transparent;border:none;padding:0}
.related-post-style-3 .related-post-item-title{font-weight:normal;}
.breadcrumb-bwrap {border: 1px dotted #cccccc;font-size: 100%;line-height: 1.4;margin: 0 0 15px;padding: 5px;background: #F0EFEF;}
div.span-1,div.span-2,div.span-3,div.span-4,div.span-5,div.span-6,div.span-7,div.span-8,div.span-9,div.span-10,div.span-11,div.span-12,div.span-13,div.span-14,div.span-15,div.span-16,div.span-17,div.span-18,div.span-19,div.span-20,div.span-21,div.span-22,div.span-23,div.span-24{float:left;margin-right:10px}
.span-1{width:30px}.span-2{width:70px}.span-3{width:110px}.span-4{width:150px}.span-5{width:190px}.span-6{width:230px}.span-7{width:270px}.span-8{width:310px}.span-9{width:350px}.span-10{width:390px}.span-11{width:430px}.span-12{width:470px}.span-13{width:510px}.span-14{width:550px}.span-15{width:590px}.span-16{width:630px}.span-17{width:670px}.span-18{width:710px}.span-19{width:750px}.span-20{width:790px}.span-21{width:830px}.span-22{width:870px}.span-23{width:910px}.span-24,div.span-24{width:1050px;margin:0}input.span-1,textarea.span-1,input.span-2,textarea.span-2,input.span-3,textarea.span-3,input.span-4,textarea.span-4,input.span-5,textarea.span-5,input.span-6,textarea.span-6,input.span-7,textarea.span-7,input.span-8,textarea.span-8,input.span-9,textarea.span-9,input.span-10,textarea.span-10,input.span-11,textarea.span-11,input.span-12,textarea.span-12,input.span-13,textarea.span-13,input.span-14,textarea.span-14,input.span-15,textarea.span-15,input.span-16,textarea.span-16,input.span-17,textarea.span-17,input.span-18,textarea.span-18,input.span-19,textarea.span-19,input.span-20,textarea.span-20,input.span-21,textarea.span-21,input.span-22,textarea.span-22,input.span-23,textarea.span-23,input.span-24,textarea.span-24{border-left-width:1px!important;border-right-width:1px!important;padding-left:5px!important;padding-right:5px!important}input.span-1,textarea.span-1{width:18px!important}input.span-2,textarea.span-2{width:58px!important}input.span-3,textarea.span-3{width:98px!important}input.span-4,textarea.span-4{width:138px!important}input.span-5,textarea.span-5{width:178px!important}input.span-6,textarea.span-6{width:218px!important}input.span-7,textarea.span-7{width:258px!important}input.span-8,textarea.span-8{width:298px!important}input.span-9,textarea.span-9{width:338px!important}input.span-10,textarea.span-10{width:378px!important}input.span-11,textarea.span-11{width:418px!important}input.span-12,textarea.span-12{width:458px!important}input.span-13,textarea.span-13{width:498px!important}input.span-14,textarea.span-14{width:538px!important}input.span-15,textarea.span-15{width:578px!important}input.span-16,textarea.span-16{width:618px!important}input.span-17,textarea.span-17{width:658px!important}input.span-18,textarea.span-18{width:698px!important}input.span-19,textarea.span-19{width:738px!important}input.span-20,textarea.span-20{width:778px!important}input.span-21,textarea.span-21{width:818px!important}input.span-22,textarea.span-22{width:858px!important}input.span-23,textarea.span-23{width:898px!important}input.span-24,textarea.span-24{width:938px!important}.last{margin-right:0;padding-right:0}
.last,div.last{margin-right:0}
.menu-primary-container{z-index:10 !important;}
.menu-secondary-container{z-index:10 !important;}
embed, img, object, video {max-width: 100%;}
.menu-primary-responsive-container, .menu-secondary-responsive-container  {display: none;margin: 10px;}
.menu-primary-responsive, .menu-secondary-responsive  {width: 100%;padding: 5px;border: 1px solid #ddd;}
@media only screen and (max-width: 768px) {
* {-moz-box-sizing: border-box; -webkit-box-sizing: border-box; box-sizing: border-box;}
#outer-wrapper { width: 100%; padding: 0px; margin: 0px; }
#header-wrapper { width: 100%; padding: 10px; margin: 0px; height: auto;}
#header { width: 100%; padding: 10px 0px; margin: 0px; float: none;text-align:center; }
#header2 { width: 100%; padding: 0px; margin: 0px; float: none;text-align:center; }
#header a img {margin:0px auto;padding:0px !important;}
#header2 .widget { float: none;padding:0px !important; }
#content-wrapper { width: 100%; margin: 0px; padding: 10px;background-image: none;}
#main-wrapper { width: 100%; padding: 0px; margin: 0px; float: none;}
#sidebar-wrapper { width: 100%; padding: 0px; margin: 0px; float: none; }
#lsidebar-wrapper { width: 100%; padding: 0px; margin: 0px; float: none; }
#rsidebar-wrapper { width: 100%; padding: 0px; margin: 0px; float: none; }
.menu-primary-container, .menu-secondary-container {float: none;margin-left: 0;margin-right: 0;display: none;}
.menu-primary-responsive-container, .menu-secondary-responsive-container {display: block;}
#header-wrapper .menu-primary-responsive-container, #header-wrapper .menu-primary-responsive-container {margin-left: 0;margin-right: 0;width: 100%; }
#top-social-profiles{float:none;width:100%;display:block;text-align:center;height:auto;}
#topsearch {float:none;margin:25px 10px 0px 10px;padding: 0;}
#topsearch #search {float:none;}
.fp-slider, #fb-root {display: none;}
.footer-widget-box { width: 100%; float: none; padding: 10px; margin: 0px;}
#footer {height:auto;}
#header-wrapper img {height:auto;}
.post-body img {height:auto;}
#copyrights, #credits {width: 100%; padding: 5px 0px; margin: 0px; display: block;float: none;text-align: center;height:auto;} div.span-1,div.span-2,div.span-3,div.span-4,div.span-5,div.span-6,div.span-7,div.span-8,div.span-9,div.span-10,div.span-11,div.span-12,div.span-13,div.span-14,div.span-15,div.span-16,div.span-17,div.span-18,div.span-19,div.span-20,div.span-21,div.span-22,div.span-23,div.span-24{float:none;margin:0px}.span-1,.span-2,.span-3,.span-4,.span-5,.span-6,.span-7,.span-8,.span-9,.span-10,.span-11,.span-12,.span-13,.span-14,.span-15,.span-16,.span-17,.span-18,.span-19,.span-20,.span-21,.span-22,.span-23,.span-24,div.span-24{width:100%;margin:0;padding:0;} .last, div.last{margin:0;padding:0;}
}
@media only screen and (max-width: 480px) {
}
@media only screen and (max-width: 320px) {
.tabs-widget {height: 52px;}
}
</style>
<style type='text/css'>
.post-body img {padding:0px;background:transparent;border:none;}
</style>
<!--[if lte IE 8]> <style type='text/css'> #search{background-position:99% 20%;height:16px;} .fp-slider {height:300px;} .fp-nav {display:none;} </style> <![endif]-->
<script src='http://apis.google.com/js/plusone.js' type='text/javascript'>
{lang: 'en-US'}
</script>
<script type='text/javascript'>
      var _gaq = _gaq || [];
      _gaq.push(['_setAccount', 'UA-44077011-1']);
      _gaq.push(['_trackPageview']);
      (function() {
        var ga = document.createElement('script');
        ga.type = 'text/javascript';
        ga.async = true;
        ga.src = (document.location.protocol == 'https:' ?
                  'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
        var s = document.getElementsByTagName('script')[0];
        s.parentNode.insertBefore(ga, s);
      })();
    </script>
<script type="text/javascript">var a="indexOf",b="&m=1",e="(^|&)m=",f="?",g="?m=1";function h(){var c=window.location.href,d=c.split(f);switch(d.length){case 1:return c+g;case 2:return 0<=d[1].search(e)?null:c+b;default:return null}}var k=navigator.userAgent;if(-1!=k[a]("Mobile")&&-1!=k[a]("WebKit")&&-1==k[a]("iPad")||-1!=k[a]("Opera Mini")||-1!=k[a]("IEMobile")){var l=h();l&&window.location.replace(l)};
</script><script type="text/javascript">
if (window.jstiming) window.jstiming.load.tick('headEnd');
</script></head>
<body>
<div id='body-wrapper'><div id='outer-wrapper'><div id='wrap2'>
<div id='header-wrapper'>
<div class='header section' id='header'><div class='widget Header' id='Header1'>
<div id='header-inner'>
<a href='http://www.unixmantra.com/' style='display: block'>
<img alt='UnixMantra' height='59px; ' id='Header1_headerimg' src='http://3.bp.blogspot.com/-pkEaNa8zKYQ/U3eZCcDQI1I/AAAAAAAABGQ/pp9LSb8l-w0/s364/transparent_text_effect%2B%25283%2529.png' style='display: block;padding-left:15px;padding-top:0px;' width='364px; '/>
</a>
</div>
</div></div>
<div id='header2'>
<div class='menu-primary-container'>
<div class='pagelistmenusblog section' id='pagelistmenusblog'><div class='widget LinkList' id='LinkList7'>
<div class='widget-content'>
<ul class='menus menu-primary' id='pagelistmenusblogul'>
<li><a href='http://unixmantra.com'>Home</a></li>
<li><a href='http://www.unixmantra.com/p/about-us.html'>About</a></li>
<li><a href='http://www.unixmantra.com/p/contact-us.html'>Contact</a></li>
<li><a href='http://www.unixmantra.com/p/archive.html'>Archives</a></li>
<li><a href='http://'>.</a></li>
</ul>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=LinkList&widgetId=LinkList7&action=editWidget&sectionId=pagelistmenusblog' onclick='return _WidgetManager._PopupConfig(document.getElementById("LinkList7"));' target='configLinkList7' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div>
</div></div>
</div>
</div>
<div style='clear:both;'></div>
</div>
<div style='clear:both;'></div>
<div class='span-24'>
<div class='menu-secondary-container'>
<ul class='menus menu-secondary'>
<li><a href='http://www.unixmantra.com/'>Home</a></li>
<li><a href='#'>UNIX</a>
<ul class='children'>
<li><a href='http://www.unixmantra.com/p/unix.html'>UNIX Basics</a></li>
<li><a href='http://www.unixmantra.com/p/aix.html'>AIX</a></li>
<li><a href='http://www.unixmantra.com/search/label/Linux'>Linux</a></li>
</ul>
</li>
<li><a href='http://www.unixmantra.com/p/virtualiation.html'>Virtualisation</a>
</li>
<li><a href='http://www.unixmantra.com/p/hmc.html'>HMC</a>
</li>
<li><a href='http://www.unixmantra.com/p/cluster.html'>Cluster</a></li>
<li><a href='http://www.unixmantra.com/p/shell-perl-scripting.html'>Scripting</a>
</li>
<li><a href='http://www.unixmantra.com/p/backup-storage.html'>Backup-Storage</a></li>
<li><a href='http://www.unixmantra.com/p/tutorials.html'>Tutorials</a></li>
</ul>
</div>
</div>
<div style='clear:both;'></div>
<div id='content-wrapper'>
<div id='crosscol-wrapper' style='text-align:center'>
<div class='crosscol section' id='crosscol'></div>
</div>
<div id='main-wrapper'>
<div class='main section' id='main'><div class='widget Blog' id='Blog1'>
<div class='blog-posts hfeed'>
<!-- google_ad_section_start(name=default) -->

          <div class="date-outer">
        
<h2 class='date-header'><span>Friday, 27 December 2013</span></h2>

          <div class="date-posts">
        
<div class='post-outer'>
<div class='wrapfullpost'>
<div class='post hentry' itemprop='blogPost' itemscope='itemscope' itemtype='http://schema.org/BlogPosting'>
<meta content='http://4.bp.blogspot.com/-VrzkScmOMF0/Ur-chEQTmoI/AAAAAAAAAno/bTRNZSJvbSo/s400/xargs-all-in-one.png' itemprop='image'/>
<a name='4168024984553371945'></a>
<div class='breadcrumb-bwrap'>
<a href='http://www.unixmantra.com/'>Home</a> &#187;
<a href='http://www.unixmantra.com/search/label/AIX' rel='tag'>AIX</a>
 , 
<a href='http://www.unixmantra.com/search/label/HP-UX' rel='tag'>HP-UX</a>
 , 
<a href='http://www.unixmantra.com/search/label/Linux' rel='tag'>Linux</a>
 , 
<a href='http://www.unixmantra.com/search/label/Solaris' rel='tag'>Solaris</a>
 , 
<a href='http://www.unixmantra.com/search/label/Unix' rel='tag'>Unix</a>
 &#187; "xargs" All-IN-One Tutorial Guide
</div>
<h3 class='post-title entry-title' itemprop='name'>
<a href='http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html'>"xargs" All-IN-One Tutorial Guide</a>
</h3>
<div class='post-header-line-1'></div>
<div class='postmeta-primary'>
<span class='meta_author post-author vcard'>By&nbsp;<span class='fn' itemprop='author' itemscope='itemscope' itemtype='http://schema.org/Person'><meta content='https://plus.google.com/102269839895493138708' itemprop='url'/><a class='g-profile' href='https://plus.google.com/102269839895493138708' rel='author' title='author profile'><span itemprop='name'>Iunix Mantra</span></a></span></span><meta content='http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html' itemprop='url'/><span class='meta_date'><a class='timestamp-link' href='http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html' rel='bookmark' title='permanent link'><span class='published updated' itemprop='datePublished' title='2013-12-27T04:19:00-05:00'>04:19</span></a></span><span class='meta_comments'><a href='http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html#comment-form' onclick=''>No comments</a></span>
</div>
<div class='post-body entry-content' id='post-body-4168024984553371945' itemprop='articleBody'>
<div dir="ltr" style="text-align: left;" trbidi="on">
<div style="text-align: justify;">
<h2>
xargs:</h2>
<div class="separator" style="clear: both; text-align: center;">
<a href="http://4.bp.blogspot.com/-VrzkScmOMF0/Ur-chEQTmoI/AAAAAAAAAno/bTRNZSJvbSo/s1600/xargs-all-in-one.png" imageanchor="1" style="margin-left: 1em; margin-right: 1em;"><img border="0" src="http://4.bp.blogspot.com/-VrzkScmOMF0/Ur-chEQTmoI/AAAAAAAAAno/bTRNZSJvbSo/s400/xargs-all-in-one.png" height="296" width="400" /></a></div>
<div>
<br /></div>
</div>
<div style="text-align: justify;">
<b>xargs </b>is a just like "awk" ,"find" &amp; "grep" commands processes the standard input on all unix flavoured operating sysems.</div>
<div style="text-align: justify;">
<br />
Basically "<b>xargs</b>" is used to remove or do some operation on long list of file names which were produced by "<b>find</b>" &amp; "<b>grep</b>" commands.<br />
<br />
Usually many UNIX operating system doesn't accept such a long list of argument.UNIX <b>xargs</b> command divide that list into sub-list with acceptable length and made it work.<br />
<br />
For example I'd like to find out all *.sh file located in 100s of sub-directories and move them to another directory called <b>~/back.scripts</b>. How do I use command line args with xargs to achieve the same?<br />
<br />
as per man page "<b>xargs</b>" is used to execute a command, passing constructed argument list(s). The arguments are typically a long list of filenames (generated by <b>ls</b> or <b>find </b>etc) that are passed to <b>xargs</b> via a pipe. </div>
<h4 style="text-align: left;">
Some features:</h4>
<ul style="text-align: left;">
<li>xargs can execute the command supplying some initial arguments directly, and reading the remaining arguments from standard input (or piped input).</li>
<li>xargs passes arguments to command in several bundles, this allows command to process more arguments than it could normally handle at once.</li>
<li>Arguments in the standard input must be separated by unquoted blank characters, or unescaped blank characters or newline characters.</li>
<li>Characters can be quoted by enclosing them in "double-quotes" (non-double-quote and non-newline chars only).</li>
<li>Characters can be quoted by enclosing them in 'apostrophes' (non-apostrophe and non-newline chars only).</li>
<li>Any unquoted character can be escaped by preceding it with a backslash.</li>
</ul>
<div style="text-align: justify;">
<br />
<b>e.g.</b> file1 file2 "file three" 'file four' file\ five<br />
If command is omitted then the equivalent of <b>/bin/echo</b> is used.<br />
<h2>
&nbsp;Exit Status</h2>
<div class="p" id="xargs__edcfa85233mela">
This command
returns the following exit values:</div>
<table border="0" cellpadding="4" cellspacing="0" class="table" frame="void" rules="none" summary=""><thead align="left" class="thead">
<tr class="row"><th class="entry" id="d491553e577" valign="top" width="8.333333333333332%">Item</th>
<th class="entry" id="d491553e579" valign="top" width="91.66666666666666%">Description</th>
</tr>
</thead>
<tbody class="tbody">
<tr class="row" id="xargs__row-d3e31387"><td class="entry" headers="d491553e577 " valign="top" width="8.333333333333332%"><b class="ph b">0</b></td>
<td class="entry" headers="d491553e579 " valign="top" width="91.66666666666666%">All invocations of the <i class="ph i">Command</i> parameter returned
exit status 0.</td>
</tr>
<tr class="row" id="xargs__row-d3e31396"><td class="entry" headers="d491553e577 " valign="top" width="8.333333333333332%"><b class="ph b">1-125</b></td>
<td class="entry" headers="d491553e579 " valign="top" width="91.66666666666666%">A command line meeting the specified requirements could not
be assembled, one or more of the invocations of the <i class="ph i">Command</i> parameter
returned a non-zero exit status, or some other error occurred.</td>
</tr>
<tr class="row" id="xargs__row-d3e31405"><td class="entry" headers="d491553e577 " valign="top" width="8.333333333333332%"><b class="ph b">126</b></td>
<td class="entry" headers="d491553e579 " valign="top" width="91.66666666666666%"><i class="ph i">Command</i> was found but could not be invoked.</td>
</tr>
<tr class="row" id="xargs__row-d3e31414"><td class="entry" headers="d491553e577 " valign="top" width="8.333333333333332%"><b class="ph b">127</b></td>
<td class="entry" headers="d491553e579 " valign="top" width="91.66666666666666%"><i class="ph i">Command</i> could not be found.</td></tr>
</tbody></table>
</div>
<h4 style="text-align: left;">
Examples</h4>
<div style="text-align: justify;">
Find all the .mp3 files in the music folder and pass to the ls command, -print0 is required if any filenames contain whitespace.:<br />
<div id="com_box">
&nbsp;&nbsp; find ./music -name "*.mp3" -print0 | xargs -0 ls</div>
<br />
Find all files in the work folder, pass to grep and search for profit:<br />
<div id="com_box">
&nbsp;&nbsp; find ./work -print | xargs grep "profit" </div>
</div>
<h4>
{} as the argument list marker</h4>
<div style="text-align: justify;">
{} is the default argument list marker. You need to use {} this with various command which take more than two arguments at a time. For example mv command need to know the file name. The following will find all .bak files in or below the current directory and move them to ~/.old.files directory:</div>
<div style="text-align: justify;">
<br />
<div id="com_box">
$ find . -name "*.sh" -print0 | xargs -0 -I {} mv {} ~/back.scripts</div>
<br />
You can rename {} to something else. In the following example {} is renamed as file. This is more readable as compare to previous example:<br />
<div id="com_box">
$ find . -name "*.sh" -print0 | xargs -0 -I file mv file ~/back.scripts</div>
<br />
Where,<br />
&nbsp;&nbsp;&nbsp; <b>-0</b> If there are blank spaces or characters (including newlines) many commands will not work. This option take cares of file names with blank space.<br />
&nbsp;&nbsp;&nbsp; <b>-I</b> Replace occurrences of replace-str in the initial-arguments with names read from standard input. Also, unquoted blanks do not terminate input items; instead the separator is the newline character.</div>
<h2 style="text-align: left;">
10 Popular&nbsp; "XARGS" Command Examples:</h2>
<h3 style="text-align: left;">
1) With&amp; Without "xargs" observation:</h3>
<div style="text-align: justify;">
&nbsp;in this example of xargs command we will see how output changes with use of xargs command in unix or Linux. Here is the output of find command without xargs first and than with xargs, you can clearly see that multiline output is converted into single line:<br />
<div id="com_box">
um@server#find . -name "*sh*"<br />
./.bash_history<br />
./.bash_profile<br />
./.bash_profile.cf-before-edit<br />
./.cshrc<br />
./.cshrc.cf-before-edit<br />
./.sh_history<br />
./.ssh<br />
./.ssh2<br />
./scripts/aix_sysinfo.ksh<br />
./scripts/chperm_messages.sh<br />
./scripts/linux_sysinfo.ksh<br />
./scripts/solaris_sysinfo_v1.1.ksh<br />
./testlocked.ksh<br />
<br />
um@server# find . -name "*bash*" | xargs<br />
./.bash_history ./.bash_profile ./.bash_profile.cf-before-edit ./.cshrc ./.cshrc.cf-before-edit ./.sh_history ./.ssh ./.ssh2 ./scripts/aix_sysinfo.ksh ./scripts/chperm_messages.sh ./scripts/linux_sysinfo.ksh ./scripts/solaris_sysinfo_v1.1.ksh ./testlocked.ksh</div>
</div>
<h3>
2) Xargs with grep:</h3>
<div style="text-align: justify;">
When you use "xargs" in conjusction with find and grep , the grep will look for the specifig word in&nbsp; each file in the from the stanadard input.<br />
<div id="com_box">
#find . -name "*.sh" | xargs grep "ksh" </div>
<br />
In the above exanmple first find all .sh&nbsp; files from current directory or below and than on each .sh file look for word "ksh".</div>
<h3 style="text-align: left;">
3) Covert muti line output into single line</h3>
<div style="text-align: justify;">
best example of xargs is&nbsp; converting output of one command into one line. For example you can run any command and then combine xargs to convert output into single line. here is an example xargs in unix which does that.<br />
<div id="com_box">
um@server#ls -1 *.sh<br />
linux_sysinfo.sh<br />
aix_sysinfo.sh<br />
audit_script.sh<br />
chperm_messages.sh<br />
<br />
um@system#ls -1 *.sh | xargs<br />
linux_sysinfo.sh aix_sysinfo.sh audit_script.sh chperm_messages.sh</div>
</div>
<h3 style="text-align: left;">
4) To Delete temporary files using xargs &amp; find:</h3>
<div style="text-align: justify;">
Another common example of xargs command in unix is removing temporary files from system.<br />
<div id="com_box">
#find /tmp -name "*.tmp" | xargs rm</div>
<br />
This will remove all .tmp file from /tmp or below directory. xargs in unix is very fast as compared to deleting single file at a time which can also be done by using find command alone<br />
<h3>
5)&nbsp; xargs -0 to handle space in file name</h3>
Above example of xargs command in unix will not work as expected if any of file name contains space or new line on it. To avoid this problem we use find -print0 to produce null separated file name and xargs-0 to handle null separated items. Here is an example of xargs command in unix which can handle file name with spaces and newline:<br />
<div id="com_box">
#find /tmp -name "*.tmp" -print0 | xargs -0 rm</div>
</div>
<h3 style="text-align: left;">
6) Counting number of lines/words/characters in each file using xargs &amp; find:</h3>
<div style="text-align: justify;">
"find"in conjuction with "xargs" and "wc"&nbsp; we can count number of lines/words/characters in each file under a perticaular directory.<br />
<div id="com_box">
um@server#ls -1 *.sh | xargs wc -l <br />
112 linux_sysinfo.sh<br />
85&nbsp; aix_sysinfo.sh<br />
35&nbsp; audit_script.sh<br />
18&nbsp; chperm_messages.sh<br />
250 total</div>
<br />
<b>Note: </b>you can use '-c' &amp; '-w' with wc to obtain number of characters and words repectively.</div>
<h3 style="text-align: left;">
7) xargs and cut command in Unix:</h3>
<div style="text-align: justify;">
&nbsp;Though most of xargs examples in unix will be along with find and grep command but xargs is not just limited to this two it can also be used with any command which generated long list of input for example we can use xargs with cut command in unix. In below example of unix xargs we will xargs example with cut command. for using cut command let's first create a .csv file with some data e.g.<br />
<div id="com_box">
<br />
um@server# cat fruits.txt<br />
Orange,Greenorange<br />
Mango,Redmango<br />
Banana,Pinkbanana<br />
<br />
Now we will display name of actual fruit from first column using xargs command in one line:<br />
<br />
um@server:/etc cut -d, -f1 smartphones.csv | sort | xargs<br />
Orange Mango Banana</div>
</div>
<h3 style="text-align: left;">
8)To insert file names into the middle of command lines, type:</h3>
<div id="com_box" style="text-align: justify;">
um@server#ls | xargs&nbsp; -t&nbsp; -I&nbsp; {} mv {} {}.old<br />
<br />
This command sequence renames all files in the current directory by adding .old to the end of each name. The -I flag tells the xargs command to insert each line of the ls directory listing where {} (braces) appear. If the current directory contains the files chap1, chap2, and chap3, this constructs the following commands:<br />
<br />
#mv chap1 chap1.old<br />
#mv chap2 chap2.old<br />
#mv chap3 chap3.old</div>
<h3 style="text-align: left;">
9) To run a command on files that you select individually, type:</h3>
<div id="com_box" style="text-align: justify;">
um@server# ls | xargs&nbsp; -p&nbsp; -n&nbsp; 1 ar r lib.a<br />
<br />
This command sequence allows you to select files to add to the lib.a library. The -p flag tells the xargs command to display each ar command it constructs and to ask if you want to run it. Type y to run the command. Press the any other key if you do not want to run the command.<br />
<br />
Something similar to the following displays:<br />
<br />
ar r lib.a chap1 ?...<br />
ar r lib.a chap2 ?...<br />
ar r lib.a chap3 ?... </div>
<h3 style="text-align: left;">
10) To construct a command that contains a specific number of arguments and to insert those arguments into the middle of a command line, type:</h3>
<div id="com_box" style="text-align: justify;">
um@server# ls | xargs -n6 | xargs -I{} echo {} - some files in the directory<br />
<br />
If the current directory contains files chap1 through chap10, the output constructed will be the following:<br />
chap1 chap2 chap3 chap4 chap5 chap6 - some files in the directory<br />
chap7 chap8 chap9 chap10 - some file in the directory</div>
</div>
<div style='clear: both;'></div>
</div>
<div class='post-iconspbt'>
<span class='post-icons' style='padding-right:10px;'>
</span>
<div class='post-share-buttons goog-inline-block'>
</div>
<div style='clear: both;'></div>
</div>
<div class='post-location post-locationpbt'>
</div>
<div class='related-postbwrap' id='bpostrelated-post'></div>
<div style='clear: both;'></div>
<script type='text/javascript'>
var labelArray = [
          "AIX",

          "HP-UX",

          "Linux",

          "Solaris",

          "Unix"
];
var relatedPostConfig = {
      homePage: "http://www.unixmantra.com/",
      widgetTitle: "<h4>Related Posts:</h4>",
      numbrelatedPosts: 5,
      summaryLength: 150,
      titleLength: "auto",
      thumbnailSize: 100,
      noImage: "http://3.bp.blogspot.com/-OOwUO9G9QhU/VJI9_UXpVxI/AAAAAAAABO4/M8A1mtL8T9M/s1600/no-img-200.png",
      containerId: "bpostrelated-post",
      newTabLink: false,
      moreText: "Read More",
      widgetStyle: 3,
      callBack: function() {}
};
</script>
<script type='text/javascript'>
//<![CDATA[

/*! Related Post Widget for Blogger by Taufik Nurrohman => http://gplus.to/tovic */
var randomRelatedIndex,showRelatedPost;(function(n,m,k){var d={widgetTitle:"<h4>Artikel Terkait:</h4>",widgetStyle:1,homePage:"http://www.dte.web.id",numbrelatedPosts:7,summaryLength:370,titleLength:"auto",thumbnailSize:72,noImage:"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeAAAAA3NCSVQICAjb4U/gAAAADElEQVQImWOor68HAAL+AX7vOF2TAAAAAElFTkSuQmCC",containerId:"related-post",newTabLink:false,moreText:"Baca Selengkapnya",callBack:function(){}};for(var f in relatedPostConfig){d[f]=(relatedPostConfig[f]=="undefined")?d[f]:relatedPostConfig[f]}var j=function(a){var b=m.createElement("script");b.type="text/javascript";b.src=a;k.appendChild(b)},o=function(b,a){return Math.floor(Math.random()*(a-b+1))+b},l=function(a){var p=a.length,c,b;if(p===0){return false}while(--p){c=Math.floor(Math.random()*(p+1));b=a[p];a[p]=a[c];a[c]=b}return a},e=(typeof labelArray=="object"&&labelArray.length>0)?"/-/"+l(labelArray)[0]:"",h=function(b){var c=b.feed.openSearch$totalResults.$t-d.numbrelatedPosts,a=o(1,(c>0?c:1));j(d.homePage.replace(/\/$/,"")+"/feeds/posts/summary"+e+"?alt=json-in-script&orderby=updated&start-index="+a+"&max-results="+d.numbrelatedPosts+"&callback=showRelatedPost")},g=function(z){var s=document.getElementById(d.containerId),x=l(z.feed.entry),A=d.widgetStyle,c=d.widgetTitle+'<ul class="related-post-style-'+A+'">',b=d.newTabLink?' target="_blank"':"",y='<span style="display:block;clear:both;"></span>',v,t,w,r,u;if(!s){return}for(var q=0;q<d.numbrelatedPosts;q++){if(q==x.length){break}t=x[q].title.$t;w=(d.titleLength!=="auto"&&d.titleLength<t.length)?t.substring(0,d.titleLength)+"&hellip;":t;r=("media$thumbnail" in x[q]&&d.thumbnailSize!==false)?x[q].media$thumbnail.url.replace(/\/s[0-9]+(\-c)?/,"/s"+d.thumbnailSize+"-c"):d.noImage;u=("summary" in x[q]&&d.summaryLength>0)?x[q].summary.$t.replace(/<br ?\/?>/g," ").replace(/<.*?>/g,"").replace(/[<>]/g,"").substring(0,d.summaryLength)+"&hellip;":"";for(var p=0,a=x[q].link.length;p<a;p++){v=(x[q].link[p].rel=="alternate")?x[q].link[p].href:"#"}if(A==2){c+='<li><img alt="" class="related-post-item-thumbnail" src="'+r+'" width="'+d.thumbnailSize+'" height="'+d.thumbnailSize+'"><a class="related-post-item-title" title="'+t+'" href="'+v+'"'+b+">"+w+'</a><span class="related-post-item-summary"><span class="related-post-item-summary-text">'+u+'</span> <a href="'+v+'" class="related-post-item-more"'+b+">"+d.moreText+"</a></span>"+y+"</li>"}else{if(A==3||A==4){c+='<li class="related-post-item" tabindex="0"><a class="related-post-item-title" href="'+v+'"'+b+'><img alt="" class="related-post-item-thumbnail" src="'+r+'" width="'+d.thumbnailSize+'" height="'+d.thumbnailSize+'"></a><div class="related-post-item-tooltip"><a class="related-post-item-title" title="'+t+'" href="'+v+'"'+b+">"+w+"</a></div>"+y+"</li>"}else{if(A==5){c+='<li class="related-post-item" tabindex="0"><a class="related-post-item-wrapper" href="'+v+'" title="'+t+'"'+b+'><img alt="" class="related-post-item-thumbnail" src="'+r+'" width="'+d.thumbnailSize+'" height="'+d.thumbnailSize+'"><span class="related-post-item-tooltip">'+w+"</span></a>"+y+"</li>"}else{if(A==6){c+='<li><a class="related-post-item-title" title="'+t+'" href="'+v+'"'+b+">"+w+'</a><div class="related-post-item-tooltip"><img alt="" class="related-post-item-thumbnail" src="'+r+'" width="'+d.thumbnailSize+'" height="'+d.thumbnailSize+'"><span class="related-post-item-summary"><span class="related-post-item-summary-text">'+u+"</span></span>"+y+"</div></li>"}else{c+='<li><a title="'+t+'" href="'+v+'"'+b+">"+w+"</a></li>"}}}}}s.innerHTML=c+="</ul>"+y;d.callBack()};randomRelatedIndex=h;showRelatedPost=g;j(d.homePage.replace(/\/$/,"")+"/feeds/posts/summary"+e+"?alt=json-in-script&orderby=updated&max-results=0&callback=randomRelatedIndex")})(window,document,document.getElementsByTagName("head")[0]);

//]]>
</script>
<div class='post-footer'>
<div class='post-footer-line post-footer-line-1'></div>
<div class='post-footer-line post-footer-line-2'></div>
<div class='post-footer-line post-footer-line-3'></div></div>
</div>
</div>
<div class='blog-pager' id='blog-pager'>
<span id='blog-pager-newer-link'>
<a class='blog-pager-newer-link' href='http://www.unixmantra.com/2013/12/practical-guide-to-aix-volume-group-management.html' id='Blog1_blog-pager-newer-link' title='Newer Post'>&larr;&nbsp;Newer Post</a>
</span>
<span id='blog-pager-older-link'>
<a class='blog-pager-older-link' href='http://www.unixmantra.com/2013/12/practical-guide-to-aix-paging-space-management.html' id='Blog1_blog-pager-older-link' title='Older Post'>Older Post&nbsp;&rarr;</a>
</span>
<a class='home-link' href='http://www.unixmantra.com/'>Home</a>
</div>
<div class='clear'></div>
<div class='comments' id='comments'>
<a name='comments'></a>
<h4>
0
blogger-disqus:
        
</h4>
<div id='Blog1_comments-block-wrapper'>
<dl class='avatar-comment-indent' id='comments-block'>
</dl>
</div>
<p class='comment-footer'>
<div class='comment-form'>
<a name='comment-form'></a>
<h4 id='comment-post-message'>Post a Comment</h4>
<p>
</p>
<a href='https://www.blogger.com/comment-iframe.g?blogID=8572598522221159569&postID=4168024984553371945' id='comment-editor-src'></a>
<iframe allowtransparency='true' class='blogger-iframe-colorize blogger-comment-from-post' frameborder='0' height='410' id='comment-editor' name='comment-editor' src='' width='100%'></iframe>
<script type="text/javascript" src="https://www.blogger.com/static/v1/jsbin/3369861379-comment_from_post_iframe.js"></script>
<script type='text/javascript'>
      BLOG_CMT_createIframe('https://www.blogger.com/rpc_relay.html', '18419259754738605805');
    </script>
</div>
</p>
<div id='backlinks-container'>
<div id='Blog1_backlinks-container'>
</div>
</div>
</div>
</div>

        </div></div>
      
<!-- google_ad_section_end -->
</div>
<script type="text/javascript">window.___gcfg = {'lang': 'en_GB'};</script>
</div></div>
</div>
<div id='rsidebar-wrapper'>
<div class='widget-container'>
<div class='social-profiles-widget'>
<h3 class='widgettitle'>Social Profiles</h3>
<a href='http://twitter.com/unixmantra' target='_blank'><img alt='Twitter' src='http://1.bp.blogspot.com/-tLOdCdFwBXw/U8iX_exEUqI/AAAAAAAALpY/7BcWFjPggaA/s1600/twitter.png' title='Twitter'/></a><a href='http://facebook.com/unixmantra' target='_blank'><img alt='Facebook' src='http://1.bp.blogspot.com/-nv46iRQK3X4/U8iX4shPe9I/AAAAAAAALnM/nYuMF8B-Mvo/s1600/facebook.png' title='Facebook'/></a><a href='https://plus.google.com/+Unixmantra/posts' target='_blank'><img alt='Google Plus' src='http://1.bp.blogspot.com/-zHK_1k86vWY/U8iX5rrgKmI/AAAAAAAALng/p2zFsZEofAw/s1600/google.png' title='Google Plus'/></a><a href='#' target='_blank'><img alt='Instagram' src='http://2.bp.blogspot.com/-9qHtPdtA-gE/U8iX531XNwI/AAAAAAAALnk/6wD_u6wtZhs/s1600/instagram.png' title='Instagram'/></a><a href='http://www.unixmantra.com/feeds/posts/default' target='_blank'><img alt='RSS Feed' src='http://4.bp.blogspot.com/-gaY23lvGKgY/U8iX74xUO8I/AAAAAAAALoM/wjdRu1yErfY/s1600/rss.png' title='RSS Feed'/></a><a href='mailto:admin@unixmantra.com' target='_blank'><img alt='Email' src='http://3.bp.blogspot.com/-V6TDR3wxbxA/U8iX6Z0eCAI/AAAAAAAALns/DKqXbbxJrMY/s1600/mail.png' title='Email'/></a>
</div>
</div>
<div style='clear:both;'></div>
<!--<div class='widget-container'> <div id='search' title='Type and hit enter'> <form action='/search' id='searchform' method='get'> <input id='s' name='q' onblur='if (this.value == &quot;&quot;) {this.value = &quot;Search&quot;;}' onfocus='if (this.value == &quot;Search&quot;) {this.value = &quot;&quot;;}' type='text' value='Search'/> </form> </div> </div> -->
<div style='clear:both;'></div>
<div class='sidebar section' id='rsidebartop'><div class='widget HTML' id='HTML4'>
<div class='widget-content'>
<div><script>
  (function() {
    var cx = '004509577317318685603:fj2drbzmk7g';
    var gcse = document.createElement('script');
    gcse.type = 'text/javascript';
    gcse.async = true;
    gcse.src = (document.location.protocol == 'https:' ? 'https:' : 'http:') +
        '//www.google.com/cse/cse.js?cx=' + cx;
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(gcse, s);
  })();
</script>
<gcse:searchbox-only></gcse:searchbox-only></div>
</div>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=HTML&widgetId=HTML4&action=editWidget&sectionId=rsidebartop' onclick='return _WidgetManager._PopupConfig(document.getElementById("HTML4"));' target='configHTML4' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div><div class='widget HTML' id='HTML2'>
<div class='widget-content'>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script> 
$('.comment-content a[rel$=nofollow]').replaceWith(function(){return ($(this).text());}); 
</script>
</div>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=HTML&widgetId=HTML2&action=editWidget&sectionId=rsidebartop' onclick='return _WidgetManager._PopupConfig(document.getElementById("HTML2"));' target='configHTML2' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div></div>
<div style='clear:both;'></div>
<div class='widget-container'>
<div class='tabviewsection'>
<script type='text/javascript'>
            jQuery(document).ready(function($){
                $(".tabs-widget-content-widget-themater_tabs-1432447472-id").hide();
            	$("ul.tabs-widget-widget-themater_tabs-1432447472-id li:first a").addClass("tabs-widget-current").show();
            	$(".tabs-widget-content-widget-themater_tabs-1432447472-id:first").show();
       
            	$("ul.tabs-widget-widget-themater_tabs-1432447472-id li a").click(function() {
            		$("ul.tabs-widget-widget-themater_tabs-1432447472-id li a").removeClass("tabs-widget-current a"); 
            		$(this).addClass("tabs-widget-current"); 
            		$(".tabs-widget-content-widget-themater_tabs-1432447472-id").hide(); 
            	    var activeTab = $(this).attr("href"); 
            	    $(activeTab).fadeIn();
            		return false;
            	});
            });
        </script>
<ul class='tabs-widget tabs-widget-widget-themater_tabs-1432447472-id'>
<li><a href='#widget-themater_tabs-1432447472-id1'>Popular</a></li>
<li><a href='#widget-themater_tabs-1432447472-id2'>Tags</a></li>
<li><a href='#widget-themater_tabs-1432447472-id3'>Blog Archives</a></li>
</ul>
<div class='tabs-widget-content tabs-widget-content-widget-themater_tabs-1432447472-id' id='widget-themater_tabs-1432447472-id1'>
<div class='sidebar section' id='sidebartab1'><div class='widget PopularPosts' id='PopularPosts1'>
<div class='widget-content popular-posts'>
<ul>
<li>
<a href='http://www.unixmantra.com/2013/04/putty-connection-manager-tabbed-putty.html'>PuTTY Connection Manager-Tabbed PuTTY</a>
</li>
<li>
<a href='http://www.unixmantra.com/2014/04/unix-linux-mail-command-tutorial.html'>Unix /Linux Mail Command  Tutorial with Examples</a>
</li>
<li>
<a href='http://www.unixmantra.com/2013/04/aix-powerha-hacmp-commands.html'>AIX PowerHA (HACMP) Commands</a>
</li>
<li>
<a href='http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html'>"xargs" All-IN-One Tutorial Guide</a>
</li>
<li>
<a href='http://www.unixmantra.com/2013/06/resource-limits-on-unix-systems-ulimit.html'>Resource limits on UNIX systems (ulimit)</a>
</li>
<li>
<a href='http://www.unixmantra.com/2014/01/practical-guide-to-aix-logical-volume-management.html'>Practical Guide to AIX  "Logical Volume (LV)" Management</a>
</li>
<li>
<a href='http://www.unixmantra.com/2013/07/PuttyCM-alternatives.html'>PuTTYCM (PuTTY Connection Manager) alternatives</a>
</li>
<li>
<a href='http://www.unixmantra.com/2013/04/how-to-finddisplay-your-mac-address.html'>How to find/display your MAC Address: Unix/Linux/Windows/Mac</a>
</li>
<li>
<a href='http://www.unixmantra.com/2014/07/install-snmp-service-on-rhel-or-centos.html'>Install SNMP Service on RHEL or CentOS</a>
</li>
<li>
<a href='http://www.unixmantra.com/2013/04/aix-user-commands.html'>AIX User commands</a>
</li>
</ul>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=PopularPosts&widgetId=PopularPosts1&action=editWidget&sectionId=sidebartab1' onclick='return _WidgetManager._PopupConfig(document.getElementById("PopularPosts1"));' target='configPopularPosts1' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div>
</div>
</div>
</div>
<div class='tabs-widget-content tabs-widget-content-widget-themater_tabs-1432447472-id' id='widget-themater_tabs-1432447472-id2'>
<div class='sidebar section' id='sidebartab2'><div class='widget Label' id='Label3'>
<div class='widget-content cloud-label-widget-content'>
<span class='label-size label-size-5'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/AIX'>AIX</a>
<span class='label-count' dir='ltr'>(314)</span>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/AIX%20-%20Tips'>AIX - Tips</a>
<span class='label-count' dir='ltr'>(13)</span>
</span>
<span class='label-size label-size-2'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Backup'>Backup</a>
<span class='label-count' dir='ltr'>(7)</span>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/CentOS'>CentOS</a>
<span class='label-count' dir='ltr'>(2)</span>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Cluster'>Cluster</a>
<span class='label-count' dir='ltr'>(10)</span>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Database'>Database</a>
<span class='label-count' dir='ltr'>(2)</span>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/ESX'>ESX</a>
<span class='label-count' dir='ltr'>(1)</span>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/GPFS'>GPFS</a>
<span class='label-count' dir='ltr'>(10)</span>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/HMC'>HMC</a>
<span class='label-count' dir='ltr'>(27)</span>
</span>
<span class='label-size label-size-2'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/How-Tos'>How-Tos</a>
<span class='label-count' dir='ltr'>(5)</span>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/HP-UX'>HP-UX</a>
<span class='label-count' dir='ltr'>(28)</span>
</span>
<span class='label-size label-size-2'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Installation'>Installation</a>
<span class='label-count' dir='ltr'>(6)</span>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/ITM'>ITM</a>
<span class='label-count' dir='ltr'>(1)</span>
</span>
<span class='label-size label-size-4'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Linux'>Linux</a>
<span class='label-count' dir='ltr'>(86)</span>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/LVM'>LVM</a>
<span class='label-count' dir='ltr'>(15)</span>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Networking'>Networking</a>
<span class='label-count' dir='ltr'>(10)</span>
</span>
<span class='label-size label-size-2'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/NIM'>NIM</a>
<span class='label-count' dir='ltr'>(3)</span>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Others'>Others</a>
<span class='label-count' dir='ltr'>(2)</span>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Performance'>Performance</a>
<span class='label-count' dir='ltr'>(14)</span>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Perl'>Perl</a>
<span class='label-count' dir='ltr'>(2)</span>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/RHEL'>RHEL</a>
<span class='label-count' dir='ltr'>(2)</span>
</span>
<span class='label-size label-size-4'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Shell%20Scripting'>Shell Scripting</a>
<span class='label-count' dir='ltr'>(39)</span>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Solaris'>Solaris</a>
<span class='label-count' dir='ltr'>(29)</span>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Storage'>Storage</a>
<span class='label-count' dir='ltr'>(12)</span>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Tools'>Tools</a>
<span class='label-count' dir='ltr'>(1)</span>
</span>
<span class='label-size label-size-4'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Unix'>Unix</a>
<span class='label-count' dir='ltr'>(90)</span>
</span>
<span class='label-size label-size-4'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Virtualization'>Virtualization</a>
<span class='label-count' dir='ltr'>(62)</span>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/VMware'>VMware</a>
<span class='label-count' dir='ltr'>(1)</span>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Wintools'>Wintools</a>
<span class='label-count' dir='ltr'>(1)</span>
</span>
<span class='label-size label-size-2'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/WPAR'>WPAR</a>
<span class='label-count' dir='ltr'>(4)</span>
</span>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=Label&widgetId=Label3&action=editWidget&sectionId=sidebartab2' onclick='return _WidgetManager._PopupConfig(document.getElementById("Label3"));' target='configLabel3' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div>
</div></div>
</div>
<div class='tabs-widget-content tabs-widget-content-widget-themater_tabs-1432447472-id' id='widget-themater_tabs-1432447472-id3'>
<div class='sidebar section' id='sidebartab3'><div class='widget BlogArchive' id='BlogArchive2'>
<div class='widget-content'>
<div id='ArchiveList'>
<div id='BlogArchive2_ArchiveList'>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/search?updated-min=2015-01-01T00:00:00-05:00&amp;updated-max=2016-01-01T00:00:00-05:00&amp;max-results=6'>2015</a>
<span class='post-count' dir='ltr'>(6)</span>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2015_05_01_archive.html'>May</a>
<span class='post-count' dir='ltr'>(2)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2015_04_01_archive.html'>April</a>
<span class='post-count' dir='ltr'>(1)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2015_01_01_archive.html'>January</a>
<span class='post-count' dir='ltr'>(3)</span>
</li>
</ul>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/search?updated-min=2014-01-01T00:00:00-05:00&amp;updated-max=2015-01-01T00:00:00-05:00&amp;max-results=50'>2014</a>
<span class='post-count' dir='ltr'>(50)</span>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2014_12_01_archive.html'>December</a>
<span class='post-count' dir='ltr'>(2)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2014_11_01_archive.html'>November</a>
<span class='post-count' dir='ltr'>(1)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2014_10_01_archive.html'>October</a>
<span class='post-count' dir='ltr'>(3)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2014_09_01_archive.html'>September</a>
<span class='post-count' dir='ltr'>(2)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2014_07_01_archive.html'>July</a>
<span class='post-count' dir='ltr'>(5)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2014_06_01_archive.html'>June</a>
<span class='post-count' dir='ltr'>(4)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2014_05_01_archive.html'>May</a>
<span class='post-count' dir='ltr'>(4)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2014_04_01_archive.html'>April</a>
<span class='post-count' dir='ltr'>(4)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2014_03_01_archive.html'>March</a>
<span class='post-count' dir='ltr'>(9)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2014_02_01_archive.html'>February</a>
<span class='post-count' dir='ltr'>(10)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2014_01_01_archive.html'>January</a>
<span class='post-count' dir='ltr'>(6)</span>
</li>
</ul>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate expanded'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy toggle-open'>&#9660;&#160;</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/search?updated-min=2013-01-01T00:00:00-05:00&amp;updated-max=2014-01-01T00:00:00-05:00&amp;max-results=50'>2013</a>
<span class='post-count' dir='ltr'>(450)</span>
<ul class='hierarchy'>
<li class='archivedate expanded'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy toggle-open'>&#9660;&#160;</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2013_12_01_archive.html'>December</a>
<span class='post-count' dir='ltr'>(6)</span>
<ul class='posts'>
<li><a href='http://www.unixmantra.com/2013/12/practical-guide-to-aix-volume-group-management.html'>Practical Guide to AIX &quot;Volume Group Management&quot;</a></li>
<li><a href='http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html'>&quot;xargs&quot; All-IN-One Tutorial Guide</a></li>
<li><a href='http://www.unixmantra.com/2013/12/practical-guide-to-aix-paging-space-management.html'>Practical Guide To AIX &quot;Paging Space Management&quot;</a></li>
<li><a href='http://www.unixmantra.com/2013/12/guide-to-aix-device-management.html'>Practical Guide to  AIX &quot;Device Management&quot;</a></li>
<li><a href='http://www.unixmantra.com/2013/12/installation-methods-available-for-aix.html'>Installation methods available for AIX</a></li>
<li><a href='http://www.unixmantra.com/2013/12/ibm-tivoli-monitoring-itm-6x-product-codes.html'>IBM Tivoli Monitoring ITM 6.X Product Codes</a></li>
</ul>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2013_11_01_archive.html'>November</a>
<span class='post-count' dir='ltr'>(3)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2013_10_01_archive.html'>October</a>
<span class='post-count' dir='ltr'>(6)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2013_09_01_archive.html'>September</a>
<span class='post-count' dir='ltr'>(15)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2013_08_01_archive.html'>August</a>
<span class='post-count' dir='ltr'>(27)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2013_07_01_archive.html'>July</a>
<span class='post-count' dir='ltr'>(45)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2013_06_01_archive.html'>June</a>
<span class='post-count' dir='ltr'>(22)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2013_05_01_archive.html'>May</a>
<span class='post-count' dir='ltr'>(56)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2013_04_01_archive.html'>April</a>
<span class='post-count' dir='ltr'>(246)</span>
</li>
</ul>
<ul class='hierarchy'>
<li class='archivedate collapsed'>
<a class='toggle' href='javascript:void(0)'>
<span class='zippy'>

          &#9658;&#160;
        
</span>
</a>
<a class='post-count-link' href='http://www.unixmantra.com/2013_03_01_archive.html'>March</a>
<span class='post-count' dir='ltr'>(24)</span>
</li>
</ul>
</li>
</ul>
</div>
</div>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=BlogArchive&widgetId=BlogArchive2&action=editWidget&sectionId=sidebartab3' onclick='return _WidgetManager._PopupConfig(document.getElementById("BlogArchive2"));' target='configBlogArchive2' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div>
</div></div>
</div>
</div>
</div>
<div style='height:5px;clear:both;'></div>
<div class='sidebar section' id='sidebarright'>
<div class='widget HTML' id='HTML3'>
<h2 class='title'>Reach US</h2>
<div class='widget-content'>
<style type="text/css"> 
#wcsub-box
{
box-shadow:1px 1px 4px  #dcdcdc;
-moz-box-box-shadow:1px 1px 4px  #dcdcdc;
-web-kit-box-shadow:1px 1px 4px  #dcdcdc;
-goog-ms-box-shadow:1px 1px 4px  #dcdcdc;
margin-bottom:70px;
height:264px;
}
#wc-socico
{
height:33px;
border-bottom:1px solid #dcdcdc;
border-left:1px solid #dcdcdc;
border-right:1px solid #dcdcdc;
padding:2px;
background:#ffffff;
}
#wc-socicoimg
{
height:28px;
width:28px;
}
#wc-socico table
{
border:none;
}
#wc-rscount
{
margin-top:2px;
margin-right:-25px;
}

#wcsub-box .wcsub-fblike { border-bottom: 1px solid #dcdcdc; border-left: 1px solid #dcdcdc; border-right: 1px solid #dcdcdc; padding: 5px; background:#fff;}
  
    #wcsub-box .twitter-follow { background: #ffffff; border-left: 1px solid #dcdcdc;border-right: 1px solid #dcdcdc; padding:5px 11px;}
    #wcsub-box .wcsub-email {border: 1px solid #dcdcdc; background: #f8f8f8; padding:11px;}
        #wcsub-box .wcsub-email h4{color: #444;font-family: Arial;font-size: 12px; margin: 0 0 10px;}
        #wcsub-box .wcsub-email .txt,#wcsub-box .wcsub-email .txt:focus{background:#fff; float:left; color:#777777; border:1px solid #dcdcdc; border-radius: 3px; padding: 7px 10px 8px; width: 140px;}
        #wcsub-box .wcsub-email .wcsub-button,#wcsub-box .wcsub-email .wcsub-button:focus{background:#222222; border:1px solid #222222; color:#fff; border-radius: 3px; float: right; font-size: 12px; font-weight: bold; padding:7px 3px; }
            #wcsub-box .wcsub-email 
input, textarea {
font-family: Georgia, "Times New Roman", Times; font-size: 1em;}
</style>

<div id="wcsub-box">
<div class="wcsub-email">
<h4>Get FREE updates on your <a href="http://feedburner.google.com/fb/a/mailverify?uri=unixmantra" target="_blank" style="color:#3b5998;">Email</a> | <a href="http://feeds.feedburner.com/unixmantra" target="_blank" style="color:orange;">RSS</a></h4>
<form onsubmit="window.open('http://feedburner.google.com/fb/a/mailverify?uri=unixmantra', 'popupwindow', 
'scrollbars=yes,width=700px,height=700px');return true" target="popupwindow" method="post" action="http://feedburner.google.com/fb/a/mailverify">
<input name="email" onblur="if (this.value == '') {this.value = 'Enter your email address';}" onfocus="if (this.value == 'Enter your email address')
{this.value = '';}" value="Enter your email address" class="txt" />
<input type="hidden" name="uri" value="unixmantra" />
<input type="hidden" value="en_US" name="loc" />
<input type="submit" value="Subscribe" class="wcsub-button" />
<div style="clear:both;"></div>
</form>
    </div>


<div id="wc-socico">
<table border="0" cellspacing="0" cellpadding="0" width="298">
<tbody>
<tr>
<td valign="top" ><a href='http://feeds.feedburner.com/unixmantra' target='_blank' rel=nofollow' ><img id="wc-socicoimg" src="http://3.bp.blogspot.com/-KjMedajdI2w/UTtUCEg5_zI/AAAAAAAABcQ/K3qUhvOTNrA/s1600/feed.png" alt="Subcribe to our RSS feeds" /></a></td>

<td valign="top" ><a href='http://www.facebook.com/unixmantra' target='_blank' rel='nofollow'><img id="wc-socicoimg" src="http://2.bp.blogspot.com/-7_3aMhrvLq4/UTtUB9H5ZyI/AAAAAAAABcM/JjZGcP7r3_I/s1600/fbb.png" alt="Join Us on Facebook" /></a></td>

<td valign="top" ><a href='https://plus.google.com/+unixmantra' target='_blank' rel='nofollow'><img src="http://4.bp.blogspot.com/-vnYX9pKHZCU/UTtUCWa3-HI/AAAAAAAABcU/Xi7l4YF136U/s1600/gpp.png" alt="Add to Circles" id="wc-socicoimg" /></a></td>

<td valign="top" ><a href='https://twitter.com/unixmantra' target='_blank' rel='nofollow'><img id="wc-socicoimg" src="http://2.bp.blogspot.com/-VXfOkCT43uI/UTtUEItlzyI/AAAAAAAABck/cvROEjW1Vx8/s1600/tww.png" alt="Follow us on Twitter" /></a></td>

<td valign="top" ><p id="wc-rscount"><a href="http://feeds.feedburner.com/unixmantra" rel="nofollow"><img  src="http://feeds.feedburner.com/~fc/unixmantra?bg=222222&fg=ffffff&anim=0" height="26" width="88" style="border:0" alt="" /></a></p></td>
</tr></tbody></table>
</div>


    <div class="wcsub-fblike">
   <iframe src="//www.facebook.com/plugins/like.php? href=https://www.facebook.com/unixmantra?fref=ts &send=false&layout=button_count&width=80&show_faces=false&action=like&colorscheme=light&font&height=21" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:80px; height:21px;" allowtransparency="true"></iframe><a href=" https://www.facebook.com/unixmantra" target="_blank" rel="nofollow" style="color: #3B5998; font-family: arial; font-size: 18px; font-weight: bold; line-height: 20px;"> Like us on Facebook </a><div class="clear"></div>
    </div>

<div class="twitter-follow">
  <a href="https://twitter.com/unixmantra" class="twitter-follow-button">Follow @unixmantra</a>
</div>

<div class="wcgplus">
    <div class="g-plus" data-href="https://plus.google.com/+unixmantra" data-width="290" data-height="131" data-theme="light"></div>
</div>
    </div>
</div>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=HTML&widgetId=HTML3&action=editWidget&sectionId=sidebarright' onclick='return _WidgetManager._PopupConfig(document.getElementById("HTML3"));' target='configHTML3' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div><div class='widget HTML' id='HTML1'>
<div class='widget-content'>
<div style=" margin-right: 5cm;">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script type="text/javascript">
var scrolltotop={

    //startline: Integer. Number of pixels from top of doc scrollbar is scrolled before showing control

    //scrollto: Keyword (Integer, or "Scroll_to_Element_ID"). How far to scroll document up when control is clicked on (0=top).

    setting: {startline:100, scrollto: 0, scrollduration:1000, fadeduration:[500, 100]},

    controlHTML: '<img src="http://i1155.photobucket.com/albums/p559/scrolltotop/arrow23.png" />', //HTML for control, which is auto wrapped in DIV w/ ID="topcontrol"

    controlattrs: {offsetx:5, offsety:5}, //offset of control relative to right/ bottom of window corner

    anchorkeyword: '#top', //Enter href value of HTML anchors on the page that should also act as "Scroll Up" links

 state: {isvisible:false, shouldvisible:false},


    scrollup:function(){

        if (!this.cssfixedsupport) //if control is positioned using JavaScript

            this.$control.css({opacity:0}) //hide control immediately after clicking it

        var dest=isNaN(this.setting.scrollto)? this.setting.scrollto : parseInt(this.setting.scrollto)

        if (typeof dest=="string" && jQuery('#'+dest).length==1) //check element set by string exists

            dest=jQuery('#'+dest).offset().top

        else

            dest=0

        this.$body.animate({scrollTop: dest}, this.setting.scrollduration);

    },


    keepfixed:function(){

        var $window=jQuery(window)

        var controlx=$window.scrollLeft() + $window.width() - this.$control.width() - this.controlattrs.offsetx

        var controly=$window.scrollTop() + $window.height() - this.$control.height() - this.controlattrs.offsety

        this.$control.css({left:controlx+'px', top:controly+'px'})

    },


    togglecontrol:function(){



        var scrolltop=jQuery(window).scrollTop()

        if (!this.cssfixedsupport)

            this.keepfixed()

        this.state.shouldvisible=(scrolltop>=this.setting.startline)? true : false

        if (this.state.shouldvisible && !this.state.isvisible){

            this.$control.stop().animate({opacity:1}, this.setting.fadeduration[0])

            this.state.isvisible=true

        }

        else if (this.state.shouldvisible==false && this.state.isvisible){

            this.$control.stop().animate({opacity:0}, this.setting.fadeduration[1])

            this.state.isvisible=false

        }
    },
   
    init:function(){
        jQuery(document).ready(function($){
            var mainobj=scrolltotop
            var iebrws=document.all
            mainobj.cssfixedsupport=!iebrws || iebrws && document.compatMode=="CSS1Compat" && window.XMLHttpRequest //not IE or IE7+ browsers in standards mode
            mainobj.$body=(window.opera)? (document.compatMode=="CSS1Compat"? $('html') : $('body')) : $('html,body')
            mainobj.$control=$('<div id="topcontrol">'+mainobj.controlHTML+'</div>')
                .css({position:mainobj.cssfixedsupport? 'fixed' : 'absolute', bottom:mainobj.controlattrs.offsety, right:mainobj.controlattrs.offsetx, opacity:0, cursor:'pointer'})
                .attr({title:'Scroll to Top'})
                .click(function(){mainobj.scrollup(); return false})
                .appendTo('body')
            if (document.all && !window.XMLHttpRequest && mainobj.$control.text()!='') //loose check for IE6 and below, plus whether control contains any text
                mainobj.$control.css({width:mainobj.$control.width()}) //IE6- seems to require an explicit width on a DIV containing text
            mainobj.togglecontrol()

$('a[href="' + mainobj.anchorkeyword +'"]').click(function(){
                mainobj.scrollup()
                return false
            })
            $(window).bind('scroll resize', function(e){
                mainobj.togglecontrol()
            })
        })
    }
}
scrolltotop.init()

</script></div>
</div>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=HTML&widgetId=HTML1&action=editWidget&sectionId=sidebarright' onclick='return _WidgetManager._PopupConfig(document.getElementById("HTML1"));' target='configHTML1' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div></div>
<p></p></div>
<!-- spacer for skins that want sidebar and main to be the same height-->
<div class='clear' style='height:2px;'>&#160;</div>
</div>
<!-- end content-wrapper -->
<div style='clear:both;'></div>
<div id='footer-widgets-container'>
<div class='clearfix' id='footer-widgets'>
<div class='footer-widget-box'>
<ul class='widget-container'>
<li>
<div class='footersec section' id='footersec1'><div class='widget Label' id='Label1'>
<h2>Labels</h2>
<div class='widget-content cloud-label-widget-content'>
<span class='label-size label-size-5'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/AIX'>AIX</a>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/AIX%20-%20Tips'>AIX - Tips</a>
</span>
<span class='label-size label-size-2'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Backup'>Backup</a>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/CentOS'>CentOS</a>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Cluster'>Cluster</a>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Database'>Database</a>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/ESX'>ESX</a>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/GPFS'>GPFS</a>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/HMC'>HMC</a>
</span>
<span class='label-size label-size-2'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/How-Tos'>How-Tos</a>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/HP-UX'>HP-UX</a>
</span>
<span class='label-size label-size-2'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Installation'>Installation</a>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/ITM'>ITM</a>
</span>
<span class='label-size label-size-4'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Linux'>Linux</a>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/LVM'>LVM</a>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Networking'>Networking</a>
</span>
<span class='label-size label-size-2'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/NIM'>NIM</a>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Others'>Others</a>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Performance'>Performance</a>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Perl'>Perl</a>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/RHEL'>RHEL</a>
</span>
<span class='label-size label-size-4'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Shell%20Scripting'>Shell Scripting</a>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Solaris'>Solaris</a>
</span>
<span class='label-size label-size-3'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Storage'>Storage</a>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Tools'>Tools</a>
</span>
<span class='label-size label-size-4'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Unix'>Unix</a>
</span>
<span class='label-size label-size-4'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Virtualization'>Virtualization</a>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/VMware'>VMware</a>
</span>
<span class='label-size label-size-1'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/Wintools'>Wintools</a>
</span>
<span class='label-size label-size-2'>
<a dir='ltr' href='http://www.unixmantra.com/search/label/WPAR'>WPAR</a>
</span>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=Label&widgetId=Label1&action=editWidget&sectionId=footersec1' onclick='return _WidgetManager._PopupConfig(document.getElementById("Label1"));' target='configLabel1' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div>
</div>
</div>
</li>
</ul>
</div>
<div class='footer-widget-box'>
<ul class='widget-container'>
<li>
<div class='footersec section' id='footersec3'><div class='widget PopularPosts' id='PopularPosts2'>
<h2>Popular Posts</h2>
<div class='widget-content popular-posts'>
<ul>
<li>
<a href='http://www.unixmantra.com/2013/04/putty-connection-manager-tabbed-putty.html'>PuTTY Connection Manager-Tabbed PuTTY</a>
</li>
<li>
<a href='http://www.unixmantra.com/2013/07/PuttyCM-alternatives.html'>PuTTYCM (PuTTY Connection Manager) alternatives</a>
</li>
<li>
<a href='http://www.unixmantra.com/2013/06/resource-limits-on-unix-systems-ulimit.html'>Resource limits on UNIX systems (ulimit)</a>
</li>
<li>
<a href='http://www.unixmantra.com/2013/04/aix-powerha-hacmp-commands.html'>AIX PowerHA (HACMP) Commands</a>
</li>
<li>
<a href='http://www.unixmantra.com/2014/04/unix-linux-mail-command-tutorial.html'>Unix /Linux Mail Command  Tutorial with Examples</a>
</li>
</ul>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=PopularPosts&widgetId=PopularPosts2&action=editWidget&sectionId=footersec3' onclick='return _WidgetManager._PopupConfig(document.getElementById("PopularPosts2"));' target='configPopularPosts2' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div>
</div></div>
</li>
</ul>
</div>
<div class='footer-widget-box footer-widget-box-last'>
<ul class='widget-container'>
<li>
<div class='footersec section' id='footersec4'><div class='widget Translate' id='Translate1'>
<h2 class='title'>Translate</h2>
<div id='google_translate_element'></div>
<script>
    function googleTranslateElementInit() {
      new google.translate.TranslateElement({
        pageLanguage: 'en',
        autoDisplay: 'true',
        layout: google.translate.TranslateElement.InlineLayout.VERTICAL
      }, 'google_translate_element');
    }
  </script>
<script src='//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit'></script>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=Translate&widgetId=Translate1&action=editWidget&sectionId=footersec4' onclick='return _WidgetManager._PopupConfig(document.getElementById("Translate1"));' target='configTranslate1' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div><div class='widget CustomSearch' id='CustomSearch3'>
<h2 class='title'>Search This Blog</h2>
<div class='widget-content'>
<div id='CustomSearch3_form'>
<span class='cse-status'>Loading...</span>
</div>
</div>
<style type='text/css'>
      #uds-searchControl .gs-result .gs-title,
      #uds-searchControl .gs-result .gs-title *,
      #uds-searchControl .gsc-results .gsc-trailing-more-results,
      #uds-searchControl .gsc-results .gsc-trailing-more-results * {
        color:#5588aa;
      }

      #uds-searchControl .gs-result .gs-title a:visited,
      #uds-searchControl .gs-result .gs-title a:visited * {
        color:#999999;
      }

      #uds-searchControl .gs-relativePublishedDate,
      #uds-searchControl .gs-publishedDate {
        color: #999999;
      }

      #uds-searchControl .gs-result a.gs-visibleUrl,
      #uds-searchControl .gs-result .gs-visibleUrl {
        color: #cc6600;
      }

      #uds-searchControl .gsc-results {
        border-color: #cccccc;
        background-color: #ffffff;
      }

      #uds-searchControl .gsc-tabhActive {
        border-color: #cccccc;
        border-top-color: #cc6600;
        background-color: #ffffff;
        color: #333333;
      }

      #uds-searchControl .gsc-tabhInactive {
        border-color: #cccccc;
        background-color: transparent;
        color: #5588aa;
      }

      #uds-searchClearResults {
        border-color: #cccccc;
      }

      #uds-searchClearResults:hover {
        border-color: #cc6600;
      }

      #uds-searchControl .gsc-cursor-page {
        color: #5588aa;
      }

      #uds-searchControl .gsc-cursor-current-page {
        color: #333333;
      }
    </style>
<div class='clear'></div>
<span class='widget-item-control'>
<span class='item-control blog-admin'>
<a class='quickedit' href='//www.blogger.com/rearrange?blogID=8572598522221159569&widgetType=CustomSearch&widgetId=CustomSearch3&action=editWidget&sectionId=footersec4' onclick='return _WidgetManager._PopupConfig(document.getElementById("CustomSearch3"));' target='configCustomSearch3' title='Edit'>
<img alt='' height='18' src='//img1.blogblog.com/img/icon18_wrench_allbkg.png' width='18'/>
</a>
</span>
</span>
<div class='clear'></div>
</div></div>
</li>
</ul>
</div>
</div>
</div>
<div style='clear:both;'></div>
<div id='footer-container'>
<div id='footer'>
<div id='copyrights'>
Copyright &#169; <script type='text/javascript'>var creditsyear = new Date();document.write(creditsyear.getFullYear());</script>
<a href='http://www.unixmantra.com/'>UnixMantra</a>
</div>
<div id='credits'>
<!-- you don't have permission to remove or change these -->
<a href='http://myepochconverter.com'>EpochConverter </a> | <a href='http://www.unixmantra.com/p/privacy-policy.html'> Privacy Policy</a> | Powered by <a href='http://www.blogger.com/' title='Blogger'>Blogger.com</a>
</div>
</div><!-- #footer -->
</div>
<div style='clear:both;'></div>
</div></div></div>
<!-- end outer-wrapper -->
<script type="text/javascript">
if (window.jstiming) window.jstiming.load.tick('widgetJsBefore');
</script><script type="text/javascript" src="https://www.blogger.com/static/v1/widgets/1587645199-widgets.js"></script>
<script type="text/javascript" src="https://apis.google.com/js/plusone.js"></script>
<script type="text/javascript" src="//www.google.com/jsapi"></script>
<script type='text/javascript'>
if (typeof(BLOG_attachCsiOnload) != 'undefined' && BLOG_attachCsiOnload != null) { window['blogger_templates_experiment_id'] = "templatesV1";window['blogger_blog_id'] = '8572598522221159569';BLOG_attachCsiOnload('item_'); }_WidgetManager._Init('//www.blogger.com/rearrange?blogID\x3d8572598522221159569','//www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html','8572598522221159569');
_WidgetManager._SetDataContext([{'name': 'blog', 'data': {'blogId': '8572598522221159569', 'bloggerUrl': 'http://www.blogger.com', 'title': 'UnixMantra', 'pageType': 'item', 'postId': '4168024984553371945', 'url': 'http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html', 'canonicalUrl': 'http://www.unixmantra.com/2013/12/xargs-all-in-one-tutorial-guide.html', 'canonicalHomepageUrl': 'http://www.unixmantra.com/', 'homepageUrl': 'http://www.unixmantra.com/', 'blogspotFaviconUrl': 'http://www.unixmantra.com/favicon.ico', 'enabledCommentProfileImages': true, 'adultContent': false, 'disableAdSenseWidget': false, 'analyticsAccountNumber': 'UA-44077011-1', 'searchLabel': '', 'searchQuery': '', 'pageName': '\42xargs\42 All-IN-One Tutorial Guide', 'pageTitle': 'UnixMantra: \42xargs\42 All-IN-One Tutorial Guide', 'encoding': 'UTF-8', 'locale': 'en_GB', 'localeUnderscoreDelimited': 'en_gb', 'isPrivate': false, 'isMobile': false, 'isMobileRequest': false, 'mobileClass': '', 'isPrivateBlog': false, 'languageDirection': 'ltr', 'feedLinks': '\74link rel\75\42alternate\42 type\75\42application/atom+xml\42 title\75\42UnixMantra - Atom\42 href\75\42http://www.unixmantra.com/feeds/posts/default\42 /\76\n\74link rel\75\42alternate\42 type\75\42application/rss+xml\42 title\75\42UnixMantra - RSS\42 href\75\42http://www.unixmantra.com/feeds/posts/default?alt\75rss\42 /\76\n\74link rel\75\42service.post\42 type\75\42application/atom+xml\42 title\75\42UnixMantra - Atom\42 href\75\42http://www.blogger.com/feeds/8572598522221159569/posts/default\42 /\76\n\n\74link rel\75\42alternate\42 type\75\42application/atom+xml\42 title\75\42UnixMantra - Atom\42 href\75\42http://www.unixmantra.com/feeds/4168024984553371945/comments/default\42 /\76\n', 'meTag': '', 'openIdOpTag': '', 'postImageThumbnailUrl': 'http://4.bp.blogspot.com/-VrzkScmOMF0/Ur-chEQTmoI/AAAAAAAAAno/bTRNZSJvbSo/s72-c/xargs-all-in-one.png', 'postImageUrl': 'http://4.bp.blogspot.com/-VrzkScmOMF0/Ur-chEQTmoI/AAAAAAAAAno/bTRNZSJvbSo/s400/xargs-all-in-one.png', 'latencyHeadScript': '\74script type\75\42text/javascript\42\76(function() { var b\75window,f\75\42chrome\42,g\75\42tick\42,k\75\42jstiming\42;(function(){function d(a){this.t\75{};this.tick\75function(a,d,c){var e\75void 0!\75c?c:(new Date).getTime();this.t[a]\75[e,d];if(void 0\75\75c)try{b.console.timeStamp(\42CSI/\42+a)}catch(h){}};this[g](\42start\42,null,a)}var a;b.performance\46\46(a\75b.performance.timing);var n\75a?new d(a.responseStart):new d;b.jstiming\75{Timer:d,load:n};if(a){var c\75a.navigationStart,h\75a.responseStart;0\74c\46\46h\76\75c\46\46(b[k].srt\75h-c)}if(a){var e\75b[k].load;0\74c\46\46h\76\75c\46\46(e[g](\42_wtsrt\42,void 0,c),e[g](\42wtsrt_\42,\42_wtsrt\42,h),e[g](\42tbsd_\42,\42wtsrt_\42))}try{a\75null,\nb[f]\46\46b[f].csi\46\46(a\75Math.floor(b[f].csi().pageT),e\46\0460\74c\46\46(e[g](\42_tbnd\42,void 0,b[f].csi().startE),e[g](\42tbnd_\42,\42_tbnd\42,c))),null\75\75a\46\46b.gtbExternal\46\46(a\75b.gtbExternal.pageT()),null\75\75a\46\46b.external\46\46(a\75b.external.pageT,e\46\0460\74c\46\46(e[g](\42_tbnd\42,void 0,b.external.startE),e[g](\42tbnd_\42,\42_tbnd\42,c))),a\46\46(b[k].pt\75a)}catch(p){}})();b.tickAboveFold\75function(d){var a\0750;if(d.offsetParent){do a+\75d.offsetTop;while(d\75d.offsetParent)}d\75a;750\76\75d\46\46b[k].load[g](\42aft\42)};var l\75!1;function m(){l||(l\75!0,b[k].load[g](\42firstScrollTime\42))}b.addEventListener?b.addEventListener(\42scroll\42,m,!1):b.attachEvent(\42onscroll\42,m);\n })();\74/script\076', 'mobileHeadScript': '', 'view': '', 'dynamicViewsCommentsSrc': '//www.blogblog.com/dynamicviews/4224c15c4e7c9321/js/comments.js', 'dynamicViewsScriptSrc': '//www.blogblog.com/dynamicviews/cda3ddef07a85452', 'plusOneApiSrc': 'https://apis.google.com/js/plusone.js', 'sf': 'n', 'tf': ''}}, {'name': 'skin', 'data': {'vars': {'sidebartextcolor': '#666666', 'linkcolor': '#5588aa', 'visitedlinkcolor': '#999999', 'textcolor': '#333333', 'headerfont': 'normal normal 78% \47Trebuchet MS\47,Trebuchet,Arial,Verdana,Sans-serif', 'pagetitlefont': 'normal normal 200% Georgia, Serif', 'bgcolor': '#ffffff', 'descriptioncolor': '#999999', 'titlecolor': '#cc6600', 'bordercolor': '#cccccc', 'postfooterfont': 'normal normal 78% \47Trebuchet MS\47, Trebuchet, Arial, Verdana, Sans-serif', 'pagetitlecolor': '#666666', 'bodyfont': 'normal normal 100% Georgia, Serif', 'endSide': 'right', 'startSide': 'left', 'descriptionfont': 'normal normal 78% \47Trebuchet MS\47, Trebuchet, Arial, Verdana, Sans-serif', 'sidebarcolor': '#999999'}, 'override': ''}}, {'name': 'view', 'data': {'classic': {'name': 'classic', 'url': '?view\75classic'}, 'flipcard': {'name': 'flipcard', 'url': '?view\75flipcard'}, 'magazine': {'name': 'magazine', 'url': '?view\75magazine'}, 'mosaic': {'name': 'mosaic', 'url': '?view\75mosaic'}, 'sidebar': {'name': 'sidebar', 'url': '?view\75sidebar'}, 'snapshot': {'name': 'snapshot', 'url': '?view\75snapshot'}, 'timeslide': {'name': 'timeslide', 'url': '?view\75timeslide'}}}]);
_WidgetManager._RegisterWidget('_HeaderView', new _WidgetInfo('Header1', 'header', null, document.getElementById('Header1'), {}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_LinkListView', new _WidgetInfo('LinkList7', 'pagelistmenusblog', null, document.getElementById('LinkList7'), {}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_BlogView', new _WidgetInfo('Blog1', 'main', null, document.getElementById('Blog1'), {'cmtInteractionsEnabled': false, 'lightboxEnabled': true, 'lightboxModuleUrl': 'https://www.blogger.com/static/v1/jsbin/40089119-lbx__en_gb.js', 'lightboxCssUrl': 'https://www.blogger.com/static/v1/v-css/2392111094-lightbox_bundle.css'}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_HTMLView', new _WidgetInfo('HTML4', 'rsidebartop', null, document.getElementById('HTML4'), {}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_HTMLView', new _WidgetInfo('HTML2', 'rsidebartop', null, document.getElementById('HTML2'), {}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_PopularPostsView', new _WidgetInfo('PopularPosts1', 'sidebartab1', null, document.getElementById('PopularPosts1'), {}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_LabelView', new _WidgetInfo('Label3', 'sidebartab2', null, document.getElementById('Label3'), {}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_BlogArchiveView', new _WidgetInfo('BlogArchive2', 'sidebartab3', null, document.getElementById('BlogArchive2'), {'languageDirection': 'ltr'}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_HTMLView', new _WidgetInfo('HTML3', 'sidebarright', null, document.getElementById('HTML3'), {}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_HTMLView', new _WidgetInfo('HTML1', 'sidebarright', null, document.getElementById('HTML1'), {}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_LabelView', new _WidgetInfo('Label1', 'footersec1', null, document.getElementById('Label1'), {}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_PopularPostsView', new _WidgetInfo('PopularPosts2', 'footersec3', null, document.getElementById('PopularPosts2'), {}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_TranslateView', new _WidgetInfo('Translate1', 'footersec4', null, document.getElementById('Translate1'), {}, 'displayModeFull'));
_WidgetManager._RegisterWidget('_CustomSearchView', new _WidgetInfo('CustomSearch3', 'footersec4', null, document.getElementById('CustomSearch3'), {'title': 'Search This Blog', 'includeBlog': true, 'includePostLinks': true, 'includeWeb': false, 'linkLists': [], 'blogUrl': 'http://www.unixmantra.com/', 'loadingMsg': 'Loading...', 'thisBlogMsg': 'This Blog', 'linkedFromHereMsg': 'Linked From Here', 'theWebMsg': 'The Web', 'backgroundColor': '#ffffff', 'textColor': '#333333', 'dateColor': '#999999', 'linkColor': '#5588aa', 'urlColor': '#cc6600', 'visitedLinkColor': '#999999', 'borderColor': '#cccccc', 'activeBorderColor': '#cc6600', 'cse_ua': false}, 'displayModeFull'));
</script>
</body>
</html>