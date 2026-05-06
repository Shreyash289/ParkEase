# ParkEase

ParkEase is a premium SwiftUI prototype for smart campus parking and navigation. It helps students and faculty find open parking areas, compare congestion, reserve a slot, review saved vehicles, receive parking alerts, and understand campus parking patterns.

## GitHub Repository Description

Smart Campus Parking & Navigation iOS app built with SwiftUI, MVVM, Apple-style design, live parking availability, reservations, vehicle history, alerts, and campus insights.

## Product Positioning

ParkEase is designed like a practical App Store utility for a university campus. The UI avoids generic dashboard styling and uses off-white surfaces, graphite typography, subtle green status indicators, warm orange highlights, and calm native iOS navigation.

## Features

- Live parking availability with available, limited, and full status cards
- Campus parking map UI with route guidance and walking-time estimates
- Time-based parking reservation flow with default vehicle details
- Smart alerts for full lots, reminders, and gate congestion
- Vehicle dashboard with saved vehicles, parking history, time tracking, and usage insights
- Analytics dashboard with peak parking hours and campus usage statistics
- Profile and settings with notification, EV slot, congestion, and saved-area preferences
- Dark mode support through asset catalog color variants

## Tech Stack

- Swift
- SwiftUI
- MVVM architecture
- SF Symbols
- Xcode iOS app target
- Asset catalog based design tokens

## Folder Structure

```text
ParkEase/
  App/
    ParkEaseApp.swift
    Info.plist
  Core/
    DesignSystem/
      ParkEaseAnimation.swift
      ParkEaseColors.swift
      ParkEaseSpacing.swift
      ParkEaseTypography.swift
    Extensions/
      Date+Formatting.swift
  Data/
    SampleData.swift
  Models/
    InsightModels.swift
    ParkingModels.swift
    ReservationModels.swift
    VehicleModels.swift
  Resources/
    Assets.xcassets
  ViewModels/
    ParkEaseViewModel.swift
  Views/
    Alerts/
    Analytics/
    Components/
    Home/
    Map/
    Profile/
    Reservation/
    Root/
    Vehicles/
ParkEase.xcodeproj/
```

## Architecture

ParkEase uses a compact MVVM structure:

- `Models` define campus parking, reservations, vehicles, alerts, and analytics data.
- `SampleData` provides realistic prototype data for demos and screenshots.
- `ParkEaseViewModel` owns shared app state and user actions such as selecting a lot and creating a reservation.
- `Views` stay focused on layout and user interaction.
- `Core/DesignSystem` centralizes colors, typography, spacing, and animations.

## File-By-File Output

- `ParkEase/App/ParkEaseApp.swift`: App entry point and shared environment object.
- `ParkEase/App/Info.plist`: App display name and launch configuration.
- `ParkEase/Core/DesignSystem/ParkEaseColors.swift`: Named color accessors for the palette.
- `ParkEase/Core/DesignSystem/ParkEaseTypography.swift`: Apple-inspired text scale.
- `ParkEase/Core/DesignSystem/ParkEaseSpacing.swift`: Shared spacing constants.
- `ParkEase/Core/DesignSystem/ParkEaseAnimation.swift`: Reusable spring and pulse animations.
- `ParkEase/Core/Extensions/Date+Formatting.swift`: Small date display helpers.
- `ParkEase/Models/*.swift`: Parking, vehicle, reservation, alert, and analytics types.
- `ParkEase/Data/SampleData.swift`: Campus lots, vehicles, alerts, history, and chart data.
- `ParkEase/ViewModels/ParkEaseViewModel.swift`: MVVM state container and reservation logic.
- `ParkEase/Views/Components/*.swift`: Reusable premium cards, metrics, map, status, and section UI.
- `ParkEase/Views/Home/HomeView.swift`: Live availability and recommended parking overview.
- `ParkEase/Views/Map/CampusNavigationView.swift`: Campus map, selected area, and smart directions.
- `ParkEase/Views/Reservation/ReservationView.swift`: Slot reservation and vehicle confirmation.
- `ParkEase/Views/Vehicles/VehicleDashboardView.swift`: Saved vehicles and parking history.
- `ParkEase/Views/Analytics/AnalyticsDashboardView.swift`: Usage insights and peak-hour chart.
- `ParkEase/Views/Alerts/AlertsView.swift`: Smart notification feed.
- `ParkEase/Views/Profile/ProfileSettingsView.swift`: Profile, preferences, saved areas, and dashboard links.

## Design System

The app uses a restrained Apple-style visual language:

- Background: warm off-white `Canvas`
- Cards: soft white `Card`
- Text: graphite and muted gray
- Success: subtle campus green
- Warnings: warm orange
- Routes: muted teal
- Corners: 18pt cards, capsule status pills
- Motion: short spring transitions and quiet map pulse

## SF Symbols Recommendations

Used and recommended symbols:

- `parkingsign.circle.fill`
- `map.fill`
- `calendar.badge.clock`
- `car.fill`
- `steeringwheel`
- `location.fill`
- `figure.walk`
- `bell.badge.fill`
- `chart.bar.xaxis`
- `timer`
- `bolt.fill`
- `checkmark.seal.fill`

## Asset Recommendations

For a stronger App Store presentation, add:

- A custom 1024x1024 app icon with a rounded parking `P`, campus path line, muted green marker, and off-white base.
- Three campus map marker illustrations in green, orange, and red.
- Optional onboarding screenshots using real iPhone frames.
- A small campus logo if the app is adapted for a specific university.

## Suggested Screenshots and Mockups

Capture these simulator screens:

1. Home screen with live availability and the recommended parking lot.
2. Campus map with a selected parking area and smart directions.
3. Reservation screen after reserving a slot.
4. Vehicle dashboard showing saved vehicles and history.
5. Profile screen with settings and dashboard links.

## Setup Instructions for Xcode

1. Open `ParkEase.xcodeproj` in Xcode 16 or newer.
2. Select the `ParkEase` scheme.
3. Choose an iPhone simulator, such as iPhone 15 or iPhone 16.
4. If signing is required, select your Apple Developer team in the target settings.
5. Run the app with `Cmd + R`.

## Resume Project Description

Built ParkEase, a SwiftUI smart campus parking app using MVVM architecture, reusable design-system components, asset catalog color tokens, dark mode support, campus navigation UI, slot reservation flow, smart alerts, saved vehicles, and parking analytics.

## College Application Description

ParkEase reflects my interest in practical iOS development and Apple-style product design. I built it to solve a familiar campus problem: students and faculty losing time while searching for parking. The project combines SwiftUI, MVVM, native navigation, SF Symbols, reusable UI components, and thoughtful visual design to create a realistic smart campus utility.

## Future Improvements

- Integrate MapKit for real campus routing.
- Connect parking lot data to sensors or a Firebase backend.
- Add push notifications for reservations and full-lot alerts.
- Add Live Activities for active parking sessions.
- Support Apple Wallet-style parking passes.
- Add widgets for nearest available parking.
- Add App Intents and Siri Shortcuts for quick parking search.
- Add authentication for students, faculty, and visitors.

## App Store Style Description

ParkEase helps campus commuters find parking faster. View live availability, compare busy lots, reserve a slot, follow smart directions, track vehicle history, and receive alerts before parking areas fill up. Designed for students and faculty, ParkEase brings a calm Apple-style experience to everyday campus mobility.
