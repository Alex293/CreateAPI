// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate

public struct User: Codable {
    public var id: Int64?
    public var username: String?
    public var firstName: String?
    public var lastName: String?
    public var email: String?
    public var password: String?
    public var phone: String?
    /// User Status
    public var userStatus: Int32?

    public init(id: Int64? = nil, username: String? = nil, firstName: String? = nil, lastName: String? = nil, email: String? = nil, password: String? = nil, phone: String? = nil, userStatus: Int32? = nil) {
        self.id = id
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
        self.phone = phone
        self.userStatus = userStatus
    }
}