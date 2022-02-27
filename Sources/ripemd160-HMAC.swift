//
//  ripemd160-HMAC.swift
//  Hash-based message authentication code extension for ripemd160-Swift
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

/// Hash-based message authentication code extension
public extension RIPEMD160 {
    /// Generate a keyed-hash message authentication code
    /// - Parameters:
    ///   - key: Key bytes
    ///   - message: Message bytes
    /// - Returns: HMAC bytes
    static func hmac(key: Data, message: Data) -> Data {
        var key = key
        key.count = 64 // Truncate to 64 bytes or fill-up with zeros.

        let outerKeyPad = Data(key.map { $0 ^ 0x5c })
        let innerKeyPad = Data(key.map { $0 ^ 0x36 })

        var innerMd = RIPEMD160()
        innerMd.update(data: innerKeyPad)
        innerMd.update(data: message)

        var outerMd = RIPEMD160()
        outerMd.update(data: outerKeyPad)
        outerMd.update(data: innerMd.finalize())

        return outerMd.finalize()
    }
    
    /// Generate a keyed-hash message authentication code
    /// - Parameters:
    ///   - key: Key bytes
    ///   - message: Message `String`
    /// - Returns: HMAC bytes
    static func hmac(key: Data, message: String) -> Data {
        return RIPEMD160.hmac(key: key, message: message.data(using: .utf8)!)
    }
    
    /// Generate a keyed-hash message authentication code
    /// - Parameters:
    ///   - key: Key `String`
    ///   - message: Message `String`
    /// - Returns: HMAC bytes
    static func hmac(key: String, message: String) -> Data {
        return RIPEMD160.hmac(key: key.data(using: .utf8)!, message: message)
    }
    
    /// Generate a keyed-hash message authentication code
    /// - Parameters:
    ///   - key: Key `String`
    ///   - message: Message bytes
    /// - Returns: HMAC bytes
    static func hmac(key: String, message: Data) -> Data {
        return RIPEMD160.hmac(key: key.data(using: .utf8)!, message: message)
    }
}
#endif
