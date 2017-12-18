# Unalias — resolve macOS aliases on the Terminal

Quick 'n' dirty resolution of aliases for the macOS command line.

Usage: `unalias <alias>`


Example:

    $ cd some-alias
    cd: 'some-alias' is not a directory
    $ file some-alias
    some-alias: MacOS Alias file
    $ unalias some-alias
    /Users/eaganj/path/to/some-alias/target
    $ cd (unalias some-alias)
    
    # now in /path/to/some-alias/target:
    $
