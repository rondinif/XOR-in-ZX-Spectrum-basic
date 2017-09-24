# Performace test data sheet

---+---------------------------------+---------------+---------------+
   |                                 |    with FN    |  without FN   |
n  | xor mimic method method         |  x1   !  x256 |  x1   !  x256 |
---+---------------------------------+-------+-------+-------+-------+
01 | (a AND NOT b) OR (b AND NOT a)  |  0.24 | 34.18 |  0.22 | 23.74 |
02 | IF ((a) <> 0) <> ((b) <> 0)     |  #NA  | #NA   |  0.22 | 25.56 |
03 | NOT NOT a <> NOT NOT b          |  0.36 | 32.38 |  0.22 | 21.58 |
04 | (A-B)*(A-B)                     |  0.22 | 32.38 |  0.22 | 22.46 | 
05 | ABS (A-B)                       |  0.24 | 29.60 |  0.20 | 19.56 |
06 | NOT(A AND B) AND (A OR B)       |  0.26 | 33.66 |  0.20 | 23.48 |
---+---------------------------------+-------+-------+-------+-------+

[live performance test data sheet](   https://docs.google.com/spreadsheets/d/1gIcXWzl98PcUVWsTl_Q9AqaaVZWXGzfZoju-cEnj5f8/edit?usp=sharing)


# How to perform a test

``` bash
 cd ~/projects/so-test/46097574
 zmakebas -o base01.tap -n base01 base01.bas
 fuse --loading-sound --tape base01.tap
```

## Launching tests from VS Code IDE/Editor 
see: .vscode/task.json and scripts/test

# Project Dependencies
The he demo in development environment: ``` macOS Sierra 10.12.6 (16G29) Darwin Kernel Version 16.7.0: Thu Jun 15 17:36:27 PDT 2017; root:xnu-3789.70.16~2/RELEASE_X86_64 x86_64 ```
needs the following programs to be installed:
- zmakebas: convert text files into Spectrum Basic programs
- fuse: the free unix spectrum emulator

## zmakebas
Convert text files into Spectrum Basic programs.
see also:
[OS2World/APP-EMULATOR-zmakebas](https://github.com/OS2World/APP-EMULATOR-zmakebas)
[catseye/zmakebas : Our fork of zmakebas, a Spectrum BASIC tokenizer (text file → .TAP) [Public domain]](https://github.com/catseye/zmakebas)   
```
zmakebas - public domain by Russell Marks.

usage: zmakebas [-hlprv] [-a line] [-i incr] [-n speccy_filename]
                [-o output_file] [-s line] [input_file]

        -v      output version number.
        -a      set auto-start line of basic file (default none).
        -h      give this usage help.
        -i      in labels mode, set line number incr. (default 2).
        -l      use labels rather than line numbers.
        -n      set Spectrum filename (to be given in tape header).
        -o      specify output file (default `out.tap').
        -p      output .p instead (set ZX81 mode).
        -r      output raw headerless file (default is .tap file).
        -s      in labels mode, set starting line number (default 10).
```

``` bash 
mkdir tmp
echo tmp >> .gitignore
cd tmp 
curl -o zmakebas-1.5.zip -L  -v  https://www.dropbox.com/s/tcu58zie6lyhnv5/zmakebas-1.5.zip?dl=1 
# ... [snipped-out verbose output] 
# { [15553 bytes data]
# 100  110k  100  110k    0     0  30482      0  0:00:03  0:00:03 --:--:--  134k
# * Connection #1 to host dl.dropboxusercontent.com left intact

unzip zmakebas-1.5.zip -d ..
# Archive:  zmakebas-1.5.zip
#   creating: ../zmakebas-1.5/
# ...  inflating: ../zmakebas-1.5/.DS_Store  

ll ../zmakebas-1.5/
# total 616
# -rw-r--r--  1 ronda  staff    1647 10 Ago  2015 ChangeLog
# -rw-------  1 ronda  staff    1023 26 Lug  2015 Makefile
# -rw-------  1 ronda  staff    1521  6 Ago  2014 README
# -rw-r--r--  1 ronda  staff     357  6 Ago  2014 README_ADDENDUM
# -rw-------  1 ronda  staff    2196 25 Mar  1998 demo.bas
# -rw-------  1 ronda  staff    1756 24 Mar  1998 demolbl.bas
# -rw-------  1 ronda  staff     732 22 Nov  1999 mkinstalldirs
# -rw-------  1 ronda  staff    8745 26 Lug  2015 zmakebas.1
# -rw-r--r--  1 ronda  staff   43199 26 Lug  2015 zmakebas.c
# -rw-r--r--  1 ronda  staff  222810 10 Ago  2015 zmakebas.exe
# -rw-------  1 ronda  staff    1199 26 Lug  2015 zx81-basic-demo.bas

cd ../zmakebas-1.5
make
# gcc -O -Wall -DHAVE_GETOPT   -c -o zmakebas.o zmakebas.c
# ... [snipped-out verbose output and warning messages ] 
# 41 warnings generated.
# gcc -O -Wall -DHAVE_GETOPT -o zmakebas zmakebas.o
sudo make install

cd ..
echo zmakebas-1.5 >> .gitignore
```

## fuse
[Fuse - the Free Unix Spectrum Emulator](http://fuse-emulator.sourceforge.net)
### installing Free Unix Spectrum Emulator (Fuse)
```
brew install fuse-emulator
# ...
#   [snipped dependences]
# ..
=> Pouring fuse-emulator-1.4.0.sierra.bottle.tar.gz
🍺  /usr/local/Cellar/fuse-emulator/1.4.0: 49 files, 1.6MB
```

### fuse
``` bash 
$ fuse --help

The Free Unix Spectrum Emulator (Fuse) version 1.4.0.

Available command-line options:

Boolean options (use `--no-<option>' to turn off):

--auto-load            Automatically load tape files when opened.
--compress-rzx         Write RZX files out compressed.
--issue2               Emulate an Issue 2 Spectrum.
--kempston             Emulate the Kempston joystick on QAOP<space>.
--loading-sound        Emulate the sound of tapes loading.
--sound                Produce sound.
--sound-force-8bit     Generate 8-bit sound even if 16-bit is available.
--slt                  Turn SLT traps on.
--traps                Turn tape traps on.

Other options:

--help                 This information.
--machine <type>       Which machine should be emulated?
--playback <filename>  Play back RZX file <filename>.
--record <filename>    Record to RZX file <filename>.
--separation <type>    Use ACB/ABC stereo for the AY-3-8912 sound chip.
--snapshot <filename>  Load snapshot <filename>.
--speed <percentage>   How fast should emulation run?
--fb-mode <mode>       Which mode should be used for FB?
--tape <filename>      Open tape file <filename>.
--version              Print version number and exit.

For help, please mail <fuse-emulator-devel@lists.sf.net> or use
the forums at <http://sourceforge.net/p/fuse-emulator/discussion/>.
For complete documentation, see the manual page of Fuse.

```


``` bash 
$ fuse --tape base01.tap 

The Free Unix Spectrum Emulator (Fuse) version 1.4.0.
(c) 1999-2017 Philip Kendall and others; see the file
'AUTHORS' for more details.

For help, please mail <fuse-emulator-devel@lists.sf.net> or use
the forums at <http://sourceforge.net/p/fuse-emulator/discussion/>.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
```
