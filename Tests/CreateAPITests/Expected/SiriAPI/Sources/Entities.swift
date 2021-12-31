// Generated by Create API
// https://github.com/kean/CreateAPI
//
// swiftlint:disable all

import Foundation
import NaiveDate

public enum AddMediaIntentResponseCode: String, Codable, CaseIterable {
    case unspecified
    case ready
    case inProgress
    case success
    case failure
    case failureRequiringAppLaunch
}

public enum AddMediaMediaDestinationUnsupportedReason: String, Codable, CaseIterable {
    case playlistNameNotFound
    case playlistNotEditable
}

public enum AddMediaMediaItemUnsupportedReason: String, Codable, CaseIterable {
    case loginRequired
    case subscriptionRequired
    case unsupportedMediaType
    case explicitContentSettings
    case restrictedContent
    case regionRestriction
}

public struct Constraints: Codable {
    public var allowExplicitContent: Bool
    public var maximumQueueSegmentItemCount: Int?
    public var isUpdateUserTasteProfile: Bool

    public init(allowExplicitContent: Bool? = nil, maximumQueueSegmentItemCount: Int? = nil, isUpdateUserTasteProfile: Bool? = nil) {
        self.allowExplicitContent = allowExplicitContent ?? true
        self.maximumQueueSegmentItemCount = maximumQueueSegmentItemCount
        self.isUpdateUserTasteProfile = isUpdateUserTasteProfile ?? true
    }

    private enum CodingKeys: String, CodingKey {
        case allowExplicitContent
        case maximumQueueSegmentItemCount
        case isUpdateUserTasteProfile = "updateUserTasteProfile"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.allowExplicitContent = try values.decodeIfPresent(Bool.self, forKey: .allowExplicitContent) ?? true
        self.maximumQueueSegmentItemCount = try values.decodeIfPresent(Int.self, forKey: .maximumQueueSegmentItemCount)
        self.isUpdateUserTasteProfile = try values.decodeIfPresent(Bool.self, forKey: .isUpdateUserTasteProfile) ?? true
    }
}

public struct Content: Codable {
    public var attributes: ContentAttributes?
    /// Example: "song"
    public var control: String?
    /// Example: "j15f8A3cuU0GG"
    public var identifier: String
    public var isLive: Bool?
    public var playIndex: Int?
    public var url: String?

    public init(attributes: ContentAttributes? = nil, control: String? = nil, identifier: String, isLive: Bool? = nil, playIndex: Int? = nil, url: String? = nil) {
        self.attributes = attributes
        self.control = control
        self.identifier = identifier
        self.isLive = isLive
        self.playIndex = playIndex
        self.url = url
    }
}

public struct ContentAttributes: Codable {
    /// Example: "Blood On the Tracks"
    public var albumName: String?
    /// Example: "Bob Dylan"
    public var artistName: String?
    public var artwork: Artwork?
    /// Example: "B. Dylan"
    public var composerName: String?
    public var durationInMillis: Int?
    public var genreNames: [String]?
    /// Example: "Tangled Up In Blue"
    public var name: String?
    public var trackNumber: Int?

    public struct Artwork: Codable {
        public var url: String?

        public init(url: String? = nil) {
            self.url = url
        }
    }

    public init(albumName: String? = nil, artistName: String? = nil, artwork: Artwork? = nil, composerName: String? = nil, durationInMillis: Int? = nil, genreNames: [String]? = nil, name: String? = nil, trackNumber: Int? = nil) {
        self.albumName = albumName
        self.artistName = artistName
        self.artwork = artwork
        self.composerName = composerName
        self.durationInMillis = durationInMillis
        self.genreNames = genreNames
        self.name = name
        self.trackNumber = trackNumber
    }
}

