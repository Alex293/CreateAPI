// Generated by Create API
// https://github.com/CreateAPI/CreateAPI
//
// swiftlint:disable all

import Foundation
import Get

extension Paths {
    public static var container: Container {
        Container(path: "/container")
    }

    public struct Container {
        /// Path: `/container`
        public let path: String

        public var get: Request<discriminator.Container> {
            .get(path)
        }
    }
}

public enum Paths {}