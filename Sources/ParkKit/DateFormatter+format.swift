import Foundation

internal extension DateFormatter {
    static var iso: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        df.timeZone = TimeZone(identifier: "UTC")
        return df
    }
}
