import SwiftUI

struct ReservationView: View {
    @EnvironmentObject private var viewModel: ParkEaseViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: ParkEaseSpacing.lg) {
                selectedAreaCard
                    .padding(.horizontal, ParkEaseSpacing.md)

                PremiumCard {
                    VStack(alignment: .leading, spacing: ParkEaseSpacing.md) {
                        Text("Reservation Window")
                            .font(ParkEaseTypography.section)
                            .foregroundStyle(ParkEaseColors.graphite)
                        DatePicker("Start", selection: $viewModel.reservationStart, displayedComponents: [.hourAndMinute])
                        Stepper("Duration: \(viewModel.reservationDurationMinutes) minutes", value: $viewModel.reservationDurationMinutes, in: 30...180, step: 15)
                    }
                }
                .padding(.horizontal, ParkEaseSpacing.md)

                vehicleCard
                    .padding(.horizontal, ParkEaseSpacing.md)

                Button {
                    withAnimation(ParkEaseAnimation.gentle) {
                        viewModel.reserveSelectedArea()
                    }
                } label: {
                    Label("Reserve Parking Slot", systemImage: "checkmark.circle.fill")
                        .font(ParkEaseTypography.callout)
                        .frame(maxWidth: .infinity)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .tint(ParkEaseColors.route)
                .padding(.horizontal, ParkEaseSpacing.md)
                .disabled(viewModel.selectedArea?.availableSlots == 0)
            }
            .padding(.vertical, ParkEaseSpacing.md)
        }
        .background(ParkEaseColors.canvas.ignoresSafeArea())
        .navigationTitle("Reserve")
    }

    private var selectedAreaCard: some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: ParkEaseSpacing.sm) {
                Text("Selected Area")
                    .font(ParkEaseTypography.caption)
                    .foregroundStyle(ParkEaseColors.secondaryText)
                if let area = viewModel.selectedArea {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text(area.name)
                                .font(ParkEaseTypography.title)
                            Text("\(area.availableSlots) slots available · \(area.walkingMinutes) min walk")
                                .font(ParkEaseTypography.caption)
                                .foregroundStyle(ParkEaseColors.secondaryText)
                        }
                        Spacer()
                        StatusPill(status: area.status)
                    }
                }
            }
        }
    }

    private var vehicleCard: some View {
        PremiumCard {
            HStack(spacing: ParkEaseSpacing.md) {
                Image(systemName: viewModel.defaultVehicle?.type.symbol ?? "car.fill")
                    .font(.title2)
                    .foregroundStyle(ParkEaseColors.graphite)
                    .frame(width: 48, height: 48)
                    .background(ParkEaseColors.canvas)
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text(viewModel.defaultVehicle?.name ?? "Add Vehicle")
                        .font(ParkEaseTypography.section)
                    Text(viewModel.defaultVehicle?.plateNumber ?? "Vehicle details required")
                        .font(ParkEaseTypography.caption)
                        .foregroundStyle(ParkEaseColors.secondaryText)
                }
                Spacer()
            }
        }
    }
}
