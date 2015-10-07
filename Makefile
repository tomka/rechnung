# Makefile :-- install rechnung.
# Copyright (C) 2010 Tom Kazimiers (tom AT voodoo-arts.net)
# Based on the Makefile of emp latex package by Thorsten Ohl
# (Thorsten.Ohl@Physik.TH-Darmstadt.de)
#
# Rechnung is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2, or (at your option)
# any later version.
#
# Rechnung is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
# $Id: Makefile,v 1.0 2010/02/25 21:14:41 kazimiers Exp $
#
########################################################################

VERSION = 1
RELEASE = 00
STATUS  =

########################################################################

# Directories
prefix = $(HOME)
texdir = $(prefix)/tex/inputs
docdir = $(texdir)/doc

# Commands
INSTALL = install -c -m 755
INSTALL_DATA = install -c -m 644
# INSTALL = cp
# INSTALL_DATA = cp

LATEX = latex
MAKEINDEX = makeindex
DVIPS = dvips
DFLAGS =

########################################################################
# No user serviceable parts below:
########################################################################

RESOLVE_XREF = \
  $(LATEX) $*.drv && \
  while grep 'Rerun to get cross-references right\.' $*.log; \
  do \
    $(LATEX) $*.drv; \
  done

RUN_MAKEINDEX = \
  $(MAKEINDEX) -s gind.ist -o $*.ind $*.idx && \
  $(MAKEINDEX) -s gglo.ist -o $*.gls $*.glo

all: rechnung.sty rechnung.drv

man: rechnungman.dvi

ps: rechnung.ps

dvi: rechnung.dvi

install: all
	mkdir -p $(texdir)
	$(INSTALL_DATA) rechnung.sty $(texdir)

install.doc: all
	mkdir -p $(docdir)
	$(INSTALL_DATA) rechnung.dtx $(docdir)
	$(INSTALL_DATA) rechnung.drv $(docdir)
	$(INSTALL_DATA) rechnungman.drv $(docdir)

uninstall:
	rm -f $(texdir)/rechnung.sty

uninstall.doc:
	rm -f $(docdir)/rechnung.dtx
	rm -f $(docdir)/rechnung.drv
	rm -f $(docdir)/rechnungman.drv

rechnung.sty: rechnung.dtx rechnung.ins
	$(LATEX) rechnung.ins

rechnung.drv rechnungman.drv: rechnung.sty

rechnung.dvi: rechnung.dtx rechnung.drv rechnung.sty
	-$(LATEX) $*.drv
	$(RUN_MAKEINDEX)
	$(RESOLVE_XREF)

rechnungman.dvi: rechnung.dtx rechnungman.drv rechnung.sty
	-$(LATEX) $*.drv
	$(RUN_MAKEINDEX)
	$(RESOLVE_XREF)

manual.ps.gz: manual.ps
	gzip < $< > $@

manual.ps: rechnungman.dvi $(MANPICS)
	$(DVIPS) $(DFLAGS) -o $@ $<

rechnung.ps: rechnung.dvi $(MANPICS)
	$(DVIPS) $(DFLAGS) -o $@ $<

clean:
	rm -f *.mp *.rawmp *.[0-9]* \
	      *.log *.dvi *.aux *.toc *.ilg *.glo *.gls *.idx *.ind \
	      *.ps *.mpx '#*#' *~ .*~

realclean: clean
	rm -f rechnung.sty rechnung.drv rechnungman*

distclean: realclean
