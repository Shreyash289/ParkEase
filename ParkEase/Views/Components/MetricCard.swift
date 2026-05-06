import SwiftUI

struct MetricCard: View {
    let title: String
    let value: String
    let subtitle: String
    let symbol: String
    let tint: Color

    var body: some View {
        PremiumCard {
            VStack(alignment: .leading, spacing: ParkEaseSpacing.sm) {
                Image(systemName: symbol)
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundStyle(tint)
                    .frame(width: 34, height: 34)
                    .background(tint.opacity(0.12))
                    .clipShape(Circle())

                Text(value)
                    .font(ParkEaseTypography.metric)
                    .foregroundStyle(ParkEaseColors.graphite)

                VStack(alignment: .leading, spacing: 3) {
                    Text(title)
                        .font(ParkEaseTypography.caption)
                        .foregroundStyle(ParkEaseColors.graphite)
                    Text(subtitle)
                        .font(.caption2)
                        .foregroundStyle(ParkEaseColors.secondaryText)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
