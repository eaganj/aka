#!/usr/bin/env swift

import Foundation

guard CommandLine.arguments.count == 2 else {
    fatalError("Usage: unalias <alias>")
}

let alias = CommandLine.arguments[1]

do {
    let aliasURL = URL(fileURLWithPath: alias)
    let aliasData = try URL.bookmarkData(withContentsOf: aliasURL) 
    var b = false
    let targetURL = try URL(resolvingBookmarkData: aliasData, options: .withoutUI, relativeTo: aliasURL, bookmarkDataIsStale: &b)
    guard let targetPath = targetURL?.relativePath else { 
        fatalError("Could not find target for alias \(alias)") 
    }

    print(targetPath)
} catch {
    print("Could not read alias data for \(alias).  Is it an alias?")
}
