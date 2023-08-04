//
//  ForecastWeatherAssembly.swift
//  ForecastWeather
//
//  Created by Ivan on 03.08.2023.
//

import Foundation
import Swinject

public class ForecastWeatherAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(ForecastWeatherFactory.self) { resolver in
            ForecastWeatherFactoryImplementation(container: container)
        }
    }
}
