//
//  ForecastWeatherRequest.swift
//  SEWeather
//
//  Created by Иван Ровков on 12.07.2023.
//

import Foundation
import NetworkProvider

public struct ForecastWeatherRequest: DataRequest {
    public var url: String {
        let baseURL: String = "https://api.openweathermap.org"
        let path: String = "/data/3.0/onecall"
        return baseURL + path
    }
    
    public var method: HTTPMethod {
        return .GET
    }
    
    public var queryItems: [String : String] =  [
        "units": "metric",
        "exclude": "hourly",
        "appid": Config.apikey
    ]
    
    public func decode(_ data: Data) throws -> ForecastWeather {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .secondsSince1970
        let response = try decoder.decode(ForecastWeather.self, from: data)
        return response
    }
}

public struct ForecastWeather: Decodable, Equatable {
    public let daily: [DailyWeatherReport]
    public let alerts: [WeatherAlert]?
    
    public struct WeatherAlert: Decodable, Equatable {
        public let senderName: String
        public let event: String
        public let description: String
    }
    
    public struct DailyWeatherReport: Decodable, Equatable {
        public let dt: Date
        public let sunrise: Date
        public let sunset: Date
        public let summary: String
        public let temp: TemperatureInfo
        public let feelsLike: FeelsLikeInfo
        public let pressure: Int
        public let windSpeed: Double
        public let weather: [WeatherType]
        
        public struct WeatherType: Decodable, Equatable {
            public let main: String
            public let description: String
            public let icon: String
        }
        
        public struct TemperatureInfo: Decodable, Equatable {
            public let day: Double
            public let min: Double
            public let max: Double
            public let night: Double
            public let eve: Double
            public let morn: Double
        }
        
        public struct FeelsLikeInfo: Decodable, Equatable {
            public let day: Double
            public let night: Double
            public let eve: Double
            public let morn: Double
        }
    }
}
