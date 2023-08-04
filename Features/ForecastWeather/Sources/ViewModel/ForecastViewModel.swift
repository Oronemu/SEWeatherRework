//
//  ForecastViewModel.swift
//  SEWeather
//
//  Created by Иван Ровков on 12.07.2023.
//

import Foundation
import Common

public class ForecastViewModel: ObservableObject {
    
    private let weatherService: WeatherService
    
    @Published var networkState: ForecastWeatherViewState = .idle
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func fetchWeather() {
        self.networkState = .loading
        
        weatherService.fetchForecastWeather { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    self.networkState = .success(response)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.networkState = .error(error.localizedDescription)
                }
            }
        }
    }
}
