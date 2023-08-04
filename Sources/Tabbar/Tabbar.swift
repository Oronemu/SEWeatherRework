//
//  ContentView.swift
//  SEWeather
//
//  Created by Иван Ровков on 11.07.2023.
//

import SwiftUI
import Swinject
import CoreData
import ForecastWeather
import CurrentWeather

struct Tabbar: View {
    
    @State private var selectedTab: Int = 1
    
    private let currentWeather: AnyView
    private let forecastWeather: AnyView
    
    init(currentWeather: AnyView, forecastWeather: AnyView) {
        self.currentWeather = currentWeather
        self.forecastWeather = forecastWeather
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            currentWeather
                .tabItem {
                    Image(systemName: "location.fill")
                    Text("Home")
                }
                .tag(1)
            forecastWeather
                .tabItem {
                    Image(systemName: "cloud.sun.rain.fill")
                    Text("Forecast")
                }
                .tag(2)
        }
        .onAppear {
            let standardAppearance = UITabBarAppearance()
            standardAppearance.configureWithTransparentBackground()
            standardAppearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            UITabBar.appearance().standardAppearance = standardAppearance
        }
    }
}