/// Example: "1980"
public enum DateComponents: Codable {
    case string(String)
    case naiveDate(NaiveDate)
    case date(Date)
    case explicitDateComponents(ExplicitDateComponents)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
        } else if let value = try? container.decode(NaiveDate.self) {
            self = .naiveDate(value)
        } else if let value = try? container.decode(Date.self) {
            self = .date(value)
        } else if let value = try? container.decode(ExplicitDateComponents.self) {
            self = .explicitDateComponents(value)
        } else {
            throw DecodingError.dataCorruptedError(in: container, debugDescription: "Failed to intialize `oneOf`")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let value): try container.encode(value)
        case .naiveDate(let value): try container.encode(value)
        case .date(let value): try container.encode(value)
        case .explicitDateComponents(let value): try container.encode(value)
        }
    }
}

public struct DateComponentsRange: Codable {
    /// Example: "1980"
    public var endDateComponents: DateComponents?
    /// Example: "1980"
    public var startDateComponents: DateComponents?

    public init(endDateComponents: DateComponents? = nil, startDateComponents: DateComponents? = nil) {
        self.endDateComponents = endDateComponents
        self.startDateComponents = startDateComponents
    }
}

public struct ExecutionMetrics: Codable {
    public var completed: Date?
    public var duration: Double?
    public var received: Date?

    public init(completed: Date? = nil, duration: Double? = nil, received: Date? = nil) {
        self.completed = completed
        self.duration = duration
        self.received = received
    }
}

public struct ExplicitDateComponents: Codable {
    public var calendarIdentifier: String?
    public var day: Int?
    public var era: Int?
    public var hour: Int?
    public var minute: Int?
    public var month: Int?
    public var nanosecond: Int?
    public var second: Int?
    public var timeZone: String?
    public var year: Int?

    public init(calendarIdentifier: String? = nil, day: Int? = nil, era: Int? = nil, hour: Int? = nil, minute: Int? = nil, month: Int? = nil, nanosecond: Int? = nil, second: Int? = nil, timeZone: String? = nil, year: Int? = nil) {
        self.calendarIdentifier = calendarIdentifier
        self.day = day
        self.era = era
        self.hour = hour
        self.minute = minute
        self.month = month
        self.nanosecond = nanosecond
        self.second = second
        self.timeZone = timeZone
        self.year = year
    }
}

public struct ExtensionConfig: Codable {
    /// Example:
    ///
    /// {
    ///   "x-client-type" : "headless",
    ///   "x-service-affinity" : "cluster1"
    /// }
    public var hdr: [String: AnyJSON]?
    public var intent: Intent
    public var media: Media
    /// Example: "/v2"
    public var url: String?
    /// Example: "1.0.0"
    public var version: String

    public struct Intent: Codable {
        public var addMedia: ExtensionEndpointConfig?
        /// Example:
        ///
        /// {
        ///   "x-service-affinity" : "intent2"
        /// }
        public var hdr: [String: AnyJSON]?
        public var playMedia: ExtensionEndpointConfig
        public var updateMediaAffinity: ExtensionEndpointConfig?

        public init(addMedia: ExtensionEndpointConfig? = nil, hdr: [String: AnyJSON]? = nil, playMedia: ExtensionEndpointConfig, updateMediaAffinity: ExtensionEndpointConfig? = nil) {
            self.addMedia = addMedia
            self.hdr = hdr
            self.playMedia = playMedia
            self.updateMediaAffinity = updateMediaAffinity
        }
    }

    public struct Media: Codable {
        public var queues: Queues?

        public struct Queues: Codable {
            /// Example:
            ///
            /// {
            ///   "x-content-min-ttl" : 1200,
            ///   "x-media-catalog-region" : "en_US"
            /// }
            public var hdr: [String: AnyJSON]?
            public var playMedia: PlayMedia?
            public var updateActivity: UpdateActivity?

            public struct PlayMedia: Codable {
                /// Example:
                ///
                /// {
                ///   "x-headless-client" : true
                /// }
                public var hdr: [String: AnyJSON]?
                public var url: String?

