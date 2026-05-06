import SwiftUI

struct ParkingAreaCard: View {
    let area: ParkingArea
    var isSelected = false
    var onTap: (() -> Void)?

    var body: some View {
        Button {
            onTap?()
        } label: {
            PremiumCard {
                VStack(alignment: .leading, spacing: ParkEaseSpacing.md) {
                    HStack(alignment: .top) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(area.name)
                                .font(ParkEaseTypography.section)
                                .foregroundStyle(ParkEaseColors.graphite)
                            Text("\(area.walkingMinutes) min walk · \(area.distanceMeters)m")
                                .font(ParkEaseTypography.caption)
                                .foregroundStyle(ParkEaseColors.secondaryText)
                        }
                        Spacer()
                        StatusPill(status: area.status)
                    }

                    ProgressView(value: area.availabilityRatio)
                        .tint(area.status.color)

                    HStack {
                        Label("\(area.availableSlots) free", systemImage: "parkingsign.circle.fill")
                        Spacer()
                        Label("\(Int(area.congestionLevel * 100))% busy", systemImage: "speedometer")
                    }
                    .font(ParkEaseTypography.caption)
                    .foregroundStyle(ParkEaseColors.secondaryText)
                }
            }
            .overlay(
                RoundedRectangle(cornerRadius: 18, style: .continuous)
                    .stroke(isSelected ? ParkEaseColors.route : .clear, lineWidth: 2)
            )
        }
        .buttonStyle(.plain)
    }
}
