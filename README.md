# NotPad
Wrappers for Windows' notepad.exe to support editing of Unix (LF only) files.

# _Remark: Do not use this branch with Windows, until you want to run special tests!_

The branch 'no-windows-files' is reserved for files which are difficult to handle under Windows.

Planned are the files with the file names

  - CamelCaseOrNot.txt and
  - camelcaseornot.txt

which should contain the text "CamelCaseOrNot" and "camelcaseornot".

Under Windows, these files cannot currently be used together and provoke errors, because Windows does not support case sensitive files, even if the file system on NTFS would support it.

This can be used to play also around with the registry setting

    [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel\Obcaseinsensitive=0]

inside of Windows, going away from the standard 1.

If you run Windows and want to switch away from this branch, you have to use the -f/--force flag, for instance with:

    git checkout --force master
