//
//  AnasayfaPresenter.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 28.08.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func notlariYukle() {
        anasayfaInteractor?.tumNotlariAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.notlariAra(aramaKelimesi: aramaKelimesi)
    }
    
    func sil(yapilacak_id: Int) {
        anasayfaInteractor?.notSil(yapilacak_id: yapilacak_id)
    }
    
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(notlarListesi: Array<Notlar>) {
        anasayfaView?.vieweVeriGonder(notlarListesi: notlarListesi )
    }
    
}
