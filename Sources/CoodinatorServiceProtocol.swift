//
//  CoordinatorServiceProtocol.swift
//  CoordinatorService
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//

import Foundation
import UIKit

public protocol CoordinatorServiceProtocol: Dependency, CoordinatorServiceAnyCoordinatorDecodingProtocol {
    func navigate(
        toCoodinator coordinator: Coordinator,
        fromView viewController: UIViewController,
        presentationStyle: PresentationStyle,
        animated: Bool
    )
}

public protocol RouterServiceRegistrationProtocol {
    func register<T>(dependency: Dependency, forType metaType: T.Type)
    func register(coordinatorHandler: CoordinatorHandler)
}
