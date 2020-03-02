//===----------------------------------------------------------------------===//
//
// This source file is part of the SwiftNIO open source project
//
// Copyright (c) 2020 Apple Inc. and the SwiftNIO project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of SwiftNIO project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import XCTest
import NIO
@testable import NIOIMAP

class SelectParameterName_Tests: EncodeTestClass {

}

// MARK: - Encoding
extension SelectParameterName_Tests {

    func testEncode() {
        let inputs: [(NIOIMAP.SelectParameterName, String, UInt)] = [
            ("test", "test", #line),
        ]

        for (input, expectedString, line) in inputs {
            self.testBuffer.clear()
            let size = self.testBuffer.writeSelectParameterName(input)
            XCTAssertEqual(size, expectedString.utf8.count, line: line)
            XCTAssertEqual(self.testBufferString, expectedString, line: line)
        }
    }

}
