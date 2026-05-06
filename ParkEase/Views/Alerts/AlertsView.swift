import SwiftUI

struct AlertsView: View {
    @EnvironmentObject private var viewModel: ParkEaseViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: ParkEaseSpacing.sm) {
                ForEach(viewModel.alerts) { alert in
                    alertRow(alert)
                }
            }
            .padding(ParkEaseSpacing.md)
        }
        .background(ParkEaseColors.canvas.ignoresSafeArea())
        .navigationTitle("Alerts")
    }

    private func alertRow(_ alert: CampusAlert) -> some View {
        PremiumCard {
            HStack(alignment: .top, spacing: ParkEaseSpacing.md) {
                Image(systemName: alert.symbol)
                    .font(.headline)
                    .foregroundStyle(color(for: alert.severity))
                    .frame(width: 40, height: 40)
                    .background(color(for: alert.severity).opacity(0.12))
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 5) {
                    HStack {
                        Text(alert.title)
                            .font(ParkEaseTypography.section)
                        Spacer()
                        Text(alert.time)
                            .font(.caption2)
                            .foregroundStyle(ParkEaseColors.secondaryText)
                    }
                    Text(alert.message)
                        .font(ParkEaseTypography.callout)
                        .foregroundStyle(ParkEaseColors.secondaryText)
                }
            }
        }
    }

    private func color(for severity: AlertSeverity) -> Color {
        switch severity {
        case .info: ParkEaseColors.route
        case .warning: ParkEaseColors.warning
        case .critical: ParkEaseColors.occupied
        }
    }
}
