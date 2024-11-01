<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"><head>

<meta charset="utf-8">
<meta name="generator" content="quarto-1.5.55">

<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">

<meta name="author" content="Arunima Pandey">
<meta name="dcterms.date" content="2024-10-28">

<title>Replication via R &amp; Quarto - How Can Lower-Income Countries Collect More Taxes? The Role of Technology, Tax Agents, and Politics</title>
<style>
code{white-space: pre-wrap;}
span.smallcaps{font-variant: small-caps;}
div.columns{display: flex; gap: min(4vw, 1.5em);}
div.column{flex: auto; overflow-x: auto;}
div.hanging-indent{margin-left: 1.5em; text-indent: -1.5em;}
ul.task-list{list-style: none;}
ul.task-list li input[type="checkbox"] {
  width: 0.8em;
  margin: 0 0.8em 0.2em -1em; /* quarto-specific, see https://github.com/quarto-dev/quarto-cli/issues/4556 */ 
  vertical-align: middle;
}
/* CSS for syntax highlighting */
pre > code.sourceCode { white-space: pre; position: relative; }
pre > code.sourceCode > span { line-height: 1.25; }
pre > code.sourceCode > span:empty { height: 1.2em; }
.sourceCode { overflow: visible; }
code.sourceCode > span { color: inherit; text-decoration: inherit; }
div.sourceCode { margin: 1em 0; }
pre.sourceCode { margin: 0; }
@media screen {
div.sourceCode { overflow: auto; }
}
@media print {
pre > code.sourceCode { white-space: pre-wrap; }
pre > code.sourceCode > span { display: inline-block; text-indent: -5em; padding-left: 5em; }
}
pre.numberSource code
  { counter-reset: source-line 0; }
pre.numberSource code > span
  { position: relative; left: -4em; counter-increment: source-line; }
pre.numberSource code > span > a:first-child::before
  { content: counter(source-line);
    position: relative; left: -1em; text-align: right; vertical-align: baseline;
    border: none; display: inline-block;
    -webkit-touch-callout: none; -webkit-user-select: none;
    -khtml-user-select: none; -moz-user-select: none;
    -ms-user-select: none; user-select: none;
    padding: 0 4px; width: 4em;
  }
pre.numberSource { margin-left: 3em;  padding-left: 4px; }
div.sourceCode
  {   }
@media screen {
pre > code.sourceCode > span > a:first-child::before { text-decoration: underline; }
}
</style>


<script src="arunimapresentationds2024new_files/libs/clipboard/clipboard.min.js"></script>
<script src="arunimapresentationds2024new_files/libs/quarto-html/quarto.js"></script>
<script src="arunimapresentationds2024new_files/libs/quarto-html/popper.min.js"></script>
<script src="arunimapresentationds2024new_files/libs/quarto-html/tippy.umd.min.js"></script>
<script src="arunimapresentationds2024new_files/libs/quarto-html/anchor.min.js"></script>
<link href="arunimapresentationds2024new_files/libs/quarto-html/tippy.css" rel="stylesheet">
<link href="arunimapresentationds2024new_files/libs/quarto-html/quarto-syntax-highlighting.css" rel="stylesheet" id="quarto-text-highlighting-styles">
<script src="arunimapresentationds2024new_files/libs/bootstrap/bootstrap.min.js"></script>
<link href="arunimapresentationds2024new_files/libs/bootstrap/bootstrap-icons.css" rel="stylesheet">
<link href="arunimapresentationds2024new_files/libs/bootstrap/bootstrap.min.css" rel="stylesheet" id="quarto-bootstrap" data-mode="light">


</head>

<body class="fullcontent">

<div id="quarto-content" class="page-columns page-rows-contents page-layout-article">

<main class="content" id="quarto-document-content">

<header id="title-block-header" class="quarto-title-block default">
<div class="quarto-title">
<h1 class="title">Replication via R &amp; Quarto - How Can Lower-Income Countries Collect More Taxes? The Role of Technology, Tax Agents, and Politics</h1>
</div>



<div class="quarto-title-meta">

    <div>
    <div class="quarto-title-meta-heading">Author</div>
    <div class="quarto-title-meta-contents">
             <p>Arunima Pandey </p>
          </div>
  </div>
    
    <div>
    <div class="quarto-title-meta-heading">Published</div>
    <div class="quarto-title-meta-contents">
      <p class="date">October 28, 2024</p>
    </div>
  </div>
  
    
  </div>
  


</header>


<div class="cell">
<div class="sourceCode cell-code" id="cb1"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb1-1"><a href="#cb1-1" aria-hidden="true" tabindex="-1"></a><span class="fu">install.packages</span>(<span class="st">"knitr"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>The following package(s) will be installed:
- knitr [1.48]
These packages will be installed into "~/dsarunima2024/renv/library/R-4.3/aarch64-apple-darwin20".

# Installing packages --------------------------------------------------------
- Installing knitr ...                          OK [linked from cache]
Successfully installed 1 package in 3.5 milliseconds.</code></pre>
</div>
<div class="sourceCode cell-code" id="cb3"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb3-1"><a href="#cb3-1" aria-hidden="true" tabindex="-1"></a><span class="fu">library</span>(knitr)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb4"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb4-1"><a href="#cb4-1" aria-hidden="true" tabindex="-1"></a><span class="fu">install.packages</span>(<span class="st">"quarto"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>The following package(s) will be installed:
- quarto [1.4.4]
These packages will be installed into "~/dsarunima2024/renv/library/R-4.3/aarch64-apple-darwin20".

