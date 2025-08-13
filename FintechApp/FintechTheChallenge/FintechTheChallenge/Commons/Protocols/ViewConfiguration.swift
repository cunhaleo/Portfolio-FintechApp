//
//  ViewConfiguration.swift
//  FintechTheChallenge
//
//  Created by Leonardo Cunha on 25/07/22.
//

import Foundation

protocol ViewConfiguration {
    func buildLayout()
    func setupHierarchy()
    func setupConstraints()
}

extension ViewConfiguration {
    func buildLayout() {
        setupHierarchy()
        setupConstraints()
    }
}
