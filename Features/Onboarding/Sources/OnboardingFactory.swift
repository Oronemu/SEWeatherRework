//
//  OnboardingFactory.swift
//  Onboarding
//
//  Created by Ivan on 03.08.2023.
//

import Foundation
import LocationProvider
import SwiftUI
import Swinject

public protocol OnboardingFactory: AnyObject {
    func createOnboarding() -> AnyView
}

final class OnboardingFactoryImplementation {
    
    private let container: Container!
    
    init(container: Container!) {
        self.container = container
    }
}

extension OnboardingFactoryImplementation: OnboardingFactory {
    func createOnboarding() -> AnyView {
        let viewModel = OnBoardingViewModel(locationService: container.resolve(LocationManager.self)!)
        return AnyView(OnBoardingView(viewModel: StateObject(wrappedValue: viewModel)))
    }
}
