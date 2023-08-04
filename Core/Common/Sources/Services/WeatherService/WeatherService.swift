//
//  WeatherService.swift
//  SEWeather
//
//  Created by Ivan on 31.07.2023.
//

import Foundation
import NetworkProvider
import LocationProvider

public class WeatherService {
    private let networkManager: NetworkManager
    private var locationManager: LocationManager
    
    public var locationState: LocationServiceStatus?
    
    public init(networkService: NetworkManager, locationService: LocationManager) {
        self.networkManager = networkService
        self.locationManager = locationService
        self.locationManager.completion = { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let status):
                self.locationState = status
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    public func fetchCurrentWeather(completion: @escaping (Result<CurrentWeather, Error>) -> Void) {
        var request = CurrentWeatherRequest()
        self.locationManager.checkIfLocationServiceIsEnabled()
        
        if case .authorized(let location) = self.locationState {
            guard let location = location?.coordinate else { return }
            request.queryItems["lat"] = "\(location.latitude)"
            request.queryItems["lon"] = "\(location.longitude)"
        }
        
        networkManager.request(request, completion: completion)
    }
    
    public func fetchForecastWeather(completion: @escaping (Result<ForecastWeather, Error>) -> Void) {
        var request = ForecastWeatherRequest()
        self.locationManager.checkIfLocationServiceIsEnabled()
        
        if case .authorized(let location) = self.locationState {
            guard let coordinate = location?.coordinate else { return }
            request.queryItems["lat"] = "\(coordinate.latitude)"
            request.queryItems["lon"] = "\(coordinate.longitude)"
        }
        
        networkManager.request(request, completion: completion)
    }
}
