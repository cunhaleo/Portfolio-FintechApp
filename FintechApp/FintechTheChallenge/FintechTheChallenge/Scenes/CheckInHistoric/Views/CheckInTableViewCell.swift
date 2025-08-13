//
//  CheckInTableViewCell.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 10/01/22.
//

import UIKit

final class CheckInTableViewCell: UITableViewCell {
    // MARK: Properties
    static let identifier = "CheckInTableViewCell"
    var model: CheckInHistoricModel?
    var cellState: CellState = .positive
    var workedMinutes: Int = 0
    enum CellState {
        case positive
        case negative
    }
    enum DayStyle {
        case isFirstDay
        case isRegularDay
        case isLastDay
    }
    
    // MARK: Outlets
    @IBOutlet weak var labelEntryTime: UILabel!
    @IBOutlet weak var labelLeaveTime: UILabel!
    @IBOutlet weak var labelWorkedTime: UILabel!
    @IBOutlet weak var imageViewState: UIImageView!
    @IBOutlet weak var labelDay: UILabel!
    @IBOutlet weak var labelMonth: UILabel!
    @IBOutlet weak var viewLastDay: UIView!
    @IBOutlet weak var viewRegularDay: UIView!
    @IBOutlet weak var viewFirstDay: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(with model: CheckInHistoricModel) {
        self.model = model
        self.workedMinutes = calculateWorkedMinutes(model: model.checkInModel)
        self.cellState = getCellState(workedTimeInMinutes: workedMinutes)
        setupUI(with: model)
    }
    
    private func setupUI(with data: CheckInHistoricModel) {
        setupLabelTexts(with: data)
        setCellStateImage()
        setCellStyleWith(dayStyle: model?.dayStyle ?? .isRegularDay)
    }
    
    private func setupLabelTexts(with data: CheckInHistoricModel) {
        labelEntryTime.text = data.checkInModel.entryTime
        labelLeaveTime.text = data.checkInModel.leaveTime
        labelWorkedTime.text = getWorkedTimeWith(totalMinutesOfWork: workedMinutes)
        labelDay.text = data.checkInModel.date
        labelMonth.text = data.checkInModel.month
    }
    
    private func getCellState(workedTimeInMinutes: Int) -> CellState {
        let hoursOfWork = workedTimeInMinutes / 60
        return hoursOfWork >= 4 ? .positive : .negative
    }
    
    private func setCellStateImage() {
        switch cellState {
        case .positive:
            imageViewState.image = UIImage(named: "plusIcon_blue")
        case .negative:
            imageViewState.image = UIImage(named: "minusIcon_red")
        }
    }
    
    private func setCellStyleWith(dayStyle: CheckInHistoricModel.DayStyle) {
        switch dayStyle {
        case .isRegularDay:
            viewRegularDay.isHidden = false
        case .isFirstDay:
            viewFirstDay.isHidden = false
        case .isLastDay:
            viewLastDay.isHidden = false
        }
    }
    
    private func calculateWorkedMinutes(model: CheckInModel) -> Int {
        let entryHour = Int(model.entryTime.getFirstWord(separatedBy: ":")) ?? 0
        let leaveHour = Int(model.leaveTime.getFirstWord(separatedBy: ":")) ?? 0
        let hoursOfWork = leaveHour - entryHour
        
        let entryMinutes = Int(model.entryTime.getLastWord(separatedBy: ":")) ?? 0
        let leaveMinutes = Int(model.leaveTime.getLastWord(separatedBy: ":")) ?? 0
        let minutesOfWork = leaveMinutes - entryMinutes
        let totalMinutesOfWork = minutesOfWork + (hoursOfWork * 60)
        return totalMinutesOfWork
    }
    
    private func getWorkedTimeWith(totalMinutesOfWork: Int) -> String {
        let workedMinutes = totalMinutesOfWork % 60
        let workedHours = (totalMinutesOfWork - workedMinutes) / 60
        let labelMinutes = workedMinutes < 10 ? "0\(workedMinutes)" : "\(workedMinutes)"
        let workedTime = "\(workedHours):\(labelMinutes)"
        return workedTime
    }
}
