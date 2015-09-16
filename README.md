# NotPad
Wrappers for Windows' notepad.exe to support editing of Unix (LF only) files.

This wrapper enables the editing of (simple) unix files with LF only with
Windows' notepad.exe by just replacing LF with CRLF before starting
notepad and replacing CRLF by LF after notepad finished.

This was enough for using plain Windows' notepad.exe inside of
    "git for Windows 2"
for editing commit messages.  It should also work in the old
    "git for Windows".

To get trace information set environment variable DEBUG_NOTPAD.

No temporary file is written, the file will be edited "inline".

If a file contains only one line and no replacement is made,
writing on the file is ommitted.

Worked inside of "git for Windows 2" environment on
 * Windows 7
 * Windows 8.1
 * Windows 10 (32 bit and 64 bit)
   * perl 5.22 under "git for Windows 2" needed a truncate
     before writing to function properly.

Worked inside of "git for Windows" environment on
 * Windows 7

Environment variables for development (example) and test:
 * DEBUG_NOTPAD=1
 * EDITOR_NOTPAD="ls -l"

ToDo: Support of file name characters like " " should work
      now, the German Umlaut "ö" was tested too, but other
      difficult characters "/", "\", Chinese (???) may
      still cause problems.
