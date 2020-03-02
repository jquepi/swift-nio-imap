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

class StoreAttributeFlags_Tests: EncodeTestClass {

}

// MARK: - Encoding
extension StoreAttributeFlags_Tests {

    func testEncode() {
        let inputs: [(NIOIMAP.StoreAttributeFlags, String, UInt)] = [
            (.add(silent: true, list: [.answered]), "+FLAGS.SILENT (\\Answered)", #line),
            (.add(silent: false, list: [.draft]), "+FLAGS (\\Draft)", #line),
            (.remove(silent: true, list: [.deleted]), "-FLAGS.SILENT (\\Deleted)", #line),
            (.remove(silent: false, list: [.flagged]), "-FLAGS (\\Flagged)", #line),
            (.other(silent: true, list: [.seen]), "FLAGS.SILENT (\\Seen)", #line),
            (.other(silent: false, list: [.deleted]), "FLAGS (\\Deleted)", #line)
        ]

        for (test, expectedString, line) in inputs {
            self.testBuffer.clear()
            let size = self.testBuffer.writeStoreAttributeFlags(test)
            XCTAssertEqual(size, expectedString.utf8.count, line: line)
            XCTAssertEqual(self.testBufferString, expectedString, line: line)
        }
    }

}
