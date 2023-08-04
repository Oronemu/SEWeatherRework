//
//  da.swift
//  SEWeather
//
//  Created by Иван Ровков on 12.07.2023.
//

import Foundation
import LocationProvider
import Common

public class CurrentWeatherViewModel: ObservableObject {
    
    private let weatherService: WeatherService
    
    @Published var locationState: LocationServiceStatus?
    @Published var networkState: CurrentWeatherViewState = .idle
    @Published var advice: String = ""
    
    init(weatherService: WeatherService) {
        self.weatherService = weatherService
    }
    
    func fetchWeather() {
        self.networkState = .loading
        
        self.weatherService.fetchCurrentWeather { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let response):
                update {
                    self.networkState = .success(response)
                    self.updateAdvice(for: response.main.temp)
                }
            case .failure(let error):
                update {
                    self.networkState = .error(error.localizedDescription)
                }
            }
        }
    }
    
    private func update(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
    
    private func updateAdvice(for temperature: Double) {
        switch temperature {
        case ...(-30):
            self.advice = "It's extremely cold! Don't forget to wrap up in warm layers of clothing to keep warm"
        case -29...(-20):
            self.advice = "It's very cold. Wear a heavy coat and protect yourself from the cold and keep warm"
        case -19...(-10):
            self.advice = "It's chilly outside. Don't forget your scarf and gloves so you don't get sick!"
        case -9...0:
            self.advice = "It's cold. Wear a jacket or sweater to stay warm and don't get sick!"
        case 1...10:
            self.advice = "It's cool. It is recommended wear a light jacket or hoodie"
        case 11...20:
            self.advice = "It's mild and pleasant. Dress comfortably for the temperature"
        case 21...30:
            self.advice = "It's warm and sunny! Dress comfortably for the temperature"
        case 31...:
            self.advice = "It's very hot outside. Stay cool and hydrated, seek shade when possible"
        default:
            self.advice = "The temperature is outside the defined range"
        }
    }
}
