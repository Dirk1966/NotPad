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

Worked inside of "git for Windows 2" environment on
    Windows 7
    Windows 8.1
    Windows 10   (got troubling trace info there, it seems that CRLF is not
                  replaced by LF there after calling notepad.exe, but using
		  notepad for editing git commit messages was possible.)
