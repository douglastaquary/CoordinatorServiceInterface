//
//  CoordinatorHandler.swift
//  CoordinatorService
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//

import UIKit

public protocol CoordinatorHandler {
    var routes: [Coordinator.Type] { get }

    func destination(
        forCoordinator coordinator: Coordinator,
        fromViewController viewController: UIViewController
    ) -> Any
}
