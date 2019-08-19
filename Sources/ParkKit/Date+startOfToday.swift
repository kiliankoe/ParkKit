import Foundation

extension Date {
    static var startOfToday: Date? {
        let date = Date()
        guard !date.isStartOfDay else { return date }
        return date
            .zero(out: .second)?
            .zero(out: .minute)?
            .zero(out: .hour)?
            .addingTimeInterval(-24 * 60 * 60)
    }

    private func zero(out: Calendar.Component) -> Date? {
        return Calendar.current
            .date(bySetting: out, value: 0, of: self)
    }

    private var isStartOfDay: Bool {
        let cal = Calendar.current
        let hours = cal.component(.hour, from: self)
        let minutes = cal.component(.minute, from: self)
        let seconds = cal.component(.second, from: self)
        return hours == 0 && minutes == 0 && seconds == 0
    }
}
