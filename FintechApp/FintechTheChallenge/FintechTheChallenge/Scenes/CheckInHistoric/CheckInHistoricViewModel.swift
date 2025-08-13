//
//  CheckInHistoricViewModel.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 10/01/22.
//

import Foundation

final class CheckInHistoricViewModel {
    var actualMonth: [CheckInModel] = []
    var monthWithDayStyles: [CheckInHistoricModel] = []
    
    func getFakeService() {
        let day1 = CheckInModel(month: "jan", date: "1", entryTime: "7:47", leaveTime: "12:30")
        let day2 = CheckInModel(month: "jan", date: "2", entryTime: "8:04", leaveTime: "11:24")
        let day3 = CheckInModel(month: "jan", date: "3", entryTime: "8:31", leaveTime: "11:09")
        let day4 = CheckInModel(month: "jan", date: "4", entryTime: "8:13", leaveTime: "11:30")
        let day5 = CheckInModel(month: "jan", date: "8", entryTime: "7:35", leaveTime: "12:45")
        let day6 = CheckInModel(month: "jan", date: "9", entryTime: "8:50", leaveTime: "9:51")
        let day7 = CheckInModel(month: "jan", date: "11", entryTime: "8:35", leaveTime: "12:51")
        let day8 = CheckInModel(month: "jan", date: "13", entryTime: "9:03", leaveTime: "12:31")
        let day9 = CheckInModel(month: "jan", date: "14", entryTime: "8:31", leaveTime: "13:34")
        let day10 = CheckInModel(month: "jan", date: "15", entryTime: "8:45", leaveTime: "14:21")
        let day11 = CheckInModel(month: "jan", date: "17", entryTime: "8:02", leaveTime: "12:04")
        actualMonth = [day1, day2, day3, day4, day5, day6, day7, day8, day9, day10, day11]
        insertDayStyle(actualMonth: actualMonth)
    }
    
    private func insertDayStyle(actualMonth: [CheckInModel]) {
        for (index, day) in actualMonth.enumerated() {
            if index == 0 {
                monthWithDayStyles.append(CheckInHistoricModel(checkInModel: day, dayStyle: .isFirstDay))
            } else if index == actualMonth.count - 1 {
                monthWithDayStyles.append(CheckInHistoricModel(checkInModel: day, dayStyle: .isLastDay))
            } else {
                monthWithDayStyles.append(CheckInHistoricModel(checkInModel: day, dayStyle: .isRegularDay))
            }
        }
    }
}
