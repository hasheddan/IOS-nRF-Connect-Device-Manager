//
//  ObservabilityDeviceEvent.swift
//  iOS-nRF-Memfault-Library
//  iOSOtaLibrary
//
//  Created by Dinesh Harjani on 26/8/22.
//  Copyright © 2025 Nordic Semiconductor ASA. All rights reserved.
//

import Foundation

// MARK: - ObservabilityDeviceEvent

public enum ObservabilityDeviceEvent: CustomStringConvertible {
    
    // MARK: Case(s)
    
    case connected, disconnected
    
    case notifications(_ enabled: Bool), online(_ isTrue: Bool)
    case unauthorized
    case authenticated(_ auth: ObservabilityAuth)
    case updatedChunks(_ chunks: [ObservabilityChunk])
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        switch self {
        case .connected:
            return ".connected"
        case .disconnected:
            return ".disconnected"
        case .notifications(let enabled):
            return ".notifications(\(enabled ? "enabled" : "disabled"))"
        case .online(let isTrue):
            return ".online(\(isTrue ? "true" : "false"))"
        case .authenticated(_):
            return ".authenticated(_)"
        case .unauthorized:
            return ".unauthorized"
        case .updatedChunks(let chunks):
            guard let lastChunk = chunks.last else {
                return ".updatedChunks([EMPTY], --)"
            }
            return ".updatedChunks(\(chunks.count), \(String(describing: lastChunk.status))"
        }
    }
}
