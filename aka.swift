#!/usr/bin/env swift

import Darwin
import Foundation

guard CommandLine.arguments.count == 2 else {
    let programName = CommandLine.arguments.count >= 1 ? CommandLine.arguments[0] : "aka"
    print("Usage: \(programName) <alias>")
    exit(1)
}

let alias = CommandLine.arguments[1]

do {
    let aliasURL = URL(fileURLWithPath: alias)
    let aliasData = try URL.bookmarkData(withContentsOf: aliasURL) 
    var b = false
    let targetURL = try URL(resolvingBookmarkData: aliasData, options: .withoutUI, relativeTo: aliasURL, bookmarkDataIsStale: &b)
    guard let targetPath = targetURL?.relativePath else { 
        print("Could not find target for alias \(alias)") 
        exit(1)
    }

    print(targetPath)
} catch {
    print("Could not read alias data for \(alias).  Is it an alias?")
    exit(1)
}
