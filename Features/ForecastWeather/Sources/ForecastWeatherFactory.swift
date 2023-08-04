//
//  ForecastWeatherFactory.swift
//  ForecastWeather
//
//  Created by Ivan on 03.08.2023.
//

import Foundation
import SwiftUI
import Swinject
import Common

public protocol ForecastWeatherFactory: AnyObject {
    func createForecastWeather() -> AnyView
}

final class ForecastWeatherFactoryImplementation {
    
    private let container: Container

    init(container: Container) {
        self.container = container
    }
}

extension ForecastWeatherFactoryImplementation: ForecastWeatherFactory {
    func createForecastWeather() -> AnyView {
        let viewModel = ForecastViewModel(weatherService: container.resolve(WeatherService.self)!)
        return AnyView(ForecastView(viewModel: StateObject(wrappedValue: viewModel)))
    }
}
