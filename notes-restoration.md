*** WARNING: DO NOT TRY TOO HARD TO BUILD ANY OF THE ORIGINAL LIBRARIES! ***

Please remember that any little difference, not matter how small it is,
can lead to a vastly different LIB layout. This includes differences in:

- The development tools (or parts of such); For instance, a compiler, a
librarian, an assembler, or even a support library or header. A version number
is not a promise for having the exact tool used to reproduce some library.
- The order in which source code files are listed in a given project or
makefile.
- Project settings.
- Source file specific settings in such a project.
- The order in which source code files are passed to a librarian.
- Any modification to a source code file (especially a header file).
- More than any of the above.

Following the warning, a description of the ways in which the library was
reproduced is given.

With the right tools, this patched codebase can be used to reproduce
an Apogee Sound System (ASS) library (AUDIOLIB) that at least *behaves closely*
(but is *not* identical) to the one embedded in the EXEs from the following
original releases:

- Rise of the Triad, Shareware + Registered + Super CD + Site License
releases, Apogee v1.3. Evidence shows that it's *probably* ASS v1.04.

The originally released AUDIO.MAK file was used as a base, albeit with minor
influences from AUDIO2.MAK (as available with the released ROTT sources).
You shall *not* call "wmake" on your own anymore. Instead, use BUILD.BAT.

List of releases by LIB/directory file names
--------------------------------------------

- AL950724: Apogee Sound System v1.04.

How to identify code changes (and what's this ASSREV thing)?
------------------------------------------------------------

IGNORE THIS FOR NOW. What matters, though, is that wmake, via AUDIO.MAK,
manually sets LIBVER_ASSREV to the desired LIB file revision string,
which is also used as the output LIB's filename (without the file extension).

Note that only C sources (and not ASM) are covered by the above for now.

LIBVER_ASSREV is defined for the currently only build (of AL950724).
It is intended to represent a revision of development of
the Apogee Sound System codebase. Usually, this revision value is based
on some *guessed* date (e.g., an original modification date of the LIB),
but this does not have to be the case.

These are two good reasons for using ASSREV as described above, referring
to similar work done for Wolfenstein 3D EXEs (built with Borland C++):

- WL1AP12 and WL6AP11 share the same code revision. However, WL1AP11
is of an earlier revision. Thus, the usage of WOLFREV can be
less confusing.
- WOLFREV is a good way to describe the early March 1992 build. While
it's commonly called just "alpha" or "beta", GAMEVER_WOLFREV
gives us a more explicit description.

What is this based on
---------------------

This codebase is based on the Apogee Sound System sources as originally
released by Apogee Software, Ltd. (DBA 3D Realms) on 2002, along with
the Rise of the Triad sources. It still depends on additional
binary LIB files, being GF1_OSF.LIB and PAWE32.LIB.

How was the makefile (and a bit more) modified from the original
----------------------------------------------------------------

- The codebase was originally modified for ROTT, Apogee v1.3. This covers
what is guessed to be Apogee Sound System v1.04. As in AUDIO2.MAK from
the released sources, ADLIBFX.OBJ and PCFX.OBJ are now dependencies for
v1.04. In addition, BLASTOLD.OBJ is a dependency instead of BLASTER.OBJ.
MV_MIX5.OBJ is another dependency, while MV_MIX.OBJ and MV_MIX16.OBJ
are *not*. As in the released AUDIO.MAK file (rather than AUDIO2.MAK),
MVREVERB.OBJ is *still* a dependency, too. Finally, AUDIO.MAK was
modified so the library, as well as the new objects files, are
created in a separate directory, depending on the version.
- Various source code files were modified. As hinted above, BLASTOLD.C is
now used instead of BLASTER.C for v1.04 (although BLASTER.H is still used).
- There may be at least one other difference.

Building the LIB
================

Required tools:

- Watcom C 10.0b (and no other version), for Apogee Sound System v1.04.
- Turbo Assembler v3.1 (from Borland C++ 3.1).

Notes before trying to build anything:

- This may depend on luck. In fact, as of now, it *is* known that you'll get
a different LIB.
- Use BUILD.BAT to build the library (don't call wmake directly),
or CLEAN.BAT to remove the library and created object files.

Building the LIB
----------------

1. Use BUILD.BAT, passing the corresponding LIB identifier
(the output LIB filename without the .LIB extension) as an argument.
2. Hopefully you should get a LIB that *behaves close to the original*,
but do *not* expect it to be identical.

Known issues
------------

There are known differences in the output that should be listed,
compared to AUDIOLIB v1.04 (as a part of ROTT Apogee v1.3):
- Small differences in FX_SetupCard and FX_Init from FX_MAN.C.
- Larger differences in MULTIVOC.C:MV_ServiceVoc. In fact, this is been the
*most* problematic part for now. The function body's length is even different
from the original. There's a little bit of a HACK that can be used to force
the original length (look for an instance of "#if 0"), but remember this:
By enabling the hack, you MODIFY the behaviors of MV_ServiceVoc!
From AUDIOLIB and ROTT:
- Misc. global variables found in locations differing from the originals
in the recreated ROTT EXE layout.

Furthermore, most chances are that paddings between string literals, or
possibly less commonly between global variables, will be filled with different
values. Reason is that apparently, for each compilation unit, Watcom C fills
a buffer with the input source code (or at least a variant of it), and then
it *reuses* the buffer for the relevant strings or global variables.
