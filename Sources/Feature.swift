//
//  Feature.swift
//  CoordinatorService
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//

import UIKit

public protocol Feature {
    associatedtype Dependencies

    static var dependenciesInitializer: AnyDependenciesInitializer { get }

    static func build(
        dependencies: Dependencies,
        fromCoordinator coordinator: Coordinator?
    ) -> UIViewController
}