                public init(hdr: [String: AnyJSON]? = nil, url: String? = nil) {
                    self.hdr = hdr
                    self.url = url
                }
            }

            public struct UpdateActivity: Codable {
                public var hdr: [String: AnyJSON]?
                public var url: String?

                public init(hdr: [String: AnyJSON]? = nil, url: String? = nil) {
                    self.hdr = hdr
                    self.url = url
                }
            }

            public init(hdr: [String: AnyJSON]? = nil, playMedia: PlayMedia? = nil, updateActivity: UpdateActivity? = nil) {
                self.hdr = hdr
                self.playMedia = playMedia
                self.updateActivity = updateActivity
            }
        }

        public init(queues: Queues? = nil) {
            self.queues = queues
        }
    }

    public init(hdr: [String: AnyJSON]? = nil, intent: Intent, media: Media, url: String? = nil, version: String) {
        self.hdr = hdr
        self.intent = intent
        self.media = media
        self.url = url
        self.version = version
    }
}

public struct ExtensionEndpointConfig: Codable {
    public var hdr: [String: AnyJSON]?
    public var url: String?

    public init(hdr: [String: AnyJSON]? = nil, url: String? = nil) {
        self.hdr = hdr
        self.url = url
    }
}

public struct Intent: Codable {
    public var `class`: String
    public var identifier: String

    public init(`class`: String, identifier: String) {
        self.class = `class`
        self.identifier = identifier
    }

    private enum CodingKeys: String, CodingKey {
        case `class` = "class"
        case identifier
    }
}

public struct IntentResolutionResult: Codable {
    public var `class`: String
    public var needsValue: [String: AnyJSON]?
    public var notRequired: [String: AnyJSON]?
    public var unsupported: [String: AnyJSON]?

    public init(`class`: String, needsValue: [String: AnyJSON]? = nil, notRequired: [String: AnyJSON]? = nil, unsupported: [String: AnyJSON]? = nil) {
        self.class = `class`
        self.needsValue = needsValue
        self.notRequired = notRequired
        self.unsupported = unsupported
    }

    private enum CodingKeys: String, CodingKey {
        case `class` = "class"
        case needsValue
        case notRequired
        case unsupported
    }
}

public struct IntentResponse: Codable {
    public var `class`: String
    public var userActivity: UserActivity?

    public init(`class`: String, userActivity: UserActivity? = nil) {
        self.class = `class`
        self.userActivity = userActivity
    }

    private enum CodingKeys: String, CodingKey {
        case `class` = "class"
        case userActivity
    }
}

public struct Invocation: Codable {
    public var method: String
    public var params: [String: AnyJSON]?
    public var session: Session?

    public init(method: String, params: [String: AnyJSON]? = nil, session: Session? = nil) {
        self.method = method
        self.params = params
        self.session = session
    }
}

public struct InvocationResponse: Codable {
    public var debug: URL?
    public var method: String
    public var metrics: ExecutionMetrics?
    public var result: [String: AnyJSON]?

    public init(debug: URL? = nil, method: String, metrics: ExecutionMetrics? = nil, result: [String: AnyJSON]? = nil) {
        self.debug = debug
        self.method = method
        self.metrics = metrics
        self.result = result
    }
}

public enum MediaAffinityType: String, Codable, CaseIterable {
    case unknown
    case like
    case dislike
}

public struct MediaDestination: Codable {
    public var mediaDestinationType: MediaDestinationType

    public enum MediaDestinationType: String, Codable, CaseIterable {
        case library
        case playlist
    }

    public init(mediaDestinationType: MediaDestinationType) {
        self.mediaDestinationType = mediaDestinationType
    }
}

public struct MediaItem: Codable {
    public var artist: String?
    public var identifier: String
    public var title: String?
    public var type: MediaItemType

    public init(artist: String? = nil, identifier: String, title: String? = nil, type: MediaItemType) {
        self.artist = artist
        self.identifier = identifier
        self.title = title
        self.type = type
    }
}

