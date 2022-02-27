//
//  Benchmark.swift
//  ripemd160-Swift Benchmark
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
import Foundation
@testable import ripemd160_Swift

final class Benchmark: XCTestCase {
    /// Test ripemd160 hashing Performance
    func testSingleHashPerformance() {
        // Input
        let message: String = randomString(length: 8)
        
        // Measure performance
        self.measure {
            let _: Data = RIPEMD160.hash(message)
        }
    }
    
    /// Test Kilo hashes performance
    func testKiloHashesPerformance() {
        self.measure {
            for _ in 1...1_000 {
                let _: Data = RIPEMD160.hash(randomString(length: 8))
            }
        }
    }
}

fileprivate func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}
