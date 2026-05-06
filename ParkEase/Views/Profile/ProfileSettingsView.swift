import SwiftUI

struct ProfileSettingsView: View {
    @EnvironmentObject private var viewModel: ParkEaseViewModel

    var body: some View {
        List {
            Section {
                HStack(spacing: ParkEaseSpacing.md) {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.system(size: 48))
                        .foregroundStyle(ParkEaseColors.route)
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Shreya Rao")
                            .font(ParkEaseTypography.section)
                        Text("Computer Science · Year 2")
                            .font(ParkEaseTypography.caption)
                            .foregroundStyle(ParkEaseColors.secondaryText)
                    }
                }
                .padding(.vertical, 6)
            }

            Section("Preferences") {
                Toggle("Parking alerts", isOn: $viewModel.notificationsEnabled)
                Toggle("Prefer EV charging slots", isOn: $viewModel.prefersEVSlots)
                Toggle("Avoid congested gates", isOn: $viewModel.avoidsCongestion)
            }

            Section("Saved Areas") {
                ForEach(viewModel.parkingAreas.filter { $0.status != .full }) { area in
                    Label(area.name, systemImage: "mappin.circle.fill")
                        .foregroundStyle(ParkEaseColors.graphite)
                }
            }

            Section("Dashboards") {
                NavigationLink {
                    AlertsView()
                } label: {
                    Label("Smart Alerts", systemImage: "bell.badge.fill")
                }
                NavigationLink {
                    AnalyticsDashboardView()
                } label: {
                    Label("Campus Insights", systemImage: "chart.bar.xaxis")
                }
            }
        }
        .scrollContentBackground(.hidden)
        .background(ParkEaseColors.canvas)
        .navigationTitle("Profile")
    }
}