public enum MediaItemType: String, Codable, CaseIterable {
    case unknown
    case song
    case album
    case artist
    case genre
    case playlist
    case podcastShow
    case podcastEpisode
    case podcastPlaylist
    case musicStation
    case audioBook
    case movie
    case tvShow
    case tvShowEpisode
    case musicVideo
    case podcastStation
    case radioStation
    case station
    case music
    case algorithmicRadioStation
    case news
}

public enum MediaReference: String, Codable, CaseIterable {
    case unknown
    case currentlyPlaying
    case my
}

public struct MediaSearch: Codable {
    public var albumName: String?
    public var artistName: String?
    public var genreNames: [String]?
    public var mediaIdentifier: String?
    public var mediaName: String?
    public var mediaType: MediaItemType?
    public var moodNames: [String]?
    public var reference: MediaReference?
    public var releaseDate: DateComponentsRange?
    public var sortOrder: MediaSortOrder?

    public init(albumName: String? = nil, artistName: String? = nil, genreNames: [String]? = nil, mediaIdentifier: String? = nil, mediaName: String? = nil, mediaType: MediaItemType? = nil, moodNames: [String]? = nil, reference: MediaReference? = nil, releaseDate: DateComponentsRange? = nil, sortOrder: MediaSortOrder? = nil) {
        self.albumName = albumName
        self.artistName = artistName
        self.genreNames = genreNames
        self.mediaIdentifier = mediaIdentifier
        self.mediaName = mediaName
        self.mediaType = mediaType
        self.moodNames = moodNames
        self.reference = reference
        self.releaseDate = releaseDate
        self.sortOrder = sortOrder
    }
}

public enum MediaSortOrder: String, Codable, CaseIterable {
    case unknown
    case newest
    case oldest
    case best
    case worst
    case popular
    case unpopular
    case trending
    case recommended
}

public struct PlayMediaControl: Codable {
    public var activity: PlayMediaControlActivity?
    public var commands: PlayMediaControlCommandSet?
    public var scheme: PlayMediaControlScheme

    public init(activity: PlayMediaControlActivity? = nil, commands: PlayMediaControlCommandSet? = nil, scheme: PlayMediaControlScheme) {
        self.activity = activity
        self.commands = commands
        self.scheme = scheme
    }
}

public struct PlayMediaControlActivity: Codable {
    public var playElapsed: Int?
    public var playElapsedInterval: Int?
    public var playPaused: Int?

    public init(playElapsed: Int? = nil, playElapsedInterval: Int? = nil, playPaused: Int? = nil) {
        self.playElapsed = playElapsed
        self.playElapsedInterval = playElapsedInterval
        self.playPaused = playPaused
    }
}

public struct PlayMediaControlCommandSet: Codable {
    public var isBookmarkTrack: Bool?
    public var isDislikeTrack: Bool?
    public var isLikeTrack: Bool?
    public var isNextTrack: Bool?
    public var isPreferSkipBackward: Bool?
    public var isPreferSkipForward: Bool?
    public var isPreviousTrack: Bool?
    public var isSeekToPlaybackPosition: Bool?
    public var isSkipBackward: Bool?
    public var isSkipForward: Bool?

    public init(isBookmarkTrack: Bool? = nil, isDislikeTrack: Bool? = nil, isLikeTrack: Bool? = nil, isNextTrack: Bool? = nil, isPreferSkipBackward: Bool? = nil, isPreferSkipForward: Bool? = nil, isPreviousTrack: Bool? = nil, isSeekToPlaybackPosition: Bool? = nil, isSkipBackward: Bool? = nil, isSkipForward: Bool? = nil) {
        self.isBookmarkTrack = isBookmarkTrack
        self.isDislikeTrack = isDislikeTrack
        self.isLikeTrack = isLikeTrack
        self.isNextTrack = isNextTrack
        self.isPreferSkipBackward = isPreferSkipBackward
        self.isPreferSkipForward = isPreferSkipForward
        self.isPreviousTrack = isPreviousTrack
        self.isSeekToPlaybackPosition = isSeekToPlaybackPosition
        self.isSkipBackward = isSkipBackward
        self.isSkipForward = isSkipForward
    }

