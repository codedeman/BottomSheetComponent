//
//  BCSConfiguaration.swift
//  BottomSheetComponent
//
//  Created by Kevin on 10/23/22.
//

import Foundation

protocol BCSContainerConfiguration {
    
    
}

protocol BCSContainerConfigurationInvalidating: BCSContainerConfiguration {
    func invalidateOverlayMetrics()
    func requestOverlayMetricsIfNeeded()
}
