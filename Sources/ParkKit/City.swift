import Foundation

/// Slightly bigger than a town, you get the idea.
public struct City: Decodable {
    /// Name of the city, e.g. "Dresden"
    public let name: String
    /// Center coordinate
    public let coordinate: WGSCoordinate
    /// The data source where ParkAPI gathers the lot data. Could be a feed or HTML page.
    public let source: URL
    /// A url that can be used for linking to a city's data.
    public let url: URL
    /// Attribution information containing metadata, if known.
    public let attribution: Attribution?
    /// True if the city is being actively supported (meaning it's updated rather quickly if things break).
    public let isActivelySupported: Bool

    private enum CodingKeys: String, CodingKey {
        case name
        case coordinate = "coords"
        case source
        case url
        case attribution
        case isActivelySupported = "activeSupport"
    }

    /// Attribution information
    public struct Attribution: Decodable {
        /// Who owns or contributed the given data.
        let contributor: String
        /// What license is the data being provided under.
        let license: String
        /// URL to more legal information regarding the data.
        let url: URL
    }
}
