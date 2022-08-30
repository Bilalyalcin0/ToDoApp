//
//  Protocols.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 27.08.2022.
//

import Foundation

protocol ViewToPresenterKayitProtocol { // Presenter Katmanı
    var kayitInteractor : PresenterToInteractorKayitProtocol? {get set}
    func ekle(yapilacak_is : String) // İlk bu fonksiyon çalışacak - View'daki değişkenle bu fonk. çalıştırcaz.
}

protocol PresenterToInteractorKayitProtocol { // Interactor Katmanı
    func notEkle(yapilacak_is : String) // kayitInteractor'ile bu fonksiyonu çalıştıracagız
}

protocol PresenterToRouterKayitProtocol {
    static func creatModule(ref:KayitVC)
}
