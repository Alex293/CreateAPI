// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import HTTPHeaders
import URLQueryEncoder

extension Paths.Repos.WithOwner.WithRepo.Issues.Events {
    public func eventID(_ eventID: Int) -> WithEventID {
        WithEventID(path: "\(path)/\(eventID)")
    }

    public struct WithEventID {
        /// Path: `/repos/{owner}/{repo}/issues/events/{event_id}`
        public let path: String

        /// Get an issue event
        ///
        /// [API method documentation](https://docs.github.com/rest/reference/issues#get-an-issue-event)
        public var get: Request<OctoKit.IssueEvent> {
            Request(method: "GET", url: path, id: "issues/get-event")
        }
    }
}