//
//  OnboardingAssembly.swift
//  Onboarding
//
//  Created by Ivan on 03.08.2023.
//

import Foundation
import Swinject

public class OnboardingAssembly: Assembly {
    
    public init() {}
    
    public func assemble(container: Container) {
        container.register(OnboardingFactory.self) { resolver in
            OnboardingFactoryImplementation(container: container)
        }
    }
}
