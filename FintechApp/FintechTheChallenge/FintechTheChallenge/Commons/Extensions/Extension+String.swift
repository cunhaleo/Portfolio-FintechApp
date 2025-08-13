//
//  Extension+String.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 10/01/22.
//

import Foundation

extension String {
    func getFirstWord(separatedBy separator: String) -> String {
        if let firstWord = self.components(separatedBy: separator).first {
            let firstWord = String(firstWord)
            return firstWord
        }
        return ""
    }
    
    func getLastWord(separatedBy separator: String) -> String {
        if let lastWord = self.components(separatedBy: separator).last {
            let lastWord = String(lastWord)
            return lastWord
        }
        return ""
    }
}
