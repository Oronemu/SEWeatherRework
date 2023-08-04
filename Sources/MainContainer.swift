//
//  MainContainer.swift
//  SEWeather
//
//  Created by Ivan on 03.08.2023.
//

import Foundation
import Swinject
import CurrentWeather
import NetworkProvider
import Onboarding
import ForecastWeather
import SwiftUI

public class MainContainer {
    private var container: Container!
    private var assembler: Assembler!
    
    public init() {
        container = Container()
        assembler = Assembler(container: container)
        assembler.apply(assemblies: [
            ServiceAssembly(),
            CurrentWeatherAssebly(),
            ForecastWeatherAssembly(),
            OnboardingAssembly(),
            TabbarAssembly()
        ])
    }
    
    func onboarding() -> AnyView {
        let factory = container.resolve(OnboardingFactory.self)!
        return factory.createOnboarding()
    }
    
    func tabbar() -> AnyView {
        let factory = container.resolve(TabbarFactory.self)!
        return factory.createTabbar()
    }
}
