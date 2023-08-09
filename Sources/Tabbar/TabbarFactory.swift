//
//  TabbarFactory.swift
//  SEWeather
//
//  Created by Ivan on 03.08.2023.
//

import Foundation
import SwiftUI
import Swinject
import CurrentWeather
import ForecastWeather

protocol TabbarFactory: AnyObject {
    func createTabbar() -> AnyView
}

final class TabbarFactoryImplementation {
    
    private let container: Container!
    
    init(container: Container!) {
        self.container = container
    }
}

extension TabbarFactoryImplementation: TabbarFactory {
    func createTabbar() -> AnyView {
        
        let currentWeatherFactory = container.resolve(CurrentWeatherFactory.self)!
        let forecastWeatherFactory = container.resolve(ForecastWeatherFactory.self)!
        
        return AnyView(Tabbar(
            currentWeather: currentWeatherFactory,
            forecastWeather: forecastWeatherFactory
        ))
    }
}
