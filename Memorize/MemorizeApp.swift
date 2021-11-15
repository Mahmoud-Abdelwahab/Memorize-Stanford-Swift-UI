//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Mahmoud Abdul-Wahab on 02/11/2021.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let viewModel = MemorizeGameViewModel()
    var body: some Scene {
        WindowGroup {
            MemorizeGameView(viewModel: viewModel)
        }
    }
}
