//
//  DetayVC.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 26.08.2022.
//

import UIKit

class DetayVC: UIViewController {

    var not : Notlar?
    
    @IBOutlet weak var textFieldDetay: UITextField!
    
    var detayPresenterNesnesi : ViewToPresenterDetayProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DetayRouter.creatModule(ref: self)
        
        if let n = not {
            textFieldDetay.text = n.yapilacak_is
        }
        
    }
    
    @IBAction func buttonGuncelle(_ sender: Any) {
        if let y_is = textFieldDetay.text, let n = not {
            detayPresenterNesnesi?.guncelle(yapilacak_id: n.yapilacak_id!, yapilacak_is: y_is)
        }
    }
    
    /*
    func guncelle(yapilacak_id : Int, yapilacak_is : String){
        print("Not güncelle : \(yapilacak_id) - \(yapilacak_is)")
    }
     */
}