    private enum CodingKeys: String, CodingKey {
        case isBookmarkTrack = "bookmarkTrack"
        case isDislikeTrack = "dislikeTrack"
        case isLikeTrack = "likeTrack"
        case isNextTrack = "nextTrack"
        case isPreferSkipBackward = "preferSkipBackward"
        case isPreferSkipForward = "preferSkipForward"
        case isPreviousTrack = "previousTrack"
        case isSeekToPlaybackPosition = "seekToPlaybackPosition"
        case isSkipBackward = "skipBackward"
        case isSkipForward = "skipForward"
    }
}

public enum PlayMediaControlScheme: String, Codable, CaseIterable {
    case custom
    case onDemand
    case internetRadio
    case liveStreaming
    case audioBook
    case podcast
    case advertisement
}

public enum PlayMediaIntentResponseCode: String, Codable, CaseIterable {
    case unspecified
    case success
    case failure
    case failureRequiringAppLaunch
    case failureUnknownMediaType
    case failureNoUnplayedContent
    case failureRestrictedContent
}

public enum PlayMediaMediaItemUnsupportedReason: String, Codable, CaseIterable {
    case loginRequired
    case subscriptionRequired
    case unsupportedMediaType
    case explicitContentSettings
    case restrictedContent
    case regionRestriction
}

public struct PlayMediaRequest: Codable {
    public var constraints: Constraints
    public var userActivity: UserActivity?
    public var version: String

    public init(constraints: Constraints, userActivity: UserActivity? = nil, version: String) {
        self.constraints = constraints
        self.userActivity = userActivity
        self.version = version
    }
}

public enum PlaybackQueueLocation: String, Codable, CaseIterable {
    case unknown
    case now
    case next
    case later
}

public enum PlaybackRepeatMode: String, Codable, CaseIterable {
    case unknown
    case `none`
    case all
    case one
}

public struct PlayerContext: Codable {
    public var activityIdentifier: String?
    /// Example: "j15f8A3cuU0GG"
    public var contentIdentifier: String?
    /// Example: 10942
    public var offsetInMillis: Int?
    public var playbackSpeed: Double?
    /// Example: "u104823q8201"
    public var queueIdentifier: String?

    public init(activityIdentifier: String? = nil, contentIdentifier: String? = nil, offsetInMillis: Int? = nil, playbackSpeed: Double? = nil, queueIdentifier: String? = nil) {
        self.activityIdentifier = activityIdentifier
        self.contentIdentifier = contentIdentifier
        self.offsetInMillis = offsetInMillis
        self.playbackSpeed = playbackSpeed
        self.queueIdentifier = queueIdentifier
    }
}

public struct ProtocolException: Codable {
    public var code: Int?
    public var methodIndex: Int?
    public var methodName: String?
    public var reason: ProtocolExceptionReason
    public var retryWithDelay: Double?
    public var trace: [String]?

    public init(code: Int? = nil, methodIndex: Int? = nil, methodName: String? = nil, reason: ProtocolExceptionReason, retryWithDelay: Double? = nil, trace: [String]? = nil) {
        self.code = code
        self.methodIndex = methodIndex
        self.methodName = methodName
        self.reason = reason
        self.retryWithDelay = retryWithDelay
        self.trace = trace
    }
}

public enum ProtocolExceptionReason: String, Codable, CaseIterable {
    case unsupported
    case unauthorized
    case unexpected
    case invalid
    case unparseable
    case deprecated
    case `internal`
    case complex
    case busy
}

