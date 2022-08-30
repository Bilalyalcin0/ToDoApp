//
//  KayitInteractor.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 27.08.2022.
//

import Foundation

class KayitInteractor : PresenterToInteractorKayitProtocol { // Interactor'ın Ana protocolunu ekliyoruz.
    
    let db : FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path )
    } 
    
    func notEkle(yapilacak_is: String) {
        db?.open()
    
        do {
            try db!.executeUpdate("INSERT INTO notlar ( yapilacak_is) VALUES (?)", values: [yapilacak_is])
            
        }catch{
            print(error.localizedDescription)
        }
    
        db?.close()
    }
    
}
