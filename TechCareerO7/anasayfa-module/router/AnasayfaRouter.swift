//
//  AnasayfaRouter.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 28.08.2022.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func creatModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        
        // View
        ref.anasayfaPresenterNesnesi = presenter
        
        // Presenter
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        
        // Interactor
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
    }
}
