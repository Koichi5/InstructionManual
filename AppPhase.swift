//
//  AppPhase.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2024/03/05.
//

import SwiftUI
import OSLog

public enum AppPhase: String, Codable, Sendable, Equatable {
    case startingUp
    case loadingAssets
    case home
    case shelfHome
    case shelfCompletedReality
    case shelfReality
    case shelfEquipmentReality
    case robotCleanerHome
    case robotCleanerNum
    case robotCleanerMaintenance
    case robotCleanerMaintenanceTermTable
    case robotCleanerMaintenanceDustBoxReality
    case robotCleanerMaintenanceDustBoxMovie
    
    var isImmersive: Bool {
        switch self {
        case .startingUp, .loadingAssets, .home, .shelfHome, .robotCleanerHome, .robotCleanerNum, .robotCleanerMaintenance, .robotCleanerMaintenanceTermTable, .robotCleanerMaintenanceDustBoxMovie, .shelfCompletedReality, .shelfReality, .shelfEquipmentReality, .robotCleanerMaintenanceDustBoxReality:
            return false
        }
    }
    
    @discardableResult
    mutating public func transition(to newPhase: AppPhase) -> Bool {
        logger.info("Phase change to \(newPhase.rawValue)")
        guard self != newPhase else { logger.debug("Phase change to \(newPhase.rawValue) but already in that state. Treating as a no-op.")
            return false
        }
        self = newPhase
        return true
    }
}
