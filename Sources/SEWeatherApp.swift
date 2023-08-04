//
//  SEWeatherApp.swift
//  SEWeather
//
//  Created by Иван Ровков on 11.07.2023.
//

import SwiftUI

@main
struct SEWeatherApp: App {
    let persistenceController = PersistenceController.shared
    let container = MainContainer()
    
    @AppStorage("onBoardingIsShowed") private var onBoardingIsShowed = false
    
    var body: some Scene {
        WindowGroup {
            if onBoardingIsShowed {
                container.tabbar()
            } else {
                container.onboarding()
            }
        }
    }
}
