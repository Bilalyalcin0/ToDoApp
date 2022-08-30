//
//  KayitVC.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 26.08.2022.
//

import UIKit

class KayitVC: UIViewController {

    
    @IBOutlet weak var textFieldKayit: UITextField!
    
    var kayitPresenterNesnesi : ViewToPresenterKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        KayitRouter.creatModule(ref: self)

        let dokunmaAlgilama = UITapGestureRecognizer(target: self, action: #selector(dokunmaAlgilama))
        view.addGestureRecognizer(dokunmaAlgilama)
    }
    @objc func dokunmaAlgilama(){
        view.endEditing(true)
    }
    
   
    @IBAction func buttonEkle(_ sender: Any) {
        if let y_is = textFieldKayit.text {
         //   kayit(yapilacak_is: y_is)
            kayitPresenterNesnesi?.ekle(yapilacak_is: y_is)
        }
    }
    
    /*
    func kayit(yapilacak_is : String){
        print("Not yeni kayıt : \(yapilacak_is)")
    }
    */

}
