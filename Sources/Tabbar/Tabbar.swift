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
    
    private let currentWeather: CurrentWeatherFactory
    private let forecastWeather: ForecastWeatherFactory
    
    init(currentWeather: CurrentWeatherFactory, forecastWeather: ForecastWeatherFactory) {
        self.currentWeather = currentWeather
        self.forecastWeather = forecastWeather
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            currentWeather.createCurrentWeatherView()
                .tabItem {
                    Image(systemName: "location.fill")
                    Text("Home")
                }
                .tag(1)
            forecastWeather.createForecastWeather()
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
