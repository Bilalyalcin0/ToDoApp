//
//  KayitPresenter.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 27.08.2022.
//

import Foundation

class KayitPresenter : ViewToPresenterKayitProtocol {
    var kayitInteractor: PresenterToInteractorKayitProtocol?
    
    func ekle(yapilacak_is: String) {
        kayitInteractor?.notEkle(yapilacak_is: yapilacak_is)
    }
    
}
