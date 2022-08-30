//
//  AnasayfaInteractor.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 28.08.2022.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    let db : FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        db = FMDatabase(path: kopyalanacakYer.path )
    }

func tumNotlariAl() {        // Okuma kısmı
    var liste = [Notlar]()
    
    db?.open()
    
    do {
        let q = try db!.executeQuery("SELECT * FROM notlar", values: nil)
        
        while q.next() {
            let not = Notlar(yapilacak_id: Int(q.string(forColumn: "yapilacak_id"))!,
                             yapilacak_is: q.string(forColumn: "yapilacak_is")!)
            liste.append(not)
        }
        anasayfaPresenter?.presenteraVeriGonder(notlarListesi: liste)
    }catch{
        print(error.localizedDescription)
    }
    
    db?.close()
    
   
}

func notlariAra(aramaKelimesi: String) {
    var liste = [Notlar]()
    
    db?.open()
    
    do {
        let q = try db!.executeQuery("SELECT * FROM notlar WHERE yapilacak_is like '%\(aramaKelimesi)%'", values: nil)
        
        while q.next() {
            let not = Notlar(yapilacak_id: Int(q.string(forColumn: "yapilacak_id"))!,
                             yapilacak_is: q.string(forColumn: "yapilacak_is")!)
            liste.append(not)
        }
        anasayfaPresenter?.presenteraVeriGonder(notlarListesi: liste)
    }catch{
        print(error.localizedDescription)
    }
    
    db?.close()
}

func notSil(yapilacak_id: Int) {
        db?.open()
    
        do {
            try db!.executeUpdate("DELETE FROM notlar WHERE yapilacak_id = ?", values: [yapilacak_id])
            tumNotlariAl() 
        }catch{
            print(error.localizedDescription)
        }
    
        db?.close()
    }
}
