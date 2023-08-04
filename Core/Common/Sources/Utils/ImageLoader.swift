//
//  ImageLoader.swift
//  SEWeather
//
//  Created by Иван Ровков on 13.07.2023.
//

import Foundation
import Combine

public class ImageLoader: ObservableObject {
    public var didChange = PassthroughSubject<Data, Never>()
    private var data = Data() {
        didSet {
            didChange.send(data)
        }
    }

    public init(urlString:String) {
        guard let url = URL(string: urlString) else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let data = data, self != nil else { return }
            DispatchQueue.main.async { [weak self] in
                self?.data = data
            }
        }
        task.resume()
    }
}
