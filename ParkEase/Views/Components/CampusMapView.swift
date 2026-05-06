import SwiftUI

struct CampusMapView: View {
    let areas: [ParkingArea]
    let selectedArea: ParkingArea?
    var onSelect: (ParkingArea) -> Void
    @State private var pulse = false

    var body: some View {
        GeometryReader { proxy in
            ZStack {
                RoundedRectangle(cornerRadius: 22, style: .continuous)
                    .fill(ParkEaseColors.card)

                campusRoads
                    .stroke(ParkEaseColors.line, style: StrokeStyle(lineWidth: 8, lineCap: .round))
                    .padding(28)

                campusBuildings

                ForEach(areas) { area in
                    Button {
                        onSelect(area)
                    } label: {
                        VStack(spacing: 5) {
                            ZStack {
                                Circle()
                                    .fill(area.status.color.opacity(selectedArea?.id == area.id ? 0.22 : 0.12))
                                    .frame(width: selectedArea?.id == area.id ? 54 : 42)
                                    .scaleEffect(selectedArea?.id == area.id && pulse ? 1.08 : 1.0)
                                Circle()
                                    .fill(area.status.color)
                                    .frame(width: 18, height: 18)
                                    .overlay(Circle().stroke(.white, lineWidth: 3))
                            }
                            Text(area.code)
                                .font(.caption2.weight(.bold))
                                .foregroundStyle(ParkEaseColors.graphite)
                        }
                    }
                    .buttonStyle(.plain)
                    .position(x: proxy.size.width * area.coordinate.x, y: proxy.size.height * area.coordinate.y)
                }
            }
            .overlay(alignment: .topLeading) {
                Label("Campus parking map", systemImage: "map.fill")
                    .font(ParkEaseTypography.caption)
                    .foregroundStyle(ParkEaseColors.secondaryText)
                    .padding(10)
                    .background(.thinMaterial)
                    .clipShape(Capsule())
                    .padding(12)
            }
            .onAppear {
                withAnimation(ParkEaseAnimation.mapPulse) {
                    pulse = true
                }
            }
        }
        .frame(height: 310)
    }

    private var campusRoads: Path {
        Path { path in
            path.move(to: CGPoint(x: 20, y: 70))
            path.addCurve(to: CGPoint(x: 280, y: 72), control1: CGPoint(x: 90, y: 10), control2: CGPoint(x: 210, y: 130))
            path.move(to: CGPoint(x: 70, y: 20))
            path.addCurve(to: CGPoint(x: 225, y: 240), control1: CGPoint(x: 45, y: 120), control2: CGPoint(x: 175, y: 148))
            path.move(to: CGPoint(x: 15, y: 220))
            path.addLine(to: CGPoint(x: 280, y: 175))
        }
    }

    private var campusBuildings: some View {
        ZStack {
            building("Library", x: 0.30, y: 0.47)
            building("Labs", x: 0.53, y: 0.44)
            building("Admin", x: 0.58, y: 0.75)
        }
    }

    private func building(_ label: String, x: CGFloat, y: CGFloat) -> some View {
        Text(label)
            .font(.caption2.weight(.semibold))
            .foregroundStyle(ParkEaseColors.secondaryText)
            .padding(.horizontal, 10)
            .padding(.vertical, 7)
            .background(ParkEaseColors.canvas)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .position(x: 320 * x, y: 270 * y)
    }
}
