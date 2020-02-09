//
//  AnyFeature.swift
//  CoordinatorService
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//

import UIKit

public final class AnyFeature {

    public let build: (StoreInterface, Coordinator?) -> UIViewController

    public init<T: Feature>(_ feature: T.Type) {
        build = { store, coordinator in
            // swiftlint:disable:next force_cast
            let dependencies = feature.dependenciesInitializer.build(store) as! T.Dependencies
            return feature.build(
                dependencies: dependencies,
                fromCoordinator: coordinator
            )
        }
    }
}
