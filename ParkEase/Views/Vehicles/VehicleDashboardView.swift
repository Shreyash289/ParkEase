import SwiftUI

struct VehicleDashboardView: View {
    @EnvironmentObject private var viewModel: ParkEaseViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: ParkEaseSpacing.lg) {
                SectionHeader(title: "Saved Vehicles")
                VStack(spacing: ParkEaseSpacing.sm) {
                    ForEach(viewModel.vehicles) { vehicle in
                        vehicleRow(vehicle)
                    }
                }
                .padding(.horizontal, ParkEaseSpacing.md)

                HStack(spacing: ParkEaseSpacing.sm) {
                    MetricCard(title: "This month", value: "9h 15m", subtitle: "Parked on campus", symbol: "clock.fill", tint: ParkEaseColors.warning)
                    MetricCard(title: "Time saved", value: "35m", subtitle: "From recommendations", symbol: "bolt.fill", tint: ParkEaseColors.available)
                }
                .padding(.horizontal, ParkEaseSpacing.md)

                SectionHeader(title: "Parking History")
                VStack(spacing: ParkEaseSpacing.sm) {
                    ForEach(viewModel.history) { item in
                        historyRow(item)
                    }
                }
                .padding(.horizontal, ParkEaseSpacing.md)
            }
            .padding(.vertical, ParkEaseSpacing.md)
        }
        .background(ParkEaseColors.canvas.ignoresSafeArea())
        .navigationTitle("Vehicles")
    }

    private func vehicleRow(_ vehicle: Vehicle) -> some View {
        PremiumCard {
            HStack(spacing: ParkEaseSpacing.md) {
                Image(systemName: vehicle.type.symbol)
                    .font(.title2)
                    .foregroundStyle(ParkEaseColors.route)
                    .frame(width: 46, height: 46)
                    .background(ParkEaseColors.route.opacity(0.11))
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text(vehicle.name)
                            .font(ParkEaseTypography.section)
                        if vehicle.isDefault {
                            Text("Default")
                                .font(.caption2.weight(.semibold))
                                .foregroundStyle(ParkEaseColors.available)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 4)
                                .background(ParkEaseColors.available.opacity(0.12))
                                .clipShape(Capsule())
                        }
                    }
                    Text("\(vehicle.plateNumber) · \(vehicle.colorName)")
                        .font(ParkEaseTypography.caption)
                        .foregroundStyle(ParkEaseColors.secondaryText)
                }
                Spacer()
            }
        }
    }

    private func historyRow(_ item: ParkingHistoryItem) -> some View {
        PremiumCard {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(item.areaName)
                        .font(ParkEaseTypography.callout)
                        .foregroundStyle(ParkEaseColors.graphite)
                    Text("\(item.date.shortDate) · \(item.durationMinutes) min")
                        .font(ParkEaseTypography.caption)
                        .foregroundStyle(ParkEaseColors.secondaryText)
                }
                Spacer()
                Text(item.costSavedEstimate)
                    .font(ParkEaseTypography.caption)
                    .foregroundStyle(ParkEaseColors.available)
            }
        }
    }
}
