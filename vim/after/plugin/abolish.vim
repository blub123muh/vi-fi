" Exit if :Abolish isn't available.
if !exists(':Abolish')
    finish
endif

" Abolish questio{n,nn}ar{y,ies} questio{nn}air{e,es}

Abolish question{airy,airies,nairy,naries,ary,aries,nary,naries} question{naire,naires}
