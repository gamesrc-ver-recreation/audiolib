Modified "Apogee Sound System" sources with multiple reconstructed versions
===========================================================================

This source tree covers a modification of the open-source release
of the Apogee Sound System, with the main goal being a reconstruction
of sources matching multiple released binaries.

In case you try making binaries from this codebase, the usual caveat is
that even with what appear to be the right tools, you might not get an exact
binary as it was released back in the days, for multiple technical reasons.

List of covered versions
------------------------

With the right tools, this patched codebase can be used to reproduce
an Apogee Sound System (ASS) library (AUDIOLIB) that at least *behaves closely*
(albeit not necessarily being fully identical) to the ones linked into
the EXEs from the following original releases:

- Rise of the Triad 1.3 (4 Apogee releases and 2 Lasersoft releases).
Evidence shows that it's ASS 1.04.
- Shadow Warrior 1.0-1.2. This one is matching ASS 1.09, and should differ
just by one register access and garbage data inserted by Watcom 10.0b.
- Duke Nukem 3D: Atomic Edition 1.4-1.5, i.e., ASS 1.1. Except for
the aforementioned garbage data, this one should perfectly match.
- Blood 0.91-1.21, i.e., ASS 1.12. Except for
the aforementioned garbage data, this one should perfectly match.
The Apogee Sound System (and Rise of the Triad) sources as released
in December 2002 should include two copies of ASS 1.12's LIB file.

Also covered here are:

- A few variations of a revision matching sources and
other LIB files from the aforementioned 2002 release.

The originally released `AUDIO.MAK` file was used as a base, albeit
with minor influences from `AUDIO2.MAK` (also part of the 2002 release).

List of releases by output directory names
------------------------------------------

- `AL950724`: Apogee Sound System v1.04 - imperfect recreation.
- `AL_109`: Apogee Sound System v1.09, with one minor bit of imperfection.
- `AL_11`: Apogee Sound System v1.1.
- `AL_112`: Apogee Sound System v1.12.
- `AL_ROTTB`: AUDIO_WF.LIB files from the aforementioned sources as released
in December 2002, under `rott\AUDIO_WF.LIB` and `audiolib\OBJ\AUDIO_WF.LIB`.
- `AL_ROTTD`: Same as `AL_ROTTB`, but a debugging build instead of a production
one. Matching 2002's `audiolib\AUDIO_WF.LIB` and `audiolib\OBJDB\AUDIO_WF.LIB`.
- `AL_ROTTS`: Same as `AL_ROTTB`, but with James' surname using ASCII characters
only. Matching the 2002 release's sources, emphasis on `FX_MAN.C` and `MUSIC.C`.

Technical details of the original LIB files (rather than any recreated one)
---------------------------------------------------------------------------

|        Version        |  Bytes |               MD5                |  CRC-32  |
|-----------------------|--------|----------------------------------|----------|
|          1.04         | 383488 | c62ddcb15d9f787e3f0ef4ef160c5f8e | f4e391e0 |
|          1.09         | 402944 | 6fb06434ac293a86642066c53f043425 | e113cd8d |
|          1.1          | 384000 | c00888742acee57e61cf5514c9bd6fd0 | 66ce8582 |
|          1.12         | 381952 | b590738792dfd721b94033c00248e880 | 7bf15317 |
| 2002 production build | 384000 | e4d7b843f9f61ba087d2fa47e244dc9c | aec91e7a |
| 2002 debugging build  | 468480 | 3df9ccb623cd0f5babc994eee128f6bb | 1393241e |

Prerequisites for building each LIB
-----------------------------------

Required tools:

- Watcom C 10.0b (and no other version).
- Turbo Assembler 3.1.

Notes before trying to build
----------------------------

- This may depend on luck. In fact, as of now, it *is* known that you'll get
a different LIB file, although it should be equivalent in behaviors in the
cases of versions 1.09 and later, and identical for 1.1 and later up to
miscellaneous Watcom-generated data.
- Even if code is perfectly matching, the OBJ/LIB files
will still cover data like original paths and timestamps
of source files, including local and system headers.

For reference, a list of such original paths in use follows.
- System headers: c:\ln\watcom\h for versions 1.04-1.1, C:\W10\H for 1.12,
C:\WATCOM\.\H for the other `AUDIO_WF.LIB` files of the 2002 release.
- Apogee Sound System source dir: C:\PRG\AUDIO\source for versions 1.04 and 1.2,
D:\PRG\AUDIO\source for 1.09-1.1, C:\ROTT\SRC\AUDIOLIB\source for
the 2002 release's other `AUDIO_WF.LIB` files.

Building the library
--------------------

1. Ensure the matching Watcom C and Turbo Assembler versions are ready
in the environment.
2. Use DOBUILD.BAT, selecting the output directory name (e.g., `AL_109`).
3. Hopefully, you should get a LIB file that *behaves close to the original*,
albeit probably not 100% identical byte-by-byte.

Known issues
------------

There are known differences in the output that should be listed,
compared to AUDIOLIB 1.04 (as a part of ROTT 1.3):
- Small differences in `FX_SetupCard` and `FX_Init` from `FX_MAN.C`.
- Larger differences in `MULTIVOC.C:MV_ServiceVoc`. In fact, that has been the
*most* problematic part for now. The function body's length is even different
from the original. There's a little bit of a hack that can be used to force
the original length (look for an instance of "#if 0"), but remember this:
By enabling the hack, you MODIFY the behaviors of `MV_ServiceVoc`!

From AUDIOLIB and ROTT:
- Misc. global variables are to be found in locations differing
from the originals in the recreated ROTT EXE's layout.

For 1.09 (used in SW 1.0-1.2), there's still a minor difference in
`FX_SetupCard`, but it shouldn't have an impact on the behaviors.

With 1.1 (Duke3D 1.4-1.5) and 1.12 (Blood 0.91-1.21),
the generated code should essentially be identical.

Furthermore, most chances are that paddings between string literals, or
possibly less commonly between global variables, will be filled with different
values. Reason is that apparently, for each compilation unit, Watcom C fills
a buffer with the input source code (or at least a variant of it), and then
it *reuses* the buffer for the relevant strings or global variables.
