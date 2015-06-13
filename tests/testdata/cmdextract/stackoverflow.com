<td class="answercell">
    <div class="post-text" itemprop="text">
<p>Try this</p>

<pre style="" class="lang-bsh prettyprint prettyprinted"><code><span class="pln">du </span><span class="pun">-</span><span class="pln">h </span><span class="pun">--</span><span class="pln">max</span><span class="pun">-</span><span class="pln">depth</span><span class="pun">=</span><span class="lit">1</span></code></pre>

<h3>Output</h3>

<pre style="" class="lang-bsh prettyprint prettyprinted"><code><span class="pln">oliver@home</span><span class="pun">:/</span><span class="pln">usr$ sudo du </span><span class="pun">-</span><span class="pln">h </span><span class="pun">--</span><span class="pln">max</span><span class="pun">-</span><span class="pln">depth</span><span class="pun">=</span><span class="lit">1</span><span class="pln">
</span><span class="lit">24M</span><span class="pln">     </span><span class="pun">./</span><span class="pln">include
</span><span class="lit">20M</span><span class="pln">     </span><span class="pun">./</span><span class="pln">sbin
</span><span class="lit">228M</span><span class="pln">    </span><span class="pun">./</span><span class="kwd">local</span><span class="pln">
</span><span class="lit">4.0K</span><span class="pln">    </span><span class="pun">./</span><span class="pln">src
</span><span class="lit">520M</span><span class="pln">    </span><span class="pun">./</span><span class="pln">lib
</span><span class="lit">8.0K</span><span class="pln">    </span><span class="pun">./</span><span class="pln">games
</span><span class="lit">1.3G</span><span class="pln">    </span><span class="pun">./</span><span class="pln">share
</span><span class="lit">255M</span><span class="pln">    </span><span class="pun">./</span><span class="pln">bin
</span><span class="lit">2.4G</span><span class="pln">    </span><span class="pun">.</span></code></pre>

<h2>Alternative</h2>

<p>If <code>--max-depth=1</code> is a bit too long for your taste, you can also try using:</p>

<pre style="" class="lang-bsh prettyprint prettyprinted"><code><span class="pln">du </span><span class="pun">-</span><span class="pln">h </span><span class="pun">-</span><span class="pln">s </span><span class="pun">*</span></code></pre>

<p>This uses <code>-s</code> (<code>--summarize</code>) and will only print the size of the folder itself by default. By passing all elements in the current working directory (<code>*</code>), it produces similar output as <code>--max-depth=1</code> would:</p>

<h3>Output</h3>

<pre style="" class="lang-bsh prettyprint prettyprinted"><code><span class="pln">oliver@cloud</span><span class="pun">:/</span><span class="pln">usr$ sudo du </span><span class="pun">-</span><span class="pln">h </span><span class="pun">-</span><span class="pln">s </span><span class="pun">*</span><span class="pln">
</span><span class="lit">255M</span><span class="pln">    bin
</span><span class="lit">8.0K</span><span class="pln">    games
</span><span class="lit">24M</span><span class="pln">     include
</span><span class="lit">520M</span><span class="pln">    lib
</span><span class="lit">0</span><span class="pln">       lib64
</span><span class="lit">228M</span><span class="pln">    </span><span class="kwd">local</span><span class="pln">
</span><span class="lit">20M</span><span class="pln">     sbin
</span><span class="lit">1.3G</span><span class="pln">    share
</span><span class="lit">4.0K</span><span class="pln">    src</span></code></pre>

<p>The difference is subtle. The former approach will display the total size of the current working directory and the total size of all folders that are contained in it... but only up to a depth of 1.</p>

<p>The latter approach will calculate the total size of all passed items <em>individually</em>. Thus, it includes the symlink <code>lib64</code> in the output, but excludes the hidden items (whose name start with a dot). It also lacks the total size for the current working directory, as that was not passed as an argument.</p>
    </div>
    <table class="fw">
    <tbody><tr>
    <td class="vt">
<div class="post-menu"><a href="/a/554320" title="short permalink to this answer" class="short-link" id="link-post-554320">share</a><span class="lsep">|</span><a href="/posts/554320/edit" class="suggest-edit-post" title="">improve this answer</a></div>                    </td>
    <td class="post-signature" align="right">
<div class="user-info ">
    <div class="user-action-time">
        <a href="/posts/554320/revisions" title="show all edits to this post">edited <span title="2013-02-19 16:49:15Z" class="relativetime">Feb 19 '13 at 16:49</span></a>
    </div>
    <div class="user-gravatar32">
        <a href="/users/169569/sm4rk0"><div class="gravatar-wrapper-32"><img src="https://www.gravatar.com/avatar/59f168daa30bab0a86c0fe352d8d6a40?s=32&amp;d=identicon&amp;r=PG" alt="" height="32" width="32"></div></a>
    </div>
    <div class="user-details">
        <a href="/users/169569/sm4rk0">sm4rk0</a><br>
        <span class="reputation-score" title="reputation score " dir="ltr">418</span><span title="3 silver badges"><span class="badge2"></span><span class="badgecount">3</span></span><span title="13 bronze badges"><span class="badge3"></span><span class="badgecount">13</span></span>
    </div>
</div>    </td>
            


    <td class="post-signature" align="right">   
       

    <div class="user-info user-hover">
    <div class="user-action-time">
        answered <span title="2013-02-19 15:36:20Z" class="relativetime">Feb 19 '13 at 15:36</span>
    </div>
    <div class="user-gravatar32">
        <a href="/users/36744/oliver-salzburg"><div class="gravatar-wrapper-32"><img src="https://www.gravatar.com/avatar/ec198cb6fc38d98bb88dd390e0bed8e3?s=32&amp;d=identicon&amp;r=PG" alt="" height="32" width="32"></div></a>
    </div>
    <div class="user-details">
        <a href="/users/36744/oliver-salzburg">Oliver Salzburg</a><span class="mod-flair" title="moderator">♦</span><br>
        <span class="reputation-score" title="reputation score 46737" dir="ltr">46.7k</span><span title="22 gold badges"><span class="badge1"></span><span class="badgecount">22</span></span><span title="152 silver badges"><span class="badge2"></span><span class="badgecount">152</span></span><span title="204 bronze badges"><span class="badge3"></span><span class="badgecount">204</span></span>
    </div>
</div>
    </td>
    </tr>
    </tbody></table>
</td>
