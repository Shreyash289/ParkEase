import SwiftUI

@main
struct ParkEaseApp: App {
    @StateObject private var viewModel = ParkEaseViewModel()

    var body: some Scene {
        WindowGroup {
            RootTabView()
                .environmentObject(viewModel)
        }
    }
}
