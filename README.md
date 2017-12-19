# Aka — resolve macOS aliases on the Terminal

Quick 'n' dirty resolution of aliases for the macOS command line.

Usage: `aka <alias>`

Example (bash, zsh, sh, csh, tcsh shells):

    $ cd some-alias
    cd: 'some-alias' is not a directory
    $ file some-alias
    some-alias: MacOS Alias file
    $ aka some-alias
    /Users/eaganj/path/to/some-alias/target
    $ cd `aka some-alias`
    
    # now in /path/to/some-alias/target:
    $


Example (fish shell):

    $ cd some-alias
    cd: 'some-alias' is not a directory
    $ file some-alias
    some-alias: MacOS Alias file
    $ aka some-alias
    /Users/eaganj/path/to/some-alias/target
    $ cd (aka some-alias)
    
    # now in /path/to/some-alias/target:
    $
