//
//  DetayInteractor.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 27.08.2022.
//

import Foundation

class DetayInteractor : PresenterToInteractorDetayProtocol {
    
    let db : FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path )
    }
    
    func notGuncelle(yapilacak_id: Int, yapilacak_is: String) {
        db?.open()
    
        do {
            try db!.executeUpdate("UPDATE notlar SET yapilacak_is = ? WHERE yapilacak_id = ?", values: [yapilacak_is,yapilacak_id ])
            
        }catch{
            print(error.localizedDescription)
        }
    
        db?.close()
    }

}
