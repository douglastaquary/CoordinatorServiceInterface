//
//  Coordinator.swift
//  CoordinatorService
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//

import Foundation

public protocol Coordinator: Decodable {
    static var identifier: String { get }
}
