// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import NaiveDate
import Get
import URLQueryEncoder

extension Paths.Pet {
    public var findByStatus2: FindByStatus2 {
        FindByStatus2(path: path + "/findByStatus2")
    }

    public struct FindByStatus2 {
        /// Path: `/pet/findByStatus2`
        public let path: String

        /// Finds Pets by status
        ///
        /// Multiple status values can be provided with comma separated strings
        public func get(status: [Status]? = nil) -> Request<[edgecases_data_types.Pet]> {
            Request(path: path, method: "GET", query: makeGetQuery(status), id: "findPetsByStatus2")
        }

        private func makeGetQuery(_ status: [Status]?) -> [(String, String?)] {
            let encoder = URLQueryEncoder()
            encoder.encode(status, forKey: "status")
            return encoder.items
        }

        public enum Status: String, Codable, CaseIterable {
            case available
            case pending
            case sold
        }
    }
}