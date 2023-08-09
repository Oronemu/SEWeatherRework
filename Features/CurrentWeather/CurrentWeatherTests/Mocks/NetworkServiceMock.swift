//
//  NetworkServiceMock.swift
//  CurrentWeatherTests
//
//  Created by Ivan on 09.08.2023.
//

import Foundation
import NetworkProvider
import Common

class NetworkServiceMock: NetworkManager {
    var requestCalled: Bool = false
    var requestRecievedArguments: (request: CurrentWeatherRequest, completion: (Result<CurrentWeatherRequest .Response, Error>) -> Void)?
    
    func request<Request: DataRequest>(_ request: Request,
                                       completion: @escaping (Result<Request .Response, Error>) -> Void) {
        
        
        requestCalled = true
        requestRecievedArguments = (request: request as! CurrentWeatherRequest,
                                    completion: completion as! (Result<CurrentWeatherRequest .Response, Error>) -> Void)
    }
}

class AppError: Error {}
