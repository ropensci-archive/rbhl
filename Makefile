all: move rmd2md

move:
		cp inst/vign/rbhl_vignette.md vignettes/

rmd2md:
		cd vignettes;\
		mv rbhl_vignette.md rbhl_vignette.Rmd
