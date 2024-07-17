//
//  HuliPizzaAppApp.swift
//  HuliPizzaApp
//
//  Created by Sahana  Rao on 09/06/24.
//

import SwiftUI

@main
struct HuliPizzaAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(menu: MenuModel().menu)
        }
    }
}
