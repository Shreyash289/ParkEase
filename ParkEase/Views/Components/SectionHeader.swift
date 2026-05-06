import SwiftUI

struct SectionHeader: View {
    let title: String
    var actionTitle: String?
    var action: (() -> Void)?

    var body: some View {
        HStack {
            Text(title)
                .font(ParkEaseTypography.section)
                .foregroundStyle(ParkEaseColors.graphite)
            Spacer()
            if let actionTitle, let action {
                Button(actionTitle, action: action)
                    .font(ParkEaseTypography.caption)
                    .foregroundStyle(ParkEaseColors.route)
            }
        }
        .padding(.horizontal, ParkEaseSpacing.md)
    }
}
