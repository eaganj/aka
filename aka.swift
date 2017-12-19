#!/usr/bin/env swift

/*
    MIT License

    Copyright (c) 2017 James R. Eagan

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all
    copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
    SOFTWARE.
*/

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