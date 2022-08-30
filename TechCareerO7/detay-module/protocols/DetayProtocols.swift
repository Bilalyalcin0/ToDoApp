//
//  DetayProtocols.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 27.08.2022.
//

import Foundation

protocol ViewToPresenterDetayProtocol {
    var detayInteractor : PresenterToInteractorDetayProtocol? {get set}
    func guncelle(yapilacak_id : Int,yapilacak_is : String)
}

protocol PresenterToInteractorDetayProtocol {
    func notGuncelle(yapilacak_id : Int,yapilacak_is : String)
}

protocol PresenterToRouterDetayProtocol {
    static func creatModule(ref: DetayVC)
}
