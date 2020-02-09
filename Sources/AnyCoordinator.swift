//
//  AnyCoordinator.swift
//  CoordinatorService
//
//  Created by Douglas Alexandre Barros Taquary on 09/02/20.
//

import Foundation

/// A type-erased container for a `Route`, used for route decoding purposes.
public struct AnyCoordinator {
    public let value: Coordinator
    public let coordinatorString: String
}

extension AnyCoordinator: Hashable {
    public static func == (lhs: AnyCoordinator, rhs: AnyCoordinator) -> Bool {
        return lhs.coordinatorString == rhs.coordinatorString
    }

    public func hash(into hasher: inout Hasher) {
        coordinatorString.hash(into: &hasher)
    }
}

extension AnyCoordinator: Decodable {
    static var contextUserInfoKey: CodingUserInfoKey {
        // swiftlint:disable:next force_unwrapping
        return CodingUserInfoKey(rawValue: "coordinatorservice_anycoordinator_context")!
    }

    public init(from decoder: Decoder) throws {
        let ctx = decoder.userInfo[AnyCoordinator.contextUserInfoKey]

        guard let context = ctx as? CoordinatorServiceAnyCoordinatorDecodingProtocol else {
            preconditionFailure("TRIED TO DECODE ANYROUTE WITHOUT A CONTEXT!")
        }

        let data = try context.decodeAnyCoordinator(fromDecoder: decoder)

        self.value = data.0
        self.coordinatorString = data.1
    }
}

public protocol CoordinatorServiceAnyCoordinatorDecodingProtocol {
    func decodeAnyCoordinator(fromDecoder decoder: Decoder) throws -> (Coordinator, String)
}

extension CoordinatorServiceAnyCoordinatorDecodingProtocol {
    /// Injects contextual data in a `JSONDecoder`. This is necessary for decoding `AnyRoutes`s.
    public func injectContext(toDecoder decoder: JSONDecoder) {
        decoder.userInfo[AnyCoordinator.contextUserInfoKey] = self
    }
}
