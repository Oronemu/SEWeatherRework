//
//  OnBoardingViewModel.swift
//  SEWeather
//
//  Created by Иван Ровков on 12.07.2023.
//

import Foundation
import SwiftUI
import LocationProvider

public class OnBoardingViewModel: ObservableObject {
    
    @AppStorage("onBoardingIsShowed") private var onBoardingIsShowed = false
    @Published var state: LocationServiceStatus = .notDetermined
    
    private var locationManager: LocationManager
    
    init(locationService: LocationManager) {
        self.locationManager = locationService
        self.locationManager.completion = { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let status):
                self.state = status
                if case .authorized(_) = self.state {
                    self.onBoardingIsShowed = true
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func checkIfLocationServiceIsEnabled() {
        locationManager.checkIfLocationServiceIsEnabled()
    }
}
