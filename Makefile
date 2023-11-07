LATEXMK = latexmk
LATEXMKFLAGS = -pdflua -shell-escape -interaction=nonstopmode
SOURCES = $(wildcard *.tex)
OBJECTS = $(patsubst %.tex, %, $(SOURCES))

WATCH ?= 0
ifeq ($(WATCH), 1)
	LATEXMKFLAGS += -pvc
endif

%:%.tex
	$(LATEXMK) $(LATEXMKFLAGS) $<

.PHONY: all
all: $(OBJECTS)

.PHONY: clean
clean:
	latexmk -c

.DEFAULT_GOAL := main
