all: move pandoc rmd2md cleanup

vignettes: 
		cd inst/vign;\
		Rscript -e 'library(knitr); knit("rbhl_vignette.Rmd")'

move:
		cp inst/vign/rbhl_vignette.md vignettes/;\
		mv inst/vign/figure/ vignettes/

pandoc:
		cd vignettes;\
		pandoc -H margins.sty rbhl_vignette.md -o rbhl_vignette.pdf;\
		pandoc -H margins.sty rbhl_vignette.md -o rbhl_vignette.html

rmd2md:
		cd vignettes;\
		cp rbhl_vignette.md rbhl_vignette.Rmd

cleanup:
		cd vignettes;\
		rm -rf figure