import SwiftUI

struct CampusNavigationView: View {
    @EnvironmentObject private var viewModel: ParkEaseViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: ParkEaseSpacing.lg) {
                CampusMapView(areas: viewModel.parkingAreas, selectedArea: viewModel.selectedArea) { area in
                    withAnimation(ParkEaseAnimation.gentle) {
                        viewModel.selectedArea = area
                    }
                }
                .padding(.horizontal, ParkEaseSpacing.md)

                if let area = viewModel.selectedArea {
                    routeCard(area)
                        .padding(.horizontal, ParkEaseSpacing.md)
                }

                SectionHeader(title: "Smart Directions")
                VStack(spacing: ParkEaseSpacing.sm) {
                    directionRow("Enter through North Gate", detail: "Usually 2 minutes faster right now", symbol: "arrow.turn.up.right")
                    directionRow("Follow inner loop road", detail: "Avoids the sports complex queue", symbol: "road.lanes")
                    directionRow("Walk from \(viewModel.selectedArea?.code ?? "N1")", detail: "\(viewModel.selectedArea?.walkingMinutes ?? 4) minutes to academic block", symbol: "figure.walk")
                }
                .padding(.horizontal, ParkEaseSpacing.md)
            }
            .padding(.vertical, ParkEaseSpacing.md)
        }
        .background(ParkEaseColors.canvas.ignoresSafeArea())
        .navigationTitle("Campus Map")
    }

    private func routeCard(_ area: ParkingArea) -> some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: ParkEaseSpacing.md) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(area.name)
                            .font(ParkEaseTypography.title)
                            .foregroundStyle(ParkEaseColors.graphite)
                        Text(area.notes)
                            .font(ParkEaseTypography.callout)
                            .foregroundStyle(ParkEaseColors.secondaryText)
                    }
                    Spacer()
                    StatusPill(status: area.status)
                }

                HStack {
                    MetricLine(value: "\(area.walkingMinutes)m", label: "Walk")
                    Divider()
                    MetricLine(value: "\(area.availableSlots)", label: "Free")
                    Divider()
                    MetricLine(value: "\(Int(area.congestionLevel * 100))%", label: "Busy")
                }
            }
        }
    }

    private func directionRow(_ title: String, detail: String, symbol: String) -> some View {
        PremiumCard {
            HStack(spacing: ParkEaseSpacing.md) {
                Image(systemName: symbol)
                    .font(.headline)
                    .foregroundStyle(ParkEaseColors.route)
                    .frame(width: 38, height: 38)
                    .background(ParkEaseColors.route.opacity(0.11))
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(ParkEaseTypography.callout)
                        .foregroundStyle(ParkEaseColors.graphite)
                    Text(detail)
                        .font(ParkEaseTypography.caption)
                        .foregroundStyle(ParkEaseColors.secondaryText)
                }
                Spacer()
            }
        }
    }
}

private struct MetricLine: View {
    let value: String
    let label: String

    var body: some View {
        VStack(spacing: 3) {
            Text(value)
                .font(ParkEaseTypography.metric)
                .foregroundStyle(ParkEaseColors.graphite)
            Text(label)
                .font(.caption2)
                .foregroundStyle(ParkEaseColors.secondaryText)
        }
        .frame(maxWidth: .infinity)
    }
}
