all: fonts demo.pdf
	latexmk -pdf -lualatex demo.tex

demo.pdf: demo.tex fonts
	latexmk -pdf -lualatex demo.tex

fonts:  NimbusSanL-ReguItal.ttf NimbusSanL-ReguItal-20.ttf NimbusSanL-ReguItal-40.ttf NimbusSanL-ReguItal-60.ttf NimbusSanL-ReguItal-80.ttf NimbusSanL-ReguItal-100.ttf NimbusSanL-ReguItal-120.ttf

NimbusSanL-ReguItal-%.ttf: NimbusSanL-ReguItal.ttf
	../make-font-bolder --size "$*" NimbusSanL-ReguItal.ttf "$@"

.PHONY: all fonts
