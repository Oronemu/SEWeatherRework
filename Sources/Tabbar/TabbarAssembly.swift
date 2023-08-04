//
//  TabbarAssembly.swift
//  SEWeather
//
//  Created by Ivan on 03.08.2023.
//

import Foundation
import Swinject

class TabbarAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TabbarFactory.self) { resolver in
            TabbarFactoryImplementation(container: container)
        }
    }
}
