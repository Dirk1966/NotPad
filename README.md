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
    Windows 10    Still some issues in "git for Windows 2"
                  CRLF is replaced by LF in the end, but
                  the file size is not updated.
                  if file contained 38 bytes and 34 bytes
                  after replacing CRLF by LF, the last
                  4 bytes come from the old file!

Worked inside of "git for Windows" environment on
    Windows 7
