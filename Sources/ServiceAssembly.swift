//
//  ServiceAssembly.swift
//  SEWeather
//
//  Created by Ivan on 03.08.2023.
//

import Foundation
import NetworkProvider
import LocationProvider
import Common
import Swinject

class ServiceAssembly: Assembly {
    
    func assemble(container: Container) {
        container.register(NetworkManager.self) { r in
            DefaultNetworkManager()
        }
        
        container.register(LocationManager.self) { r in
            CoreLocationManager()
        }
        
        container.register(WeatherService.self) { r in
            WeatherService(
                networkService: r.resolve(NetworkManager.self)!,
                locationService: r.resolve(LocationManager.self)!
            )
        }
    }
}
