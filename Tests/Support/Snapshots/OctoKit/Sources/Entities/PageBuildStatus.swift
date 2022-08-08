// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct PageBuildStatus: Codable {
    /// Example: "https://api.github.com/repos/github/hello-world/pages/builds/latest"
    public var url: URL
    /// Example: "queued"
    public var status: String

    public init(url: URL, status: String) {
        self.url = url
        self.status = status
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: StringCodingKey.self)
        self.url = try values.decode(URL.self, forKey: "url")
        self.status = try values.decode(String.self, forKey: "status")
    }

    public func encode(to encoder: Encoder) throws {
        var values = encoder.container(keyedBy: StringCodingKey.self)
        try values.encode(url, forKey: "url")
        try values.encode(status, forKey: "status")
    }
}