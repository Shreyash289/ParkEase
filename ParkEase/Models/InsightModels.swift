import Foundation

struct CampusAlert: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let message: String
    let symbol: String
    let severity: AlertSeverity
    let time: String
}

enum AlertSeverity: String {
    case info
    case warning
    case critical
}

struct UsageInsight: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let value: String
    let trend: String
    let symbol: String
}

struct PeakHour: Identifiable, Hashable {
    let id = UUID()
    let label: String
    let occupancy: Double
}
