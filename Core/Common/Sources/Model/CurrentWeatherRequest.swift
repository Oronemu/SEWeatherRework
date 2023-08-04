//
//  WeatherRequest.swift
//  SEWeather
//
//  Created by Иван Ровков on 12.07.2023.
//

import Foundation
import NetworkProvider

public struct CurrentWeatherRequest: DataRequest {
    public var url: String {
        let baseURL: String = "https://api.openweathermap.org"
        let path: String = "/data/2.5/weather"
        return baseURL + path
    }
    
    public var method: HTTPMethod {
        return .GET
    }
    
    public var queryItems: [String : String] =  [
        "units": "metric",
        "appid": Config.apikey
    ]
    
    public func decode(_ data: Data) throws -> CurrentWeather {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        let response = try decoder.decode(CurrentWeather.self, from: data)
        return response
    }
}

public struct CurrentWeather: Decodable, Equatable {
    public let dt: Date
    public let name: String
    public let timezone: Int
    public let weather: [Weather]
    public let main: Main
    public let sys: Sys
    public let wind: Wind

    public struct Main: Decodable, Equatable {
        public let temp: Double
        public let feelsLike: Double
        public let tempMin: Double
        public let tempMax: Double
        public let pressure: Int
        public let humidity: Int
    }

    public struct Weather: Decodable, Equatable {
        public let main: String
        public let description: String
        public let icon: String
    }
    
    public struct Sys: Decodable, Equatable {
        public let country: String
        public let sunrinse: Date?
        public let sunset: Date?
    }
    
    public struct Wind: Decodable, Equatable {
        public let speed: Double
    }
}
