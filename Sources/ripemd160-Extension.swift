//
//  ripemd160-Extension.swift
//  "One-shot" functions to compute the hash of a message (given as `Data` or as `String`)
//
//  Copyright (c) 2022 Miclaus Industries Corporation B.V.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

#if canImport(Foundation)
import Foundation
/// RIPEMD160 Swift "one-shot" functions to compute the hash of a message extension
public extension RIPEMD160 {
    /// Compute hash from `Data`
    /// - Parameter message: Input bytes
    /// - Returns: Hash digest
    static func hash(_ message: Data) -> Data {
        var md = RIPEMD160()
        md.update(data: message)
        return md.finalize()
    }
    
    /// Compute hash from `String`
    /// - Parameter message: Input string
    /// - Returns: Hash digest
    static func hash(_ message: String) -> Data {
        return RIPEMD160.hash(message.data(using: .utf8)!)
    }
}

#endif
