//
//  AppState+LoadingAssets.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2024/03/05.
//

import SwiftUI
import RealityKit
import RealityKitContent

actor EntityContainer {
    var entity: Entity?
    func setEntity(_ newEntity: Entity?) {
        entity = newEntity
    }
}

struct LoadResult: Sendable {
    var entity: Entity
    var key: String
}

extension AppState {
    private func loadFromRCPro(
        name entityName: String,
        fromSceneNamed sceneName: String,
        scaleFactor: Float? = nil
    ) async throws -> Entity? {
        var ret: Entity? = nil
        logger.info("Loading entity \(entityName) from Reality Compomser Pro scene \(sceneName)")
        do {
            let scnene = try await Entity(named: entityName, in: realityKitContentBundle)
            let entityContainer = EntityContainer()
            let theRet = scnene.findEntity(named: entityName)
            if let scaleFactor {
                theRet?.scale = SIMD3<Float>(repeating: scaleFactor)
            }
            await entityContainer.setEntity(theRet)
            ret = await entityContainer.entity
        } catch {
            fatalError("\tEncountered fatal error: \(error.localizedDescription)")
        }
        return ret
    }
}
