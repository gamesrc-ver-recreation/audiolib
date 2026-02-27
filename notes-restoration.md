Note: Certain details given in this document might or might not be out-of-date.
In particular, there hasn't really been any proper addition since the
introduction of the `AL_ROTT*` variants.

The originally released `AUDIO.MAK` file was used as a base, albeit with minor
influences from `AUDIO2.MAK` (as available with the released ROTT sources).
You shall *not* call "wmake" on your own anymore. Instead, use `DOBUILD.BAT`.

How to identify code changes (and what's this ASSREV thing)?
------------------------------------------------------------

Different values of `LIBVER_ASSREV` are defined for differing builds of the
library. It is intended to represent a revision of development of
the Apogee Sound System codebase. Usually, this revision value is based
on some *guessed* date (e.g., an original modification date of the LIB),
but this does not have to be the case.

Note that only C sources (and not ASM) are covered by the above for now.

Via `AUDIO.MAK`, Watcom Make (wmake) manually sets `LIBVER_ASSREV`
to the desired LIB file revision string.

These are two good reasons for using ASSREV as described above, referring
to similar work done for Wolfenstein 3D EXEs (built with Borland C++):

- WL1AP12 and WL6AP11 share the same code revision. However, WL1AP11
is of an earlier revision. Thus, the usage of WOLFREV can be
less confusing.
- WOLFREV is a good way to describe the early March 1992 build. While
it's commonly called just "alpha" or "beta", `GAMEVER_WOLFREV`
gives us a more explicit description.

What is this based on
---------------------

This codebase is based on the Apogee Sound System sources as originally
released by Apogee Software, Ltd. (DBA 3D Realms) on 2002, along with
the Rise of the Triad sources. It still depends on additional
binary LIB files, being `GF1_OSF.LIB` and `PAWE32.LIB`.

How was the makefile (and a bit more) modified from the original
----------------------------------------------------------------

- The codebase was originally modified for ROTT, Apogee v1.3. This covers
what is guessed to be Apogee Sound System v1.04. As in `AUDIO2.MAK` from
the released sources, `ADLIBFX.OBJ` and `PCFX.OBJ` are now dependencies for
v1.04. In addition, `BLASTOLD.OBJ` is a dependency instead of `BLASTER.OBJ`.
`MV_MIX5.OBJ` is another dependency, while `MV_MIX.OBJ` and `MV_MIX16.OBJ`
are *not*. As in the released `AUDIO.MAK` file (rather than `AUDIO2.MAK`),
`MVREVERB.OBJ` is *still* a dependency, too. Finally, `AUDIO.MAK` was
modified so the library, as well as the new objects files, are
created in a separate directory, depending on the version.
- Various source code files were modified. As hinted above, `BLASTOLD.C` is
now used instead of `BLASTER.C` for v1.04 (although `BLASTER.H` is still used).
- Recreated code of v1.1 (as used in Duke Nukem 3D: Atomic Edition 1.4-1.5)
was added later, somewhat more similar to 1.12 as released on 2002.
- Even later, 1.09 (matching Shadow Warrior 1.0-1.2) was added. Since almost
all changes were already applied during the (partial) recreation of 1.04,
this mostly covered changes to compared `LIBVER_ASSREV` values.
Additional checks related to GUS were added, though. A few bits of debugging
information were used in order to further improve the accuracy, even if
not by much. This comes to adding `#include "memcheck.h"` to a bunch
of C files, and similarly replacing "interrup.h" with "interrupt.h".
- There may be at least one other difference.
