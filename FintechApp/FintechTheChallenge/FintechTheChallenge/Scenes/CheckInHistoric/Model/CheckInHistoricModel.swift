//
//  CheckInHistoricModel.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 12/01/22.
//

import Foundation

struct CheckInHistoricModel {
    enum DayStyle {
        case isFirstDay
        case isRegularDay
        case isLastDay
    }
    let checkInModel: CheckInModel
    let dayStyle: DayStyle
}
