//
//  DetayRouter.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 27.08.2022.
//

import Foundation

class DetayRouter : PresenterToRouterDetayProtocol {
    static func creatModule(ref: DetayVC) {
        ref.detayPresenterNesnesi = DetayPresenter()
        ref.detayPresenterNesnesi?.detayInteractor = DetayInteractor()
    }
}
