#!/usr/bin/env perl

$pdf_mode         = 3;
$latex            = 'uplatex -halt-on-error -file-line-error -synctex=1';
$latex_silent     = "$latex -interaction=batchmode";
$bibtex           = 'upbibtex';
$dvipdf           = 'dvipdfmx %O -o %D %S';
$makeindex        = 'mendex %O -o %D %S';
