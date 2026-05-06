import SwiftUI

struct AnalyticsDashboardView: View {
    @EnvironmentObject private var viewModel: ParkEaseViewModel

    var body: some View {
        ScrollView {
            VStack(spacing: ParkEaseSpacing.lg) {
                HStack(spacing: ParkEaseSpacing.sm) {
                    ForEach(viewModel.insights.prefix(2)) { insight in
                        MetricCard(title: insight.title, value: insight.value, subtitle: insight.trend, symbol: insight.symbol, tint: ParkEaseColors.route)
                    }
                }
                .padding(.horizontal, ParkEaseSpacing.md)

                PremiumCard {
                    VStack(alignment: .leading, spacing: ParkEaseSpacing.md) {
                        Text("Peak Parking Hours")
                            .font(ParkEaseTypography.section)
                        HStack(alignment: .bottom, spacing: 12) {
                            ForEach(viewModel.peakHours) { hour in
                                VStack(spacing: 8) {
                                    RoundedRectangle(cornerRadius: 6, style: .continuous)
                                        .fill(hour.occupancy > 0.8 ? ParkEaseColors.warning : ParkEaseColors.available)
                                        .frame(height: max(24, 138 * hour.occupancy))
                                    Text(hour.label)
                                        .font(.caption2)
                                        .foregroundStyle(ParkEaseColors.secondaryText)
                                }
                                .frame(maxWidth: .infinity)
                            }
                        }
                        .frame(height: 178, alignment: .bottom)
                    }
                }
                .padding(.horizontal, ParkEaseSpacing.md)

                SectionHeader(title: "Campus Insights")
                VStack(spacing: ParkEaseSpacing.sm) {
                    ForEach(viewModel.insights) { insight in
                        insightRow(insight)
                    }
                }
                .padding(.horizontal, ParkEaseSpacing.md)
            }
            .padding(.vertical, ParkEaseSpacing.md)
        }
        .background(ParkEaseColors.canvas.ignoresSafeArea())
        .navigationTitle("Insights")
    }

    private func insightRow(_ insight: UsageInsight) -> some View {
        PremiumCard {
            HStack(spacing: ParkEaseSpacing.md) {
                Image(systemName: insight.symbol)
                    .foregroundStyle(ParkEaseColors.warning)
                    .frame(width: 38, height: 38)
                    .background(ParkEaseColors.warning.opacity(0.12))
                    .clipShape(Circle())
                VStack(alignment: .leading, spacing: 4) {
                    Text(insight.title)
                        .font(ParkEaseTypography.callout)
                    Text(insight.trend)
                        .font(ParkEaseTypography.caption)
                        .foregroundStyle(ParkEaseColors.secondaryText)
                }
                Spacer()
                Text(insight.value)
                    .font(ParkEaseTypography.section)
            }
        }
    }
}
