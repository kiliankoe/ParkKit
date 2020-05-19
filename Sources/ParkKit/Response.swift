import Foundation

/// Meta response value containing a list of all supported cities supported by this server.
public struct MetaResponse: Decodable {
    /// Current API version.
    public let apiVersion: String
    /// Current server software version, e.g. the version of ParkAPI running on the server.
    public let serverVersion: String
    /// A reference to the instance running on the server. Possibly a project URL.
    public let reference: String

    /// The actual list of cities and their data.
    public let cities: [String: City]
}

/// Lot response value containing a list of all lots for a given city and timestamps for when the data was last updated.
public struct LotResponse: Decodable {
    /// Timestamp when the data was downloaded from the city's server. Should never be more than ~5 minutes ago.
    public let lastDownloaded: Date
    /// Timestamp when the data was presumably last updated on the city's server.
    public let lastUpdated: Date

    /// The actual list of lots and their data.
    public let lots: [Lot]
}

/// Forecast response value containing a list of forecast values.
public struct ForecastResponse: Decodable {
    /// Version of the forecast data.
    public let version: Double
    /// The actual forecast data as a list of dates and load values.
    public let forecast: [(Date, Int)]

    private enum CodingKeys: String, CodingKey {
        case version
        case forecast
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.version = try container.decode(Double.self, forKey: .version)

        #warning("TODO: Decode forecast data")
        self.forecast = []
    }
}