public struct Queue: Codable {
    public var content: [Content]
    public var contentItemsCount: Int?
    public var controls: [String: PlayMediaControl]?
    /// Example: "u104823q8201"
    public var identifier: String
    public var insertPointer: QueueInsertPointer?
    public var nextContentURL: String?
    public var playPointer: QueuePlayPointer?
    public var prerollSeconds: Double?
    public var previousContentURL: String?
    public var skipsRemaining: Int?
    public var version: String

    public init(content: [Content], contentItemsCount: Int? = nil, controls: [String: PlayMediaControl]? = nil, identifier: String, insertPointer: QueueInsertPointer? = nil, nextContentURL: String? = nil, playPointer: QueuePlayPointer? = nil, prerollSeconds: Double? = nil, previousContentURL: String? = nil, skipsRemaining: Int? = nil, version: String) {
        self.content = content
        self.contentItemsCount = contentItemsCount
        self.controls = controls
        self.identifier = identifier
        self.insertPointer = insertPointer
        self.nextContentURL = nextContentURL
        self.playPointer = playPointer
        self.prerollSeconds = prerollSeconds
        self.previousContentURL = previousContentURL
        self.skipsRemaining = skipsRemaining
        self.version = version
    }

    private enum CodingKeys: String, CodingKey {
        case content
        case contentItemsCount
        case controls
        case identifier
        case insertPointer
        case nextContentURL = "nextContentUrl"
        case playPointer
        case prerollSeconds
        case previousContentURL = "previousContentUrl"
        case skipsRemaining
        case version
    }
}

public enum QueueActivityReportEvent: String, Codable, CaseIterable {
    case localPlayingElapsed = "local.playing.elapsed"
    case localPlayingPaused = "local.playing.paused"
    case localPlayingContinued = "local.playing.continued"
    case localPlayingScrub = "local.playing.scrub"
    case localPlayingFastForward = "local.playing.fastForward"
    case localPlayingFastRewind = "local.playing.fastRewind"
    case localPlayingTransitionedNaturally = "local.playing.transitioned.naturally"
    case localPlayingTransitionedSkipNext = "local.playing.transitioned.skip_next"
    case localPlayingTransitionedSkipPrevious = "local.playing.transitioned.skip_previous"
    case localPlayingTransitionedQueueReplaced = "local.playing.transitioned.queue_replaced"
    case localStoppedNaturally = "local.stopped.naturally"
    case localStoppedSkipPastEnd = "local.stopped.skip_past_end"
    case localCommandLike = "local.command.like"
    case localCommandDislike = "local.command.dislike"
    case localCommandBookmark = "local.command.bookmark"
}

public struct QueueInsertPointer: Codable {
    /// Example: "j15f8A3cuU0GG"
    public var afterIdentifier: String?
    public var isReplace: Bool

    public init(afterIdentifier: String? = nil, isReplace: Bool? = nil) {
        self.afterIdentifier = afterIdentifier
        self.isReplace = isReplace ?? false
    }

    private enum CodingKeys: String, CodingKey {
        case afterIdentifier
        case isReplace = "replace"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.afterIdentifier = try values.decodeIfPresent(String.self, forKey: .afterIdentifier)
        self.isReplace = try values.decodeIfPresent(Bool.self, forKey: .isReplace) ?? false
    }
}

public struct QueuePlayPointer: Codable {
    /// Example: "j15f8A3cuU0GG"
    public var contentIdentifier: String?
    /// Example: 10942
    public var offsetInMillis: Int?

    public init(contentIdentifier: String? = nil, offsetInMillis: Int? = nil) {
        self.contentIdentifier = contentIdentifier
        self.offsetInMillis = offsetInMillis
    }
}

public struct Session: Codable {
    public var constraints: Constraints
    public var deadline: Date
    public var identifier: String
    public var playerContext: PlayerContext?
    public var requested: Date
    public var version: String

