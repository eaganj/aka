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

# Install

1. Clone this repository
2. Add aka to your path.  For example, if `~/bin` is in your path:
     * `cd ~/bin && ln -s /path/to/aka.swift aka`
    * -or-
    * `mv aka.swift ~/bin/aka`
3. Make sure `aka` is executable: `chmod +x /path/to/aka`