import Foundation

enum SampleData {
    static let parkingAreas: [ParkingArea] = [
        ParkingArea(
            name: "North Academic Lot",
            code: "N1",
            totalSlots: 120,
            availableSlots: 36,
            occupiedSlots: 84,
            walkingMinutes: 4,
            distanceMeters: 260,
            congestionLevel: 0.34,
            coordinate: CampusCoordinate(x: 0.20, y: 0.28),
            notes: "Best for library, labs, and design block."
        ),
        ParkingArea(
            name: "Innovation Center",
            code: "I2",
            totalSlots: 82,
            availableSlots: 11,
            occupiedSlots: 71,
            walkingMinutes: 2,
            distanceMeters: 140,
            congestionLevel: 0.72,
            coordinate: CampusCoordinate(x: 0.62, y: 0.22),
            notes: "Close to startup cell and seminar hall."
        ),
        ParkingArea(
            name: "Sports Complex",
            code: "S4",
            totalSlots: 96,
            availableSlots: 0,
            occupiedSlots: 96,
            walkingMinutes: 8,
            distanceMeters: 520,
            congestionLevel: 0.88,
            coordinate: CampusCoordinate(x: 0.78, y: 0.68),
            notes: "Usually full during evening practice."
        ),
        ParkingArea(
            name: "East Faculty Parking",
            code: "E3",
            totalSlots: 64,
            availableSlots: 28,
            occupiedSlots: 36,
            walkingMinutes: 5,
            distanceMeters: 310,
            congestionLevel: 0.25,
            coordinate: CampusCoordinate(x: 0.34, y: 0.72),
            notes: "Quiet entry gate with wider spaces."
        )
    ]

    static let slots: [ParkingSlot] = [
        ParkingSlot(id: "N1-A12", areaCode: "N1", level: "Ground", isEV: false, isAccessible: false),
        ParkingSlot(id: "N1-B04", areaCode: "N1", level: "Ground", isEV: true, isAccessible: false),
        ParkingSlot(id: "I2-C08", areaCode: "I2", level: "Basement", isEV: false, isAccessible: true),
        ParkingSlot(id: "E3-F11", areaCode: "E3", level: "Ground", isEV: false, isAccessible: false)
    ]

    static let vehicles: [Vehicle] = [
        Vehicle(name: "Honda City", plateNumber: "KA 05 MQ 2148", type: .car, colorName: "Graphite", isDefault: true),
        Vehicle(name: "Ather 450X", plateNumber: "KA 03 EV 9211", type: .scooter, colorName: "White", isDefault: false)
    ]

    static let alerts: [CampusAlert] = [
        CampusAlert(title: "Sports Complex is full", message: "Use East Faculty Parking for the next 40 minutes.", symbol: "exclamationmark.triangle.fill", severity: .warning, time: "Now"),
        CampusAlert(title: "Reservation reminder", message: "N1-A12 is held until 10:45 AM.", symbol: "clock.badge.checkmark", severity: .info, time: "8 min"),
        CampusAlert(title: "Gate 2 congestion", message: "Prefer the north gate for a faster entry.", symbol: "car.2.fill", severity: .critical, time: "12 min")
    ]

    static let insights: [UsageInsight] = [
        UsageInsight(title: "Avg. search time", value: "3.8 min", trend: "-18% this week", symbol: "timer"),
        UsageInsight(title: "Trips logged", value: "24", trend: "+6 from April", symbol: "point.3.connected.trianglepath.dotted"),
        UsageInsight(title: "Best arrival", value: "8:20 AM", trend: "Least congestion", symbol: "sunrise.fill")
    ]

    static let peakHours: [PeakHour] = [
        PeakHour(label: "8 AM", occupancy: 0.44),
        PeakHour(label: "9 AM", occupancy: 0.86),
        PeakHour(label: "10 AM", occupancy: 0.74),
        PeakHour(label: "12 PM", occupancy: 0.58),
        PeakHour(label: "2 PM", occupancy: 0.63),
        PeakHour(label: "5 PM", occupancy: 0.92)
    ]

    static let history: [ParkingHistoryItem] = [
        ParkingHistoryItem(areaName: "North Academic Lot", date: .now.addingTimeInterval(-86_400), durationMinutes: 145, costSavedEstimate: "12 min saved"),
        ParkingHistoryItem(areaName: "East Faculty Parking", date: .now.addingTimeInterval(-172_800), durationMinutes: 90, costSavedEstimate: "8 min saved"),
        ParkingHistoryItem(areaName: "Innovation Center", date: .now.addingTimeInterval(-259_200), durationMinutes: 210, costSavedEstimate: "15 min saved")
    ]
}
