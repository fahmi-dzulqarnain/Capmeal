//
//  CapmealApp.swift
//  Capmeal
//
//  Created by Fahmi Dzulqarnain on 22/07/21.
//

import SwiftUI

@main
struct CapmealApp: App {
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
        
}
