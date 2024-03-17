//
//  AppState.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2024/03/05.
//

import SwiftUI
import ARKit
import OSLog

@Observable
@MainActor
public class AppState {
    var phase: AppPhase = .startingUp
    
    var session: ARKitSession = ARKitSession()
    
    var worldInfo = WorldTrackingProvider()
}

let logger = Logger()
