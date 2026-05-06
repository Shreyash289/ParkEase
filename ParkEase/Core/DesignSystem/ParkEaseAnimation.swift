import SwiftUI

enum ParkEaseAnimation {
    static let gentle = Animation.spring(response: 0.36, dampingFraction: 0.86)
    static let quick = Animation.easeOut(duration: 0.18)
    static let mapPulse = Animation.easeInOut(duration: 1.4).repeatForever(autoreverses: true)
}
