//
//  ViewController.swift
//  TechCareerO7
//
//  Created by Bilal Yalcin on 26.08.2022.
//

import UIKit

class AnasayfaVC: UIViewController{

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var notlarTableView: UITableView!
    
    var notListesi = [Notlar]()
    
    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        notlarTableView.delegate = self
        notlarTableView.dataSource = self
        
        veritabaniKopyalama()
        
        AnasayfaRouter.creatModule(ref:self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.notlariYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetayVC" {
            if let not = sender as? Notlar {
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.not = not
            }
        }
    }
    func veritabaniKopyalama(){
        let bundleYolu = Bundle.main.path(forResource: "rehber", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("rehber.sqlite")
        let fm = FileManager.default
        if fm.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var")
        }else {
            do {
                try fm.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch {
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func buttonAdd(_ sender: Any) {
        performSegue(withIdentifier: "toKayitVC", sender: nil)
    }
    
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(notlarListesi: Array<Notlar>) {
        self.notListesi = notlarListesi
        self.notlarTableView.reloadData()
    }
}

extension AnasayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let not = notListesi[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "anasayfaCell", for: indexPath) as! AnasayfaCell
        cell.labelAnasayfa.text = "\(not.yapilacak_is!)"
        cell.backgroundColor = UIColor(white: 0.97, alpha: 1)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let not = notListesi[indexPath.row]
        performSegue(withIdentifier: "toDetayVC", sender: not)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil") { (contextualAction,view,bool) in
            let not = self.notListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İslemi", message: "\(not.yapilacak_is!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive) { action in
                self.anasayfaPresenterNesnesi?.sil(yapilacak_id: not.yapilacak_id!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
            
        }
        let duzenleAction = UIContextualAction(style: .normal, title: "Düzenle"){(contextualAction,view,bool) in
            let not = self.notListesi[indexPath.row]
            self.performSegue(withIdentifier: "toDetayVC", sender: not)
            
        }
        
        return UISwipeActionsConfiguration(actions: [silAction,duzenleAction])
    }
    
}
