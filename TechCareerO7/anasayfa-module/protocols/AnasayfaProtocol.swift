//
//  AnasayfaProtocol.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 28.08.2022.
//

import Foundation

// Ana protocoller
protocol ViewToPresenterAnasayfaProtocol { // Presenter Katmanı
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol?  { get set }
    var anasayfaView : PresenterToViewAnasayfaProtocol? {get set}
    
    func notlariYukle()
    func ara(aramaKelimesi : String)
    func sil(yapilacak_id : Int)
}

protocol PresenterToInteractorAnasayfaProtocol { // Interactor Katmanı
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumNotlariAl()
    func notlariAra(aramaKelimesi : String)
    func notSil(yapilacak_id : Int)
}


// Taşıyıcı Protocoller
protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(notlarListesi : Array<Notlar>)
}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(notlarListesi : Array<Notlar>)
}

// Router
protocol PresenterToRouterAnasayfaProtocol {
    static func creatModule(ref:AnasayfaVC)
}
