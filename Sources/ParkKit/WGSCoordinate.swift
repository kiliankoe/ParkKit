import Foundation
#if canImport(CoreLocation)
import CoreLocation
#endif

public struct WGSCoordinate: Decodable {
    public let latitude: Double
    public let longitude: Double

    private enum CodingKeys: String, CodingKey {
        case latitude = "lat"
        case longitude = "lng"
    }

    #if canImport(CoreLocation)
    public var coordinate2D: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    #endif
}
