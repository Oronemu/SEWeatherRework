//
//  CurrentWeatherViewState.swift
//  SEWeather
//
//  Created by Ivan on 31.07.2023.
//

import Foundation
import Common

enum CurrentWeatherViewState {
    case idle
    case loading
    case success(CurrentWeather)
    case error(String)
}

extension CurrentWeatherViewState: Equatable {
    static func == (lhs: CurrentWeatherViewState, rhs: CurrentWeatherViewState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle):
            return true
        case (.loading, .loading):
            return true
        case (.error(let lError), .error(let rError)):
            return lError == rError
        case (.success(let lCurrentWeather), .success(let rCurrentWeather)):
            return lCurrentWeather == rCurrentWeather
        default:
            return false
        }
    }
}
