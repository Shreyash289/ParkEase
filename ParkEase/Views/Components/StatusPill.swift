import SwiftUI

struct StatusPill: View {
    let status: ParkingStatus

    var body: some View {
        Label(status.rawValue, systemImage: status.symbol)
            .font(ParkEaseTypography.caption)
            .foregroundStyle(status.color)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(status.color.opacity(0.12))
            .clipShape(Capsule())
    }
}
