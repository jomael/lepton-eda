# lepton-data-dirs.m4                                   -*-Autoconf-*-
# serial 2.0

dnl Lepton EDA data and configuration directories
dnl Copyright (C) 2009, 2016  Peter Brett <peter@peter-b.co.uk>
dnl Copyright (C) 2018-2019 Lepton EDA Contributors
dnl
dnl This program is free software; you can redistribute it and/or modify
dnl it under the terms of the GNU General Public License as published by
dnl the Free Software Foundation; either version 2 of the License, or
dnl (at your option) any later version.
dnl
dnl This program is distributed in the hope that it will be useful,
dnl but WITHOUT ANY WARRANTY; without even the implied warranty of
dnl MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
dnl GNU General Public License for more details.
dnl
dnl You should have received a copy of the GNU General Public License
dnl along with this program; if not, write to the Free Software
dnl Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

# Check where Lepton data and configuration should be stored.
AC_DEFUN([AX_DATA_DIRS],
[
  AC_PREREQ([2.60])dnl
  AC_REQUIRE([AX_OPTION_RELOCATABLE])dnl

  # Check where to install ordinary data files (e.g. symbols and
  # gnetlist backends)
  LEPTONDATADIR="$datarootdir/lepton-eda"

  # Check where to install rc files.  The rc directory name
  # defaults to "$sysconfdir/" in order to comply with the GNU &
  # Linux FHS guidelines.
  AC_ARG_WITH([rcdir],
    AS_HELP_STRING([--with-rcdir[[[=DIR]]]],
      [install system config in specific DIR]),
    [ if test "X$with_rcdir" != "Xno"; then
        if test "X$with_rcdir" = "Xyes"; then
          LEPTONRCDIR="$sysconfdir/lepton-eda"
        else
          LEPTONRCDIR="$with_rcdir"
        fi
      else
        LEPTONRCDIR="$LEPTONDATADIR"
      fi ],
      LEPTONRCDIR="$LEPTONDATADIR")

  # Now define some preprocessor symbols with the *expanded* values,
  # but only if not doing a relocatable build.
  if test "x$enable_relocatable" != "xyes"; then
    LEPTONDATADIR_expand=`eval "echo $LEPTONDATADIR" | sed -e"s:^NONE:$ac_default_prefix:"`
    AC_DEFINE_UNQUOTED([LEPTONDATADIR], ["LEPTONDATADIR_expand"],
      [Define to Lepton EDA shared data directory.
Only liblepton should use this - apps should use eda_get_system_data_dirs()])

    if test "x$LEPTONRCDIR" != "x"; then
      LEPTONRCDIR_expand=`eval "echo $LEPTONRCDIR" | sed -e"s:^NONE:$ac_default_prefix:"`
      AC_DEFINE_UNQUOTED([LEPTONRCDIR], ["$LEPTONRCDIR_expand"],
        [Define to Lepton EDA rc directory if different from LEPTONDATADIR.
Only liblepton should use this - apps should use eda_get_system_data_dirs()])
    fi
  fi

  if test "x$LEPTONRCDIR" = "x"; then
    LEPTONRCDIR=$LEPTONDATADIR
  fi

  AC_SUBST([LEPTONDATADIR])
  AC_SUBST([LEPTONRCDIR])

  AC_MSG_CHECKING([where to install Lepton shared data (LEPTONDATADIR)])
  AC_MSG_RESULT([$LEPTONDATADIR])

  AC_MSG_CHECKING([where to install Lepton rc files (LEPTONRCDIR)])
  AC_MSG_RESULT([$LEPTONRCDIR])

  # create #define LEPTON_SCM_PRECOMPILE_DIR in config.h:
  #
  AC_DEFINE_UNQUOTED([LEPTON_SCM_PRECOMPILE_DIR],
                     ["$LEPTONDATADIR_expand/ccache"],
                     [precompiled scm files dir])

  AC_SUBST([LEPTON_SCM_PRECOMPILE_DIR], ["$LEPTONDATADIR_expand/ccache"])

  AC_DEFINE_UNQUOTED([BITMAP_DIRECTORY],
                     ["$LEPTONDATADIR_expand/bitmap"],
                     [directory with bitmaps])

  AC_SUBST([BITMAP_DIRECTORY], ["$LEPTONDATADIR_expand/bitmap"])

])dnl AX_DATA_DIRS