import Foundation
import SwiftUI

enum ParkingStatus: String, CaseIterable, Identifiable {
    case available = "Available"
    case limited = "Limited"
    case full = "Full"

    var id: String { rawValue }

    var color: Color {
        switch self {
        case .available: ParkEaseColors.slotAvailable
        case .limited: ParkEaseColors.slotLimited
        case .full: ParkEaseColors.slotFull
        }
    }

    var symbol: String {
        switch self {
        case .available: "checkmark.circle.fill"
        case .limited: "exclamationmark.circle.fill"
        case .full: "xmark.circle.fill"
        }
    }
}

struct ParkingArea: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let code: String
    let totalSlots: Int
    let availableSlots: Int
    let occupiedSlots: Int
    let walkingMinutes: Int
    let distanceMeters: Int
    let congestionLevel: Double
    let coordinate: CampusCoordinate
    let notes: String

    var status: ParkingStatus {
        let ratio = Double(availableSlots) / Double(totalSlots)
        if ratio == 0 { return .full }
        if ratio < 0.22 { return .limited }
        return .available
    }

    var availabilityRatio: Double {
        Double(availableSlots) / Double(totalSlots)
    }
}

struct CampusCoordinate: Hashable {
    let x: Double
    let y: Double
}

struct ParkingSlot: Identifiable, Hashable {
    let id: String
    let areaCode: String
    let level: String
    let isEV: Bool
    let isAccessible: Bool
}
