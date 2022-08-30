//
//  DetayPresenter.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 27.08.2022.
//

import Foundation

class DetayPresenter : ViewToPresenterDetayProtocol {
    var detayInteractor: PresenterToInteractorDetayProtocol?
    
    func guncelle(yapilacak_id: Int, yapilacak_is: String) {
        detayInteractor?.notGuncelle(yapilacak_id: yapilacak_id, yapilacak_is: yapilacak_is)
    }
}
