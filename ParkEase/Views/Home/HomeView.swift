import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel: ParkEaseViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: ParkEaseSpacing.lg) {
                header

                HStack(spacing: ParkEaseSpacing.sm) {
                    MetricCard(title: "Open slots", value: "\(viewModel.totalAvailableSlots)", subtitle: "\(viewModel.totalSlots) total", symbol: "parkingsign.circle.fill", tint: ParkEaseColors.available)
                    MetricCard(title: "Best option", value: viewModel.bestArea?.code ?? "--", subtitle: viewModel.bestArea?.name ?? "Checking", symbol: "location.fill", tint: ParkEaseColors.route)
                }
                .padding(.horizontal, ParkEaseSpacing.md)

                if let reservation = viewModel.activeReservation {
                    activeReservationCard(reservation)
                        .padding(.horizontal, ParkEaseSpacing.md)
                }

                SectionHeader(title: "Live Availability", actionTitle: "Recommend") {
                    withAnimation(ParkEaseAnimation.gentle) {
                        viewModel.selectRecommendedArea()
                    }
                }

                VStack(spacing: ParkEaseSpacing.sm) {
                    ForEach(viewModel.parkingAreas) { area in
                        ParkingAreaCard(area: area, isSelected: area.id == viewModel.selectedArea?.id) {
                            withAnimation(ParkEaseAnimation.gentle) {
                                viewModel.selectedArea = area
                            }
                        }
                    }
                }
                .padding(.horizontal, ParkEaseSpacing.md)
            }
            .padding(.vertical, ParkEaseSpacing.md)
        }
        .background(ParkEaseColors.canvas.ignoresSafeArea())
        .navigationTitle("ParkEase")
    }

    private var header: some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: ParkEaseSpacing.md) {
                HStack {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Good morning")
                            .font(ParkEaseTypography.caption)
                            .foregroundStyle(ParkEaseColors.secondaryText)
                        Text("Find a calm spot before class.")
                            .font(ParkEaseTypography.title)
                            .foregroundStyle(ParkEaseColors.graphite)
                    }
                    Spacer()
                    Image(systemName: "steeringwheel")
                        .font(.title2)
                        .foregroundStyle(ParkEaseColors.warning)
                        .frame(width: 48, height: 48)
                        .background(ParkEaseColors.warning.opacity(0.12))
                        .clipShape(Circle())
                }

                if let best = viewModel.bestArea {
                    Label("\(best.name) has \(best.availableSlots) free slots, \(best.walkingMinutes) minutes away.", systemImage: "sparkle.magnifyingglass")
                        .font(ParkEaseTypography.callout)
                        .foregroundStyle(ParkEaseColors.graphite)
                }
            }
        }
        .padding(.horizontal, ParkEaseSpacing.md)
    }

    private func activeReservationCard(_ reservation: ParkingReservation) -> some View {
        PremiumCard {
            HStack(spacing: ParkEaseSpacing.md) {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundStyle(ParkEaseColors.available)
                    .font(.title2)
                VStack(alignment: .leading, spacing: 4) {
                    Text("Reserved \(reservation.slot.id)")
                        .font(ParkEaseTypography.section)
                        .foregroundStyle(ParkEaseColors.graphite)
                    Text("\(reservation.startTime.shortTime) - \(reservation.endTime.shortTime) · \(reservation.vehicle.name)")
                        .font(ParkEaseTypography.caption)
                        .foregroundStyle(ParkEaseColors.secondaryText)
                }
                Spacer()
            }
        }
    }
}
