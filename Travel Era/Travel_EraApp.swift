//
//  Travel_EraApp.swift
//  Travel Era
//
//  Created by Eranga prabath on 2023-08-17.
//

import SwiftUI

@main
struct Travel_EraApp: App {
    @StateObject private var viewModel = locationViewModel()
    var body: some Scene {
        WindowGroup {
            locationView()
                .preferredColorScheme(.light)
                .environmentObject(viewModel)
        }
    }
}
