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

import NIO

extension NIOIMAP {

    /// IMAPv4 `Namespace-Response-Extensions`
    public typealias NamespaceResponseExtensions = [NamespaceResponseExtension]

    /// IMAPv4 `Namespace-Response-Extension`
    public struct NamespaceResponseExtension: Equatable {
        let str1: NIOIMAP.IMAPString
        let strs: [NIOIMAP.IMAPString]

        public static func string(_ string: IMAPString, array: [IMAPString]) -> Self {
            return Self(str1: string, strs: array)
        }
    }

}

// MARK: - Encoding
extension ByteBuffer {

    @discardableResult mutating func writeNamespaceResponseExtensions(_ extensions: NIOIMAP.NamespaceResponseExtensions) -> Int {
        extensions.reduce(into: 0) { (res, ext) in
            res += self.writeNamespaceResponseExtension(ext)
        }
    }

    @discardableResult mutating func writeNamespaceResponseExtension(_ response: NIOIMAP.NamespaceResponseExtension) -> Int {
        self.writeSpace() +
        self.writeIMAPString(response.str1) +
        self.writeSpace() +
        self.writeArray(response.strs) { (string, self) in
            self.writeIMAPString(string)
        }
    }

}
