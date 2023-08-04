//
//  AsyncImage.swift
//  SEWeather
//
//  Created by Иван Ровков on 13.07.2023.
//

import Foundation
import SwiftUI

public struct AsyncImage: View {
    @ObservedObject var imageLoader: ImageLoader
    @State private var image: UIImage = UIImage()

    public init(withURL url: String) {
        imageLoader = ImageLoader(urlString: url)
    }

    public var body: some View {
        Image(uiImage: image)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30, height: 30)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
            }
    }
}
