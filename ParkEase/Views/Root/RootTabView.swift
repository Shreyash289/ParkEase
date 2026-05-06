import SwiftUI

struct RootTabView: View {
    @EnvironmentObject private var viewModel: ParkEaseViewModel

    var body: some View {
        TabView {
            NavigationStack {
                HomeView()
            }
            .tabItem { Label("Home", systemImage: "house.fill") }

            NavigationStack {
                CampusNavigationView()
            }
            .tabItem { Label("Map", systemImage: "map.fill") }

            NavigationStack {
                ReservationView()
            }
            .tabItem { Label("Reserve", systemImage: "calendar.badge.clock") }

            NavigationStack {
                VehicleDashboardView()
            }
            .tabItem { Label("Vehicles", systemImage: "car.fill") }

            NavigationStack {
                ProfileSettingsView()
            }
            .tabItem { Label("Profile", systemImage: "person.crop.circle.fill") }
        }
        .tint(ParkEaseColors.route)
    }
}