    public init(constraints: Constraints, deadline: Date, identifier: String, playerContext: PlayerContext? = nil, requested: Date, version: String) {
        self.constraints = constraints
        self.deadline = deadline
        self.identifier = identifier
        self.playerContext = playerContext
        self.requested = requested
        self.version = version
    }
}

public struct UpdateActivityRequest: Codable {
    public var constraints: Constraints?
    public var nowPlaying: PlayerContext?
    public var previouslyPlaying: PlayerContext?
    public var report: QueueActivityReportEvent
    public var timestamp: Date
    public var userActivity: UserActivity?
    public var version: String

    public init(constraints: Constraints? = nil, nowPlaying: PlayerContext? = nil, previouslyPlaying: PlayerContext? = nil, report: QueueActivityReportEvent, timestamp: Date, userActivity: UserActivity? = nil, version: String) {
        self.constraints = constraints
        self.nowPlaying = nowPlaying
        self.previouslyPlaying = previouslyPlaying
        self.report = report
        self.timestamp = timestamp
        self.userActivity = userActivity
        self.version = version
    }
}

public struct UpdateActivityResponse: Codable {
    public var queue: Queue?
    public var userActivity: UserActivity?

    public init(queue: Queue? = nil, userActivity: UserActivity? = nil) {
        self.queue = queue
        self.userActivity = userActivity
    }
}

public enum UpdateMediaAffinityIntentResponseCode: String, Codable, CaseIterable {
    case unspecified
    case inProgress
    case success
    case failure
    case failureRequiringAppLaunch
}

public enum UpdateMediaAffinityMediaItemUnsupportedReason: String, Codable, CaseIterable {
    case loginRequired
    case subscriptionRequired
    case unsupportedMediaType
    case explicitContentSettings
}

public struct UserActivity: Codable {
    /// Example: "com.mediastreamingservice.playmedia"
    public var activityType: String
    public var persistentIdentifier: String?
    public var title: String?
    /// UserActivityUserInfo
    public var userInfo: [String: AnyJSON]?
    public var version: String

    public init(activityType: String, persistentIdentifier: String? = nil, title: String? = nil, userInfo: [String: AnyJSON]? = nil, version: String) {
        self.activityType = activityType
        self.persistentIdentifier = persistentIdentifier
        self.title = title
        self.userInfo = userInfo
        self.version = version
    }
}

public enum AnyJSON: Equatable, Codable {
    case string(String)
    case number(Double)
    case object([String: AnyJSON])
    case array([AnyJSON])
    case bool(Bool)

    var value: Any {
        switch self {
        case .string(let string): return string
        case .number(let double): return double
        case .object(let dictionary): return dictionary
        case .array(let array): return array
        case .bool(let bool): return bool
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .array(array): try container.encode(array)
        case let .object(object): try container.encode(object)
        case let .string(string): try container.encode(string)
        case let .number(number): try container.encode(number)
        case let .bool(bool): try container.encode(bool)
        }
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let object = try? container.decode([String: AnyJSON].self) {
            self = .object(object)
        } else if let array = try? container.decode([AnyJSON].self) {
            self = .array(array)
        } else if let string = try? container.decode(String.self) {
            self = .string(string)
        } else if let bool = try? container.decode(Bool.self) {
            self = .bool(bool)
        } else if let number = try? container.decode(Double.self) {
            self = .number(number)
        } else {
            throw DecodingError.dataCorrupted(
                .init(codingPath: decoder.codingPath, debugDescription: "Invalid JSON value.")
            )
        }
    }
}

struct StringCodingKey: CodingKey, ExpressibleByStringLiteral {
    private let string: String
    private var int: Int?

    var stringValue: String { return string }

    init(string: String) {
        self.string = string
    }

    init?(stringValue: String) {
        self.string = stringValue
    }

    var intValue: Int? { return int }

    init?(intValue: Int) {
        self.string = String(describing: intValue)
        self.int = intValue
    }

    init(stringLiteral value: String) {
        self.string = value
    }
}
