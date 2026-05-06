import Foundation

@MainActor
final class ParkEaseViewModel: ObservableObject {
    @Published var parkingAreas: [ParkingArea] = SampleData.parkingAreas
    @Published var selectedArea: ParkingArea? = SampleData.parkingAreas.first
    @Published var vehicles: [Vehicle] = SampleData.vehicles
    @Published var activeReservation: ParkingReservation?
    @Published var alerts: [CampusAlert] = SampleData.alerts
    @Published var insights: [UsageInsight] = SampleData.insights
    @Published var peakHours: [PeakHour] = SampleData.peakHours
    @Published var history: [ParkingHistoryItem] = SampleData.history
    @Published var reservationStart = Date.now.addingTimeInterval(900)
    @Published var reservationDurationMinutes = 60
    @Published var notificationsEnabled = true
    @Published var prefersEVSlots = false
    @Published var avoidsCongestion = true

    var totalAvailableSlots: Int {
        parkingAreas.reduce(0) { $0 + $1.availableSlots }
    }

    var totalSlots: Int {
        parkingAreas.reduce(0) { $0 + $1.totalSlots }
    }

    var bestArea: ParkingArea? {
        parkingAreas
            .filter { $0.availableSlots > 0 }
            .sorted {
                if avoidsCongestion {
                    if $0.walkingMinutes == $1.walkingMinutes {
                        return $0.congestionLevel < $1.congestionLevel
                    }
                    return $0.walkingMinutes < $1.walkingMinutes
                }
                return $0.walkingMinutes < $1.walkingMinutes
            }
            .first
    }

    var defaultVehicle: Vehicle? {
        vehicles.first(where: \.isDefault) ?? vehicles.first
    }

    func reserveSelectedArea() {
        guard let area = selectedArea, let vehicle = defaultVehicle else { return }
        let slot = SampleData.slots.first(where: { $0.areaCode == area.code }) ?? SampleData.slots[0]
        activeReservation = ParkingReservation(
            area: area,
            slot: slot,
            vehicle: vehicle,
            startTime: reservationStart,
            endTime: reservationStart.addingTimeInterval(Double(reservationDurationMinutes * 60)),
            status: .ready
        )
    }

    func selectRecommendedArea() {
        selectedArea = bestArea
    }
}
