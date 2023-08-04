//
//  NetworkManagerProtocol.swift
//  NetworkProvider
//
//  Created by Ivan on 12.07.2023.
//

import Foundation

import Foundation

public protocol NetworkManager {
    func request<Request: DataRequest>(_ request: Request, completion: @escaping (Result<Request.Response, Error>) -> Void)
}

