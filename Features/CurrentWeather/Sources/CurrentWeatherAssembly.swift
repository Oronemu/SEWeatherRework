//
//  CurrentWeatherAssembly.swift
//  CurrentWeather
//
//  Created by Ivan on 03.08.2023.
//

import Foundation
import Swinject

public class CurrentWeatherAssebly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(CurrentWeatherFactory.self) { resolver in
            CurrentWeatherFactoryImplementation(container: container)
        }
    }
}
