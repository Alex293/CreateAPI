// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct Tag: Codable {
    public var identifier: Int?
    public var name: String?

    public init(identifier: Int? = nil, name: String? = nil) {
        self.identifier = identifier
        self.name = name
    }

    private enum CodingKeys: String, CodingKey {
        case identifier = "id"
        case name
    }
}