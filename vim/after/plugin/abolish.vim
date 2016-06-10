" Exit if :Abolish isn't available.
if !exists(':Abolish')
    finish
endif

Abolish question{,n}a{,i}r{e,es,y,ies} question{n}a{i}r{e,es}
" Abolish question{aire,aires,airy,airies,ary,aries,nairy,naries,nary,naries} question{naire,naires}
Abolish {,H}CFBM25 BM25{,H}C
