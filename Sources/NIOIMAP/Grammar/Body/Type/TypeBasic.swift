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

extension NIOIMAP.Body {

    /// IMAPv4 `body-type-basic`
    public struct TypeBasic: Equatable {
        var media: NIOIMAP.Media.Basic
        var fields: Fields
    }

}

// MARK: - Encoding
extension ByteBuffer {

    @discardableResult mutating func writeBodyTypeBasic(_ body: NIOIMAP.Body.TypeBasic) -> Int {
        self.writeMediaBasic(body.media) +
        self.writeSpace() +
        self.writeBodyFields(body.fields)
    }

}
