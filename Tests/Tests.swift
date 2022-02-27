//
//  Tests.swift
//  ripemd160-Swift Tests
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

import XCTest
@testable import ripemd160_Swift

final class Tests: XCTestCase {
    /// Test ripemd160 hashing
    func testHashing() throws {
        // Input
        let message: String = "Hello, World!"
        let hash = RIPEMD160.hash(message).hexEncodedString()
        
        // Expected value. Calculated from external hasher.
        let target: String = "527a6a4b9a6da75607546842e0e00105350b1aaf"
        
        // Assert for Equality
        XCTAssertEqual(hash, target)
    }
    
    /// Test ripemd160 HMAC
    func testHMAC() throws {
        // Input
        let key: String = "Key"
        let message: String = "Hello, World!"
        let hmac = RIPEMD160.hmac(key: key, message: message).hexEncodedString()
        
        // Expected Value. Calculated from external hasher.
        let target: String = "0ad4137613407fcdc76c9be6362cd9ce7f6339b3"
        
        // Assert for Equality
        XCTAssertEqual(hmac, target)
    }
}

/// Internal test extension
fileprivate extension Data {
    /// Convert Hex bytes to a Swift `String`
    func hexEncodedString() -> String {
        return map { String(format: "%02hhx", $0) }.joined()
    }
}
