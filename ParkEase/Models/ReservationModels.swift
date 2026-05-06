import Foundation

enum ReservationStatus: String {
    case ready = "Ready"
    case active = "Active"
    case completed = "Completed"
}

struct ParkingReservation: Identifiable, Hashable {
    let id = UUID()
    let area: ParkingArea
    let slot: ParkingSlot
    let vehicle: Vehicle
    let startTime: Date
    let endTime: Date
    let status: ReservationStatus
}
