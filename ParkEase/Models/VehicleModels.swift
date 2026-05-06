import Foundation

enum VehicleType: String, CaseIterable, Identifiable {
    case car = "Car"
    case bike = "Bike"
    case scooter = "Scooter"

    var id: String { rawValue }

    var symbol: String {
        switch self {
        case .car: "car.fill"
        case .bike: "bicycle"
        case .scooter: "scooter"
        }
    }
}

struct Vehicle: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var plateNumber: String
    var type: VehicleType
    var colorName: String
    var isDefault: Bool
}

struct ParkingHistoryItem: Identifiable, Hashable {
    let id = UUID()
    let areaName: String
    let date: Date
    let durationMinutes: Int
    let costSavedEstimate: String
}