# Installing packages --------------------------------------------------------
- Installing quarto ...                         OK [linked from cache]
Successfully installed 1 package in 2.6 milliseconds.</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb6"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb6-1"><a href="#cb6-1" aria-hidden="true" tabindex="-1"></a><span class="fu">install.packages</span>(<span class="st">"tinytex"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>The following package(s) will be installed:
- tinytex [0.53]
These packages will be installed into "~/dsarunima2024/renv/library/R-4.3/aarch64-apple-darwin20".

# Installing packages --------------------------------------------------------
- Installing tinytex ...                        OK [linked from cache]
Successfully installed 1 package in 2.5 milliseconds.</code></pre>
</div>
<div class="sourceCode cell-code" id="cb8"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb8-1"><a href="#cb8-1" aria-hidden="true" tabindex="-1"></a><span class="fu">library</span>(tinytex)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb9"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb9-1"><a href="#cb9-1" aria-hidden="true" tabindex="-1"></a><span class="cf">if</span> (<span class="sc">!</span><span class="fu">require</span>(pacman)) <span class="fu">install.packages</span>(<span class="st">"pacman"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stderr">
<pre><code>Loading required package: pacman</code></pre>
</div>
<div class="sourceCode cell-code" id="cb11"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb11-1"><a href="#cb11-1" aria-hidden="true" tabindex="-1"></a>pacman<span class="sc">::</span><span class="fu">p_load</span>(knitr, rmarkdown, papaja)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb12"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb12-1"><a href="#cb12-1" aria-hidden="true" tabindex="-1"></a><span class="fu">install.packages</span>(<span class="st">"haven"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>The following package(s) will be installed:
- haven [2.5.4]
These packages will be installed into "~/dsarunima2024/renv/library/R-4.3/aarch64-apple-darwin20".

# Installing packages --------------------------------------------------------
- Installing haven ...                          OK [linked from cache]
Successfully installed 1 package in 2.6 milliseconds.</code></pre>
</div>
<div class="sourceCode cell-code" id="cb14"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb14-1"><a href="#cb14-1" aria-hidden="true" tabindex="-1"></a><span class="fu">library</span>(haven)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb15"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb15-1"><a href="#cb15-1" aria-hidden="true" tabindex="-1"></a><span class="fu">getwd</span>()</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] "/Users/arunimapandey/dsarunima2024"</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb17"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb17-1"><a href="#cb17-1" aria-hidden="true" tabindex="-1"></a><span class="fu">install.packages</span>(<span class="st">"ggplot2"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>The following package(s) will be installed:
- ggplot2 [3.5.1]
These packages will be installed into "~/dsarunima2024/renv/library/R-4.3/aarch64-apple-darwin20".

# Installing packages --------------------------------------------------------
- Installing ggplot2 ...                        OK [linked from cache]
Successfully installed 1 package in 2.8 milliseconds.</code></pre>
</div>
<div class="sourceCode cell-code" id="cb19"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb19-1"><a href="#cb19-1" aria-hidden="true" tabindex="-1"></a><span class="fu">library</span>(ggplot2)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb20"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb20-1"><a href="#cb20-1" aria-hidden="true" tabindex="-1"></a><span class="fu">install.packages</span>(<span class="st">"dplyr"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>The following package(s) will be installed:
- dplyr [1.1.4]
These packages will be installed into "~/dsarunima2024/renv/library/R-4.3/aarch64-apple-darwin20".

# Installing packages --------------------------------------------------------
- Installing dplyr ...                          OK [linked from cache]
Successfully installed 1 package in 2.8 milliseconds.</code></pre>
</div>
<div class="sourceCode cell-code" id="cb22"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb22-1"><a href="#cb22-1" aria-hidden="true" tabindex="-1"></a><span class="fu">library</span>(dplyr)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stderr">
<pre><code>
Attaching package: 'dplyr'</code></pre>
</div>
<div class="cell-output cell-output-stderr">
<pre><code>The following objects are masked from 'package:stats':

    filter, lag</code></pre>
</div>
<div class="cell-output cell-output-stderr">
<pre><code>The following objects are masked from 'package:base':

    intersect, setdiff, setequal, union</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb26"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb26-1"><a href="#cb26-1" aria-hidden="true" tabindex="-1"></a><span class="fu">setwd</span>(<span class="st">"/Users/arunimapandey/dsarunima2024/Packagenew/Data/01_base/unuwider_data"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb27"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb27-1"><a href="#cb27-1" aria-hidden="true" tabindex="-1"></a>data <span class="ot">&lt;-</span> <span class="fu">read_dta</span>(<span class="st">"/Users/arunimapandey/dsarunima2024/Packagenew/Data/01_base/unuwider_data/Figure1.dta"</span>, <span class="at">encoding =</span> <span class="st">"latin1"</span>)</span>
<span id="cb27-2"><a href="#cb27-2" aria-hidden="true" tabindex="-1"></a><span class="fu">head</span>(data)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code># A tibble: 6 × 58
  identifier general source country iso      id reg        inc     historicalinc
  &lt;chr&gt;        &lt;dbl&gt; &lt;chr&gt;  &lt;chr&gt;   &lt;chr&gt; &lt;dbl&gt; &lt;dbl+lbl&gt;  &lt;dbl+l&gt; &lt;dbl+lbl&gt;    
1 ABW1980          0 ""     Aruba   ABW       1 3 [Latin … 4 [Hig… NA           
2 ABW1981          0 ""     Aruba   ABW       1 3 [Latin … 4 [Hig… NA           
3 ABW1982          0 ""     Aruba   ABW       1 3 [Latin … 4 [Hig… NA           
4 ABW1983          0 ""     Aruba   ABW       1 3 [Latin … 4 [Hig… NA           
5 ABW1984          0 ""     Aruba   ABW       1 3 [Latin … 4 [Hig… NA           
6 ABW1985          0 ""     Aruba   ABW       1 3 [Latin … 4 [Hig… NA           
# ℹ 49 more variables: year &lt;dbl&gt;, caution1accuracyqualityorco &lt;chr&gt;,
#   caution2resourcerevenuestax &lt;chr&gt;, caution3unexcludedresourcere &lt;chr&gt;,
#   caution4inconsistencieswiths &lt;chr&gt;, rev_inc_sc &lt;dbl&gt;, rev_ex_sc &lt;dbl&gt;,
#   rev_ex_gr_inc_sc &lt;dbl&gt;, rev_ex_gr_ex_sc &lt;dbl&gt;, tot_res_rev &lt;dbl&gt;,
#   tot_nres_rev_inc_sc &lt;dbl&gt;, tax_inc_sc &lt;dbl&gt;, tax_ex_sc &lt;dbl&gt;,
#   resourcetaxes &lt;dbl&gt;, nrtax_inc_sc &lt;dbl&gt;, nrtax_ex_sc &lt;dbl&gt;,
#   direct_inc_sc_inc_rt &lt;dbl&gt;, direct_inc_sc_ex_rt &lt;dbl&gt;, …</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb29"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb29-1"><a href="#cb29-1" aria-hidden="true" tabindex="-1"></a><span class="fu">class</span>(data)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] "tbl_df"     "tbl"        "data.frame"</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb31"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb31-1"><a href="#cb31-1" aria-hidden="true" tabindex="-1"></a><span class="fu">colnames</span>(data)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code> [1] "identifier"                   "general"                     
 [3] "source"                       "country"                     
 [5] "iso"                          "id"                          
 [7] "reg"                          "inc"                         
 [9] "historicalinc"                "year"                        
[11] "caution1accuracyqualityorco"  "caution2resourcerevenuestax" 
[13] "caution3unexcludedresourcere" "caution4inconsistencieswiths"
[15] "rev_inc_sc"                   "rev_ex_sc"                   
[17] "rev_ex_gr_inc_sc"             "rev_ex_gr_ex_sc"             
[19] "tot_res_rev"                  "tot_nres_rev_inc_sc"         
[21] "tax_inc_sc"                   "tax_ex_sc"                   
[23] "resourcetaxes"                "nrtax_inc_sc"                
[25] "nrtax_ex_sc"                  "direct_inc_sc_inc_rt"        
[27] "direct_inc_sc_ex_rt"          "direct_ex_sc_inc_rt"         
[29] "direct_ex_sc_ex_rt"           "tax_income"                  
[31] "tax_res_income"               "tax_nr_income"               
[33] "tax_indiv"                    "tax_corp"                    
[35] "tax_res_corp"                 "tax_nr_corp"                 
[37] "tax_payr_workf"               "tax_property"                
[39] "tax_indirect"                 "res_indirect"                
[41] "nr_indirect"                  "tax_g_s"                     
[43] "tax_gs_general"               "vat"                         
[45] "tax_gs_excises"               "tax_trade"                   
[47] "tax_trade_import"             "tax_trade_export"            
[49] "tax_other"                    "nontax"                      
[51] "res_nontax"                   "nr_nontax"                   
[53] "sc"                           "grants"                      
[55] "generalnotes"                 "cautionnotes"                
[57] "resourcerevenuenotes"         "socialcontributionsnotes"    </code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb33"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb33-1"><a href="#cb33-1" aria-hidden="true" tabindex="-1"></a><span class="fu">summary</span>(data)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>  identifier           general          source            country         
 Length:8254        Min.   :0.0000   Length:8254        Length:8254       
 Class :character   1st Qu.:0.0000   Class :character   Class :character  
 Mode  :character   Median :0.0000   Mode  :character   Mode  :character  
                    Mean   :0.3918                                        
                    3rd Qu.:1.0000                                        
                    Max.   :1.0000                                        
                                                                          
     iso                  id              reg             inc       
 Length:8254        Min.   :  1.00   Min.   :1.000   Min.   :0.000  
 Class :character   1st Qu.: 50.00   1st Qu.:2.000   1st Qu.:2.000  
 Mode  :character   Median : 99.00   Median :3.000   Median :3.000  
                    Mean   : 98.99   Mean   :3.643   Mean   :2.723  
                    3rd Qu.:148.00   3rd Qu.:6.000   3rd Qu.:4.000  
                    Max.   :197.00   Max.   :7.000   Max.   :4.000  
                                                                    
 historicalinc        year      caution1accuracyqualityorco
 Min.   :0.000   Min.   :1980   Length:8254                
 1st Qu.:1.000   1st Qu.:1990   Class :character           
 Median :2.000   Median :2001   Mode  :character           
 Mean   :2.426   Mean   :2001                              
 3rd Qu.:3.000   3rd Qu.:2011                              
 Max.   :4.000   Max.   :2021                              
 NA's   :1721                                              
 caution2resourcerevenuestax caution3unexcludedresourcere
 Length:8254                 Length:8254                 
 Class :character            Class :character            
 Mode  :character            Mode  :character            
                                                         
                                                         
                                                         
                                                         
 caution4inconsistencieswiths   rev_inc_sc         rev_ex_sc       
 Length:8254                  Min.   :  0.7335   Min.   :  0.7335  
 Class :character             1st Qu.: 17.5205   1st Qu.: 17.0790  
 Mode  :character             Median : 25.6062   Median : 23.6655  
                              Mean   : 28.7147   Mean   : 26.0805  
                              3rd Qu.: 37.4198   3rd Qu.: 30.8400  
                              Max.   :178.7709   Max.   :178.7709  
                              NA's   :2582       NA's   :2492      
 rev_ex_gr_inc_sc   rev_ex_gr_ex_sc     tot_res_rev     tot_nres_rev_inc_sc
 Min.   :  0.6788   Min.   :  0.6788   Min.   :-0.725   Min.   :  0.743    
 1st Qu.: 14.9985   1st Qu.: 14.5111   1st Qu.: 0.000   1st Qu.: 11.902    
 Median : 23.2066   Median : 21.5085   Median : 0.000   Median : 20.660    
 Mean   : 25.8650   Mean   : 23.0346   Mean   : 4.309   Mean   : 23.121    
 3rd Qu.: 34.8664   3rd Qu.: 28.8492   3rd Qu.: 2.799   3rd Qu.: 32.940    
 Max.   :150.9942   Max.   :150.9942   Max.   :80.299   Max.   :117.800    
 NA's   :2145       NA's   :2036       NA's   :3689     NA's   :3842       
   tax_inc_sc         tax_ex_sc        resourcetaxes      nrtax_inc_sc    
 Min.   :  0.0858   Min.   :  0.0858   Min.   :-0.7245   Min.   :  0.000  
 1st Qu.: 10.8519   1st Qu.: 10.4490   1st Qu.: 0.0000   1st Qu.:  9.849  
 Median : 17.4193   Median : 16.2152   Median : 0.0000   Median : 16.173  
 Mean   : 19.8913   Mean   : 16.8830   Mean   : 0.7086   Mean   : 18.692  
 3rd Qu.: 27.6585   3rd Qu.: 21.9008   3rd Qu.: 0.0000   3rd Qu.: 26.093  
 Max.   :112.8054   Max.   :112.8054   Max.   :45.3247   Max.   :112.805  
 NA's   :2025       NA's   :1733       NA's   :2382      NA's   :2568     
  nrtax_ex_sc      direct_inc_sc_inc_rt direct_inc_sc_ex_rt direct_ex_sc_inc_rt
 Min.   :  0.000   Min.   : 0.000       Min.   : 0.000      Min.   : 0.000     
 1st Qu.:  9.603   1st Qu.: 3.170       1st Qu.: 2.950      1st Qu.: 2.880     
 Median : 15.115   Median : 6.987       Median : 6.259      Median : 5.558     
 Mean   : 15.795   Mean   :10.387       Mean   :10.116      Mean   : 7.073     
 3rd Qu.: 20.818   3rd Qu.:16.958       3rd Qu.:16.975      3rd Qu.: 9.765     
 Max.   :112.805   Max.   :37.947       Max.   :37.947      Max.   :34.419     
 NA's   :2289      NA's   :2878         NA's   :3004        NA's   :2611       
 direct_ex_sc_ex_rt   tax_income     tax_res_income   tax_nr_income   
 Min.   : 0.000     Min.   : 0.000   Min.   :-0.038   Min.   : 0.000  
 1st Qu.: 2.728     1st Qu.: 2.714   1st Qu.: 0.000   1st Qu.: 2.560  
 Median : 5.165     Median : 5.291   Median : 0.000   Median : 4.867  
 Mean   : 6.753     Mean   : 6.461   Mean   : 0.451   Mean   : 5.883  
 3rd Qu.: 9.228     3rd Qu.: 8.922   3rd Qu.: 0.000   3rd Qu.: 8.238  
 Max.   :34.419     Max.   :32.264   Max.   :31.480   Max.   :31.859  
 NA's   :2717       NA's   :2541     NA's   :3340     NA's   :3246    
   tax_indiv         tax_corp       tax_res_corp     tax_nr_corp    
 Min.   : 0.000   Min.   : 0.000   Min.   :-0.038   Min.   : 0.000  
 1st Qu.: 0.935   1st Qu.: 1.288   1st Qu.: 0.000   1st Qu.: 1.209  
 Median : 2.489   Median : 2.168   Median : 0.000   Median : 2.002  
 Mean   : 3.970   Mean   : 2.652   Mean   : 0.348   Mean   : 2.306  
 3rd Qu.: 5.709   3rd Qu.: 3.271   3rd Qu.: 0.000   3rd Qu.: 2.979  
 Max.   :26.740   Max.   :32.841   Max.   :31.480   Max.   :32.841  
 NA's   :3543     NA's   :3491     NA's   :4311     NA's   :4258    
 tax_payr_workf    tax_property     tax_indirect      res_indirect   
 Min.   :-0.012   Min.   :-0.084   Min.   : 0.0172   Min.   :0.0000  
 1st Qu.: 0.000   1st Qu.: 0.020   1st Qu.: 6.3955   1st Qu.:0.0000  
 Median : 0.000   Median : 0.238   Median :10.0169   Median :0.0000  
 Mean   : 0.192   Mean   : 0.581   Mean   :10.1299   Mean   :0.0405  
 3rd Qu.: 0.082   3rd Qu.: 0.850   3rd Qu.:12.9600   3rd Qu.:0.0000  
 Max.   : 6.946   Max.   :17.026   Max.   :80.0919   Max.   :9.6347  
 NA's   :3864     NA's   :3434     NA's   :2262      NA's   :2486    
  nr_indirect         tax_g_s       tax_gs_general        vat        
 Min.   : 0.0172   Min.   : 0.000   Min.   : 0.000   Min.   :-0.803  
 1st Qu.: 6.3736   1st Qu.: 3.753   1st Qu.: 2.509   1st Qu.: 2.658  
 Median :10.0941   Median : 6.963   Median : 4.986   Median : 5.191  
 Mean   :10.1451   Mean   : 7.496   Mean   : 5.286   Mean   : 4.967  
 3rd Qu.:12.9797   3rd Qu.:10.856   3rd Qu.: 7.676   3rd Qu.: 7.258  
 Max.   :80.0919   Max.   :63.036   Max.   :59.430   Max.   :18.886  
 NA's   :2452      NA's   :2551     NA's   :3584     NA's   :4529    
 tax_gs_excises     tax_trade       tax_trade_import tax_trade_export
 Min.   : 0.000   Min.   :-1.5821   Min.   :-0.017   Min.   :-2.158  
 1st Qu.: 0.877   1st Qu.: 0.5145   1st Qu.: 0.365   1st Qu.: 0.000  
 Median : 1.821   Median : 1.4293   Median : 1.155   Median : 0.000  
 Mean   : 2.008   Mean   : 2.4924   Mean   : 1.998   Mean   : 0.136  
 3rd Qu.: 2.900   3rd Qu.: 3.0548   3rd Qu.: 2.514   3rd Qu.: 0.021  
 Max.   :10.767   Max.   :40.8609   Max.   :29.052   Max.   : 6.341  
 NA's   :3481     NA's   :2462      NA's   :3587     NA's   :3979    
   tax_other           nontax          res_nontax       nr_nontax     
 Min.   :-1.9408   Min.   :  0.000   Min.   :-0.884   Min.   : 0.000  
 1st Qu.: 0.0000   1st Qu.:  1.725   1st Qu.: 0.000   1st Qu.: 1.547  
 Median : 0.1100   Median :  3.793   Median : 0.000   Median : 3.478  
 Mean   : 0.3883   Mean   :  6.128   Mean   : 2.785   Mean   : 4.519  
 3rd Qu.: 0.4798   3rd Qu.:  6.658   3rd Qu.: 0.261   3rd Qu.: 6.165  
 Max.   : 9.2474   Max.   :104.046   Max.   :91.233   Max.   :76.533  
 NA's   :2837      NA's   :2240      NA's   :4062     NA's   :4043    
       sc             grants         generalnotes       cautionnotes      
 Min.   : 0.000   Min.   : -0.6750   Length:8254        Length:8254       
 1st Qu.: 0.000   1st Qu.:  0.0000   Class :character   Class :character  
 Median : 0.000   Median :  0.2407   Mode  :character   Mode  :character  
 Mean   : 2.899   Mean   :  2.7266                                        
 3rd Qu.: 4.909   3rd Qu.:  2.0401                                        
 Max.   :21.274   Max.   :150.5442                                        
 NA's   :2039     NA's   :2262                                            
 resourcerevenuenotes socialcontributionsnotes
 Length:8254          Length:8254             
 Class :character     Class :character        
 Mode  :character     Mode  :character        
                                              
                                              
                                              
                                              </code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb35"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb35-1"><a href="#cb35-1" aria-hidden="true" tabindex="-1"></a>country_data <span class="ot">&lt;-</span> data <span class="sc">%&gt;%</span> <span class="fu">select</span>(country)</span>
<span id="cb35-2"><a href="#cb35-2" aria-hidden="true" tabindex="-1"></a><span class="fu">head</span>(country_data)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code># A tibble: 6 × 1
  country
  &lt;chr&gt;  
1 Aruba  
2 Aruba  
3 Aruba  
4 Aruba  
5 Aruba  
6 Aruba  </code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb37"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb37-1"><a href="#cb37-1" aria-hidden="true" tabindex="-1"></a>dataset <span class="ot">&lt;-</span> <span class="fu">read_dta</span>(<span class="st">"/Users/arunimapandey/dsarunima2024/Packagenew/Data/01_base/unuwider_data/figurex.dta"</span>)</span>
<span id="cb37-2"><a href="#cb37-2" aria-hidden="true" tabindex="-1"></a><span class="fu">head</span>(dataset)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code># A tibble: 6 × 68
     id country     c3    c2     year  gini   ge0   ge1   ge2  a025  a050  a075
  &lt;dbl&gt; &lt;chr&gt;       &lt;chr&gt; &lt;chr&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt; &lt;dbl&gt;
1     1 Afghanistan AFG   AF     2008  29      NA    NA    NA    NA    NA    NA
2     2 Afghanistan AFG   AF     2012  33      NA    NA    NA    NA    NA    NA
3     3 Afghanistan AFG   AF     2017  31      NA    NA    NA    NA    NA    NA
4     4 Albania     ALB   AL     1996  27.0    NA    NA    NA    NA    NA    NA
5     5 Albania     ALB   AL     2002  31.7    NA    NA    NA    NA    NA    NA
6     6 Albania     ALB   AL     2005  30.6    NA    NA    NA    NA    NA    NA
# ℹ 56 more variables: a1 &lt;dbl&gt;, a2 &lt;dbl&gt;, palma &lt;dbl&gt;,
#   ratio_top20bottom20 &lt;dbl&gt;, bottom40 &lt;dbl&gt;, q1 &lt;dbl&gt;, q2 &lt;dbl&gt;, q3 &lt;dbl&gt;,
#   q4 &lt;dbl&gt;, q5 &lt;dbl&gt;, d1 &lt;dbl&gt;, d2 &lt;dbl&gt;, d3 &lt;dbl&gt;, d4 &lt;dbl&gt;, d5 &lt;dbl&gt;,
#   d6 &lt;dbl&gt;, d7 &lt;dbl&gt;, d8 &lt;dbl&gt;, d9 &lt;dbl&gt;, d10 &lt;dbl&gt;, bottom5 &lt;dbl&gt;,
#   top5 &lt;dbl&gt;, resource &lt;dbl+lbl&gt;, resource_detailed &lt;dbl+lbl&gt;,
#   scale &lt;dbl+lbl&gt;, scale_detailed &lt;dbl+lbl&gt;, sharing_unit &lt;dbl+lbl&gt;,
#   reference_unit &lt;dbl+lbl&gt;, areacovr &lt;dbl+lbl&gt;, …</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb39"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb39-1"><a href="#cb39-1" aria-hidden="true" tabindex="-1"></a><span class="fu">install.packages</span>(<span class="st">"readxl"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>The following package(s) will be installed:
- readxl [1.4.3]
These packages will be installed into "~/dsarunima2024/renv/library/R-4.3/aarch64-apple-darwin20".

# Installing packages --------------------------------------------------------
- Installing readxl ...                         OK [linked from cache]
Successfully installed 1 package in 2.7 milliseconds.</code></pre>
</div>
<div class="sourceCode cell-code" id="cb41"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb41-1"><a href="#cb41-1" aria-hidden="true" tabindex="-1"></a><span class="fu">library</span>(readxl)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb42"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb42-1"><a href="#cb42-1" aria-hidden="true" tabindex="-1"></a>set2 <span class="ot">&lt;-</span> <span class="fu">read_excel</span>(<span class="st">"/Users/arunimapandey/dsarunima2024/Packagenew/Data/01_base/lagos_data/Lagos.xlsx"</span>)</span>
<span id="cb42-2"><a href="#cb42-2" aria-hidden="true" tabindex="-1"></a><span class="fu">head</span>(set2)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code># A tibble: 6 × 3
   Year `Lagos total tax from digest in billions` `Consumer price index`
  &lt;dbl&gt;                                     &lt;dbl&gt;                  &lt;dbl&gt;
1  1999                                      8.18                   27.7
2  2000                                      9.12                   29.6
3  2001                                     10.8                    35.2
4  2002                                     13.9                    39.7
5  2003                                     18.1                    45.3
6  2004                                     23.3                    52.1</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb44"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb44-1"><a href="#cb44-1" aria-hidden="true" tabindex="-1"></a><span class="fu">colnames</span>(set2)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] "Year"                                   
[2] "Lagos total tax from digest in billions"
[3] "Consumer price index"                   </code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb46"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb46-1"><a href="#cb46-1" aria-hidden="true" tabindex="-1"></a><span class="fu">rownames</span>(set2)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code> [1] "1"  "2"  "3"  "4"  "5"  "6"  "7"  "8"  "9"  "10" "11" "12" "13" "14"</code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb48"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb48-1"><a href="#cb48-1" aria-hidden="true" tabindex="-1"></a><span class="fu">names</span>(set2)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] "Year"                                   
[2] "Lagos total tax from digest in billions"
[3] "Consumer price index"                   </code></pre>
</div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb50"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb50-1"><a href="#cb50-1" aria-hidden="true" tabindex="-1"></a><span class="fu">library</span>(ggplot2)</span>
<span id="cb50-2"><a href="#cb50-2" aria-hidden="true" tabindex="-1"></a><span class="fu">install.packages</span>(<span class="st">"ggplot2"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>The following package(s) will be installed:
- ggplot2 [3.5.1]
These packages will be installed into "~/dsarunima2024/renv/library/R-4.3/aarch64-apple-darwin20".

# Installing packages --------------------------------------------------------
- Installing ggplot2 ...                        OK [linked from cache]
Successfully installed 1 package in 2.6 milliseconds.</code></pre>
</div>
<div class="sourceCode cell-code" id="cb52"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb52-1"><a href="#cb52-1" aria-hidden="true" tabindex="-1"></a><span class="fu">library</span>(ggplot2)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<div class="cell">
<div class="sourceCode cell-code" id="cb53"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb53-1"><a href="#cb53-1" aria-hidden="true" tabindex="-1"></a><span class="fu">ggplot</span>(set2, <span class="fu">aes</span>(<span class="at">x =</span> Year)) <span class="sc">+</span></span>
<span id="cb53-2"><a href="#cb53-2" aria-hidden="true" tabindex="-1"></a>  <span class="fu">geom_line</span>(<span class="fu">aes</span>(<span class="at">y =</span> <span class="st">`</span><span class="at">Lagos total tax from digest in billions</span><span class="st">`</span>), <span class="at">color =</span> <span class="st">"black"</span>) <span class="sc">+</span></span>
<span id="cb53-3"><a href="#cb53-3" aria-hidden="true" tabindex="-1"></a>  <span class="fu">labs</span>(<span class="at">title =</span> <span class="st">"Tax Revenues in Lagos State, Nigeria"</span>,</span>
<span id="cb53-4"><a href="#cb53-4" aria-hidden="true" tabindex="-1"></a>       <span class="at">x =</span> <span class="st">"Year"</span>,</span>
<span id="cb53-5"><a href="#cb53-5" aria-hidden="true" tabindex="-1"></a>       <span class="at">y =</span> <span class="st">"Lagos total tax from digest in billions"</span>)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output-display">
<div>
<figure class="figure">
<p><img src="arunimapresentationds2024new_files/figure-html/unnamed-chunk-22-1.png" class="img-fluid figure-img" width="672"></p>
</figure>
</div>
</div>
</div>

</main>
<!-- /main column -->
<script id="quarto-html-after-body" type="application/javascript">
window.document.addEventListener("DOMContentLoaded", function (event) {
  const toggleBodyColorMode = (bsSheetEl) => {
    const mode = bsSheetEl.getAttribute("data-mode");
    const bodyEl = window.document.querySelector("body");
    if (mode === "dark") {
      bodyEl.classList.add("quarto-dark");
      bodyEl.classList.remove("quarto-light");
    } else {
      bodyEl.classList.add("quarto-light");
      bodyEl.classList.remove("quarto-dark");
    }
  }
  const toggleBodyColorPrimary = () => {
    const bsSheetEl = window.document.querySelector("link#quarto-bootstrap");
    if (bsSheetEl) {
      toggleBodyColorMode(bsSheetEl);
    }
  }
  toggleBodyColorPrimary();  
  const icon = "";
  const anchorJS = new window.AnchorJS();
  anchorJS.options = {
    placement: 'right',
    icon: icon
  };
  anchorJS.add('.anchored');
  const isCodeAnnotation = (el) => {
    for (const clz of el.classList) {
      if (clz.startsWith('code-annotation-')) {                     
        return true;
      }
    }
    return false;
  }
  const onCopySuccess = function(e) {
    // button target
    const button = e.trigger;
    // don't keep focus
    button.blur();
    // flash "checked"
    button.classList.add('code-copy-button-checked');
    var currentTitle = button.getAttribute("title");
    button.setAttribute("title", "Copied!");
    let tooltip;
    if (window.bootstrap) {
      button.setAttribute("data-bs-toggle", "tooltip");
      button.setAttribute("data-bs-placement", "left");
      button.setAttribute("data-bs-title", "Copied!");
      tooltip = new bootstrap.Tooltip(button, 
        { trigger: "manual", 
          customClass: "code-copy-button-tooltip",
          offset: [0, -8]});
      tooltip.show();    
    }
    setTimeout(function() {
      if (tooltip) {
        tooltip.hide();
        button.removeAttribute("data-bs-title");
        button.removeAttribute("data-bs-toggle");
        button.removeAttribute("data-bs-placement");
      }
      button.setAttribute("title", currentTitle);
      button.classList.remove('code-copy-button-checked');
    }, 1000);
    // clear code selection
    e.clearSelection();
  }
  const getTextToCopy = function(trigger) {
      const codeEl = trigger.previousElementSibling.cloneNode(true);
      for (const childEl of codeEl.children) {
        if (isCodeAnnotation(childEl)) {
          childEl.remove();
        }
      }
      return codeEl.innerText;
  }
  const clipboard = new window.ClipboardJS('.code-copy-button:not([data-in-quarto-modal])', {
    text: getTextToCopy
  });
  clipboard.on('success', onCopySuccess);
  if (window.document.getElementById('quarto-embedded-source-code-modal')) {
    // For code content inside modals, clipBoardJS needs to be initialized with a container option
    // TODO: Check when it could be a function (https://github.com/zenorocha/clipboard.js/issues/860)
    const clipboardModal = new window.ClipboardJS('.code-copy-button[data-in-quarto-modal]', {
      text: getTextToCopy,
      container: window.document.getElementById('quarto-embedded-source-code-modal')
    });
    clipboardModal.on('success', onCopySuccess);
  }
    var localhostRegex = new RegExp(/^(?:http|https):\/\/localhost\:?[0-9]*\//);
    var mailtoRegex = new RegExp(/^mailto:/);
      var filterRegex = new RegExp('/' + window.location.host + '/');
    var isInternal = (href) => {
        return filterRegex.test(href) || localhostRegex.test(href) || mailtoRegex.test(href);
    }
    // Inspect non-navigation links and adorn them if external
 	var links = window.document.querySelectorAll('a[href]:not(.nav-link):not(.navbar-brand):not(.toc-action):not(.sidebar-link):not(.sidebar-item-toggle):not(.pagination-link):not(.no-external):not([aria-hidden]):not(.dropdown-item):not(.quarto-navigation-tool):not(.about-link)');
    for (var i=0; i<links.length; i++) {
      const link = links[i];
      if (!isInternal(link.href)) {
        // undo the damage that might have been done by quarto-nav.js in the case of
        // links that we want to consider external
        if (link.dataset.originalHref !== undefined) {
          link.href = link.dataset.originalHref;
        }
      }
    }
  function tippyHover(el, contentFn, onTriggerFn, onUntriggerFn) {
    const config = {
      allowHTML: true,
      maxWidth: 500,
      delay: 100,
      arrow: false,
      appendTo: function(el) {
          return el.parentElement;
      },
      interactive: true,
      interactiveBorder: 10,
      theme: 'quarto',
      placement: 'bottom-start',
    };
    if (contentFn) {
      config.content = contentFn;
    }
    if (onTriggerFn) {
      config.onTrigger = onTriggerFn;
    }
    if (onUntriggerFn) {
      config.onUntrigger = onUntriggerFn;
    }
    window.tippy(el, config); 
  }
  const noterefs = window.document.querySelectorAll('a[role="doc-noteref"]');
  for (var i=0; i<noterefs.length; i++) {
    const ref = noterefs[i];
    tippyHover(ref, function() {
      // use id or data attribute instead here
      let href = ref.getAttribute('data-footnote-href') || ref.getAttribute('href');
      try { href = new URL(href).hash; } catch {}
      const id = href.replace(/^#\/?/, "");
      const note = window.document.getElementById(id);
      if (note) {
        return note.innerHTML;
      } else {
        return "";
      }
    });
  }
  const xrefs = window.document.querySelectorAll('a.quarto-xref');
  const processXRef = (id, note) => {
    // Strip column container classes
    const stripColumnClz = (el) => {
      el.classList.remove("page-full", "page-columns");
      if (el.children) {
        for (const child of el.children) {
          stripColumnClz(child);
        }
      }
    }
    stripColumnClz(note)
    if (id === null || id.startsWith('sec-')) {
      // Special case sections, only their first couple elements
      const container = document.createElement("div");
      if (note.children && note.children.length > 2) {
        container.appendChild(note.children[0].cloneNode(true));
        for (let i = 1; i < note.children.length; i++) {
          const child = note.children[i];
          if (child.tagName === "P" && child.innerText === "") {
            continue;
          } else {
            container.appendChild(child.cloneNode(true));
            break;
          }
        }
        if (window.Quarto?.typesetMath) {
          window.Quarto.typesetMath(container);
        }
        return container.innerHTML
      } else {
        if (window.Quarto?.typesetMath) {
          window.Quarto.typesetMath(note);
        }
        return note.innerHTML;
      }
    } else {
      // Remove any anchor links if they are present
      const anchorLink = note.querySelector('a.anchorjs-link');
      if (anchorLink) {
        anchorLink.remove();
      }
      if (window.Quarto?.typesetMath) {
        window.Quarto.typesetMath(note);
      }
      // TODO in 1.5, we should make sure this works without a callout special case
      if (note.classList.contains("callout")) {
        return note.outerHTML;
      } else {
        return note.innerHTML;
      }
    }
  }
  for (var i=0; i<xrefs.length; i++) {
    const xref = xrefs[i];
    tippyHover(xref, undefined, function(instance) {
      instance.disable();
      let url = xref.getAttribute('href');
      let hash = undefined; 
      if (url.startsWith('#')) {
        hash = url;
      } else {
        try { hash = new URL(url).hash; } catch {}
      }
      if (hash) {
        const id = hash.replace(/^#\/?/, "");
        const note = window.document.getElementById(id);
        if (note !== null) {
          try {
            const html = processXRef(id, note.cloneNode(true));
            instance.setContent(html);
          } finally {
            instance.enable();
            instance.show();
          }
        } else {
          // See if we can fetch this
          fetch(url.split('#')[0])
          .then(res => res.text())
          .then(html => {
            const parser = new DOMParser();
            const htmlDoc = parser.parseFromString(html, "text/html");
            const note = htmlDoc.getElementById(id);
            if (note !== null) {
              const html = processXRef(id, note);
              instance.setContent(html);
            } 
          }).finally(() => {
            instance.enable();
            instance.show();
          });
        }
      } else {
        // See if we can fetch a full url (with no hash to target)
        // This is a special case and we should probably do some content thinning / targeting
        fetch(url)
        .then(res => res.text())
        .then(html => {
          const parser = new DOMParser();
          const htmlDoc = parser.parseFromString(html, "text/html");
          const note = htmlDoc.querySelector('main.content');
          if (note !== null) {
            // This should only happen for chapter cross references
            // (since there is no id in the URL)
            // remove the first header
            if (note.children.length > 0 && note.children[0].tagName === "HEADER") {
              note.children[0].remove();
            }
            const html = processXRef(null, note);
            instance.setContent(html);
          } 
        }).finally(() => {
          instance.enable();
          instance.show();
        });
      }
    }, function(instance) {
    });
  }
      let selectedAnnoteEl;
      const selectorForAnnotation = ( cell, annotation) => {
        let cellAttr = 'data-code-cell="' + cell + '"';
        let lineAttr = 'data-code-annotation="' +  annotation + '"';
        const selector = 'span[' + cellAttr + '][' + lineAttr + ']';
        return selector;
      }
      const selectCodeLines = (annoteEl) => {
        const doc = window.document;
        const targetCell = annoteEl.getAttribute("data-target-cell");
        const targetAnnotation = annoteEl.getAttribute("data-target-annotation");
        const annoteSpan = window.document.querySelector(selectorForAnnotation(targetCell, targetAnnotation));
        const lines = annoteSpan.getAttribute("data-code-lines").split(",");
        const lineIds = lines.map((line) => {
          return targetCell + "-" + line;
        })
        let top = null;
        let height = null;
        let parent = null;
        if (lineIds.length > 0) {
            //compute the position of the single el (top and bottom and make a div)
            const el = window.document.getElementById(lineIds[0]);
            top = el.offsetTop;
            height = el.offsetHeight;
            parent = el.parentElement.parentElement;
          if (lineIds.length > 1) {
            const lastEl = window.document.getElementById(lineIds[lineIds.length - 1]);
            const bottom = lastEl.offsetTop + lastEl.offsetHeight;
            height = bottom - top;
          }
          if (top !== null && height !== null && parent !== null) {
            // cook up a div (if necessary) and position it 
            let div = window.document.getElementById("code-annotation-line-highlight");
            if (div === null) {
              div = window.document.createElement("div");
              div.setAttribute("id", "code-annotation-line-highlight");
              div.style.position = 'absolute';
              parent.appendChild(div);
            }
            div.style.top = top - 2 + "px";
            div.style.height = height + 4 + "px";
            div.style.left = 0;
            let gutterDiv = window.document.getElementById("code-annotation-line-highlight-gutter");
            if (gutterDiv === null) {
              gutterDiv = window.document.createElement("div");
              gutterDiv.setAttribute("id", "code-annotation-line-highlight-gutter");
              gutterDiv.style.position = 'absolute';
              const codeCell = window.document.getElementById(targetCell);
              const gutter = codeCell.querySelector('.code-annotation-gutter');
              gutter.appendChild(gutterDiv);
            }
            gutterDiv.style.top = top - 2 + "px";
            gutterDiv.style.height = height + 4 + "px";
          }
          selectedAnnoteEl = annoteEl;
        }
      };
      const unselectCodeLines = () => {
        const elementsIds = ["code-annotation-line-highlight", "code-annotation-line-highlight-gutter"];
        elementsIds.forEach((elId) => {
          const div = window.document.getElementById(elId);
          if (div) {
            div.remove();
          }
        });
        selectedAnnoteEl = undefined;
      };
        // Handle positioning of the toggle
    window.addEventListener(
      "resize",
      throttle(() => {
        elRect = undefined;
        if (selectedAnnoteEl) {
          selectCodeLines(selectedAnnoteEl);
        }
      }, 10)
    );
    function throttle(fn, ms) {
    let throttle = false;
    let timer;
      return (...args) => {
        if(!throttle) { // first call gets through
            fn.apply(this, args);
            throttle = true;
        } else { // all the others get throttled
            if(timer) clearTimeout(timer); // cancel #2
            timer = setTimeout(() => {
              fn.apply(this, args);
              timer = throttle = false;
            }, ms);
        }
      };
    }
      // Attach click handler to the DT
      const annoteDls = window.document.querySelectorAll('dt[data-target-cell]');
      for (const annoteDlNode of annoteDls) {
        annoteDlNode.addEventListener('click', (event) => {
          const clickedEl = event.target;
          if (clickedEl !== selectedAnnoteEl) {
            unselectCodeLines();
            const activeEl = window.document.querySelector('dt[data-target-cell].code-annotation-active');
            if (activeEl) {
              activeEl.classList.remove('code-annotation-active');
            }
            selectCodeLines(clickedEl);
            clickedEl.classList.add('code-annotation-active');
          } else {
            // Unselect the line
            unselectCodeLines();
            clickedEl.classList.remove('code-annotation-active');
          }
        });
      }
  const findCites = (el) => {
    const parentEl = el.parentElement;
    if (parentEl) {
      const cites = parentEl.dataset.cites;
      if (cites) {
        return {
          el,
          cites: cites.split(' ')
        };
      } else {
        return findCites(el.parentElement)
      }
    } else {
      return undefined;
    }
  };
  var bibliorefs = window.document.querySelectorAll('a[role="doc-biblioref"]');
  for (var i=0; i<bibliorefs.length; i++) {
    const ref = bibliorefs[i];
    const citeInfo = findCites(ref);
    if (citeInfo) {
      tippyHover(citeInfo.el, function() {
        var popup = window.document.createElement('div');
        citeInfo.cites.forEach(function(cite) {
          var citeDiv = window.document.createElement('div');
          citeDiv.classList.add('hanging-indent');
          citeDiv.classList.add('csl-entry');
          var biblioDiv = window.document.getElementById('ref-' + cite);
          if (biblioDiv) {
            citeDiv.innerHTML = biblioDiv.innerHTML;
          }
          popup.appendChild(citeDiv);
        });
        return popup.innerHTML;
      });
    }
  }
});
</script>
</div> <!-- /content -->




</body></html>
