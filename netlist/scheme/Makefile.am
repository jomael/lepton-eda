M4=		@M4@
PCBM4DIR=	@PCBM4DIR@
PCBCONFDIR=	@PCBCONFDIR@

scmdatadir = @LEPTONDATADIR@/scheme
nobase_scmdata_DATA = $(DIST_SCM_BACKENDS) $(DIST_SCM_BACKENDS_COMMON) $(BUILT_SCM)


config-netlist.scm: config-netlist.scm.in
	sed -e 's,[@]backenddir[@],$(scmdatadir)/backend,g' < $(srcdir)/$@.in > $@

gafrcddir = @LEPTONDATADIR@/scheme/autoload
gafrcd_DATA = config-netlist.scm


DIST_SCM_BACKENDS = \
	backend/gnet-allegro.scm \
	backend/gnet-bae.scm \
	backend/gnet-bom.scm \
	backend/gnet-bom2.scm \
	backend/gnet-calay.scm \
	backend/gnet-cascade.scm \
	backend/gnet-drc.scm \
	backend/gnet-drc2.scm \
	backend/gnet-eagle.scm \
	backend/gnet-ewnet.scm \
	backend/gnet-futurenet2.scm \
	backend/gnet-geda.scm \
	backend/gnet-gossip.scm \
	backend/gnet-liquidpcb.scm \
	backend/gnet-makedepend.scm \
	backend/gnet-mathematica.scm \
	backend/gnet-maxascii.scm \
	backend/gnet-osmond.scm \
	backend/gnet-pads.scm \
	backend/gnet-partslist1.scm \
	backend/gnet-partslist2.scm \
	backend/gnet-partslist3.scm \
	backend/gnet-PCB.scm \
	backend/gnet-pcbpins.scm \
	backend/gnet-protelII.scm \
	backend/gnet-redac.scm \
	backend/gnet-spice-sdb.scm \
	backend/gnet-spice.scm \
	backend/gnet-switcap.scm \
	backend/gnet-systemc.scm \
	backend/gnet-tango.scm \
	backend/gnet-tEDAx.scm \
	backend/gnet-vams.scm \
	backend/gnet-verilog.scm \
	backend/gnet-vhdl.scm \
	backend/gnet-vipec.scm

DIST_SCM_BACKENDS_COMMON = \
	backend/spice/common.scm

TESTS = unit-tests/test-netlist-load-path.scm \
	unit-tests/test-component-library-search.scm \
	unit-tests/test-netlist-attrib.scm \
	unit-tests/test-netlist-partlist.scm

TEST_EXTENSIONS = .scm
# $(srcdir) and $(builddir) are added here and not in
# AM_SCM_LOG_FLAGS below because guile must know where to find
# netlist modules before it runs tests
SCM_LOG_DRIVER = $(GUILE) \
	-L $(abs_top_srcdir)/liblepton/scheme \
	-L $(abs_top_builddir)/liblepton/scheme \
	-L $(abs_top_srcdir)/netlist/scheme \
	-L $(abs_top_builddir)/netlist/scheme \
	-L $(abs_top_srcdir)/symcheck/scheme \
	-L $(abs_top_builddir)/symcheck/scheme \
	--no-auto-compile -e main/with-toplevel -s unit-test.scm

AM_SCM_LOG_FLAGS = --
AM_TESTS_ENVIRONMENT = GUILE_AUTO_COMPILE=0

dist_noinst_DATA = unit-test.scm $(TESTS)

EXTRA_DIST = $(DIST_SCM_BACKENDS) $(DIST_SCM_BACKENDS_COMMON) $(SCM_SRCS) config-netlist.scm.in

SCM_SRCS=	backend/gnet-gsch2pcb.scm.in

BUILT_SCM=	backend/gnet-gsch2pcb.scm

SETVBUF_MODE = `$(GUILE) -c '(display (if (string= (minor-version) "0") "_IONBF" (quote (quote none))))'`

backend/gnet-gsch2pcb.scm: $(srcdir)/backend/gnet-gsch2pcb.scm.in
	if test "$(srcdir)" != "@builddir@" ; then \
		echo "creating directories" ; \
		$(MKDIR_P) @builddir@/backend ; \
	else \
		echo "source directory = build directory" ; \
	fi
	sed \
		-e 's;@m4@;${M4};g' \
		-e 's;@pcbm4dir@;${PCBM4DIR};g' \
		-e "s;@mode@;${SETVBUF_MODE};g" \
		$(srcdir)/backend/gnet-gsch2pcb.scm.in > $@

all-local:
	if test "$(srcdir)" != "@builddir@" ; then \
		echo "copying scheme files" ; \
		cp -f $(srcdir)/*.scm @builddir@/ ; \
	else \
		echo "source directory = build directory" ; \
	fi

clean-local:
	if test "$(srcdir)" != "@builddir@" ; then \
		echo "cleaning scheme files" ; \
		rm -f @builddir@/*.scm ; \
	else \
		echo "source directory = build directory" ; \
	fi

CLEANFILES = backend/gnet-gsch2pcb.scm $(bin_SCRIPTS) config-netlist.scm
