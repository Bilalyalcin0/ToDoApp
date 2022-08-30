//
//  KayitRouter.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 27.08.2022.
//

import Foundation

class KayitRouter : PresenterToRouterKayitProtocol{
    static func creatModule(ref: KayitVC) {
        ref.kayitPresenterNesnesi = KayitPresenter()
        ref.kayitPresenterNesnesi?.kayitInteractor = KayitInteractor()
        
    }
}
