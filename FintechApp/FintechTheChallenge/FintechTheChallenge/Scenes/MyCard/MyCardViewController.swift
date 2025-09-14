//
//  MyCardViewController.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 05/01/22.
//

import UIKit

final class MyCardViewController: UIViewController {
    // MARK: Properties
    weak var coordinator: HomeCoordinator?
    let viewModel: MyCardViewModel?
    var cardShowingFront: Bool = true {
        didSet {
            let cardFront = UIImage(named: viewModel?.model?.cardFrontImage ?? "")
            let cardBack = UIImage(named: viewModel?.model?.cardBackImage ?? "")
            imageViewCard.image = cardShowingFront ? cardFront : cardBack
            }
        }
    
    // MARK: Outlets
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelUserSince: UILabel!
    @IBOutlet weak var labelBloodType: UILabel!
    @IBOutlet weak var labelDepartament: UILabel!
    @IBOutlet weak var labelPhone: UILabel!
    @IBOutlet weak var labelBirthday: UILabel!
    @IBOutlet weak var labelEmail: UILabel!
    @IBOutlet weak var labelSobreOUser: UILabel!
    @IBOutlet weak var labelAboutUser: UILabel!
    @IBOutlet weak var labelCurriculum: UILabel!
    @IBOutlet weak var imageViewCard: UIImageView!
    
    // MARK: Initialization
    init(viewModel: MyCardViewModel = MyCardViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLabels()
    }
    
    // MARK: Action
    @IBAction func handlerSwipeButton(_ sender: Any) {
        cardShowingFront.toggle()
    }
    
    private func setupUI() {
        title = "Meu cartão"
    }
    
    private func setupLabels() {
        guard let model = viewModel?.model else { return }
        labelUserName.text = model.userName
        labelBloodType.text = "Tipo Sanguíneo: \(String(describing: model.bloodType))"
        labelUserSince.text = "User desde: \(String(describing: model.userSince))"
        labelDepartament.text = "Departamento: \(String(describing: model.department))"
        labelPhone.text = "Telefone: \(String(describing: model.phone))"
        labelBirthday.text = "Aniversário: \(String(describing: model.birthday))"
        labelEmail.text = "email: \(String(describing: model.email))"
        labelSobreOUser.text = "Sobre o User"
        labelAboutUser.text = model.aboutUser
        labelCurriculum.text = model.userCurriculum
        imageViewCard.image = UIImage(named: model.cardFrontImage)
    }
}
