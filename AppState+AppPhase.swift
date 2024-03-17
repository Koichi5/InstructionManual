//
//  AppState.swift
//  InstructionManual
//
//  Created by Koichi Kishimoto on 2024/03/05.
//

import SwiftUI

extension AppState {
    public func finishedStartUp() {
        phase.transition(to: .loadingAssets)
    }
    
    public func finishedLoadingAssets() {
        phase.transition(to: .home)
    }
}
