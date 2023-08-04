//
//  CurrentWeatherFactory.swift
//  CurrentWeather
//
//  Created by Ivan on 03.08.2023.
//

import Foundation
import Swinject
import Common
import SwiftUI

public protocol CurrentWeatherFactory: AnyObject {
    func createCurrentWeatherView() -> AnyView
}

final class CurrentWeatherFactoryImplementation {
    
    private let container: Container

    init(container: Container) {
        self.container = container
    }
}

extension CurrentWeatherFactoryImplementation: CurrentWeatherFactory {
    func createCurrentWeatherView() -> AnyView {
        let viewModel = CurrentWeatherViewModel(weatherService: container.resolve(WeatherService.self)!)
        return AnyView(MainView(viewModel: StateObject(wrappedValue: viewModel)))
    }
}

