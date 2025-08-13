//
//  MyCardViewModel.swift
//  GerencianetChallenge
//
//  Created by Leonardo Cunha on 06/01/22.
// swiftlint:disable line_length

import UIKit

final class MyCardViewModel {
    // MARK: Properties
    var model: MyCardModel?
    
    // MARK: Initialization
    init() {
        getFakeService()
    }
    
    // MARK: Methods
    func getFakeService() {
        guard let userName = UserSessionManager.shared.userName,
              let email = UserSessionManager.shared.email else { return }
        let department = "iOS"
        let userSince = "01/01/2021"
        let bloodType = "A-"
        let phone = "(31)99999-9999"
        let birthday = "24/02/1955"
        let aboutUser = """
Steven Paul Jobs (São Francisco, Califórnia, 24 de fevereiro de 1955 — Palo Alto, Califórnia, 5 de outubro de 2011) foi um inventor, empresário e magnata americano no setor da informática. Notabilizou-se como co-fundador, presidente e diretor executivo da Apple Inc. e por revolucionar seis indústrias: computadores pessoais, filmes de animação, música, telefones, tablets e publicações digitais. Além de sua ligação com a Apple, foi diretor executivo da empresa de animação por computação gráfica Pixar e acionista individual máximo da The Walt Disney Company.Morreu no dia 5 de outubro de 2011, aos 56 anos de idade, devido a um câncer pancreático.
"""
        let userCurriculum = """
"Estou procurando um lugar que necessite de muitas reformas e consertos, mas que tenha fundações sólidas. Estou disposto a demolir paredes, construir pontes e acender fogueiras. Tenho uma grande experiência, um monte de energia, um pouco dessa coisa de ‘visão’ e não tenho medo de começar do zero".
No final da década de 70, Jobs, em parceria com Steve Wozniak e Mike Markkula, entre outros, desenvolveu e comercializou uma das primeiras linhas de computadores pessoais de sucesso, a série Apple II. No começo da década de 1980, ele estava entre os primeiros a perceber o potencial comercial da interface gráfica do usuário guiada pelo Mouse (informática), o que levou à criação do Macintosh.

Após perder uma disputa de poder com a mesa diretora em 1985, Jobs foi demitido da Apple e fundou a NeXT, uma companhia de desenvolvimento de plataformas direcionadas aos mercados de educação superior e administração. A compra da NeXT pela Apple em 1996 levou Jobs de volta à companhia que ele ajudara a fundar, sendo então seu CEO de 1997 a 2011, ano em que anunciou sua renúncia ao cargo, recomendando Tim Cook como sucessor.

Em 2015, houve o lançamento do filme biográfico Steve Jobs, onde conta parte da vida do co-fundador da Apple Inc., remetendo à lançamentos feitos no período entre 1984 e 1998 como o Apple Macintosh, NeXT Computer e o iMac G3. O filme teve sua estreia em 5 de setembro no Tellurid Film Festival. A atriz Kate Winslet ganhou o Globo de Ouro e o BAFTA como melhor atriz-coadjuvante por seu papel, além de ter sido nomeada também para o Oscar na mesma categoria. O ator Michael Fassbender também concorreu ao Oscar de Melhor Ator, por interpretar Jobs. O filme ganhou o Globo de Ouro de Melhor Roteiro, escrito por Aaron Sorkin.
"""
        let cardFrontImage = "photo_steve"
        let cardBackImage = "cardBack"
        let myCardModel = MyCardModel(userName: userName, userSince: userSince, bloodType: bloodType, department: department, phone: phone, birthday: birthday, email: email, aboutUser: aboutUser, userCurriculum: userCurriculum, cardFrontImage: cardFrontImage, cardBackImage: cardBackImage)
        self.model = myCardModel
        return
    }
}
