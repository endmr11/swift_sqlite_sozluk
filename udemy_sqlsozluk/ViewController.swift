//
//  ViewController.swift
//  udemy_sqlsozluk
//
//  Created by Eren Demir on 10.05.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kelimeTableView: UITableView!
    var aramaYapiliyorMu = false
    var aramaKelimesi:String?
    var kelimeListesi = [Kelimeler]()
    override func viewDidLoad() {
        super.viewDidLoad()
        veritabaniKopyala()
        kelimeTableView.delegate = self
        kelimeTableView.dataSource = self
        searchBar.delegate = self
        kelimeListesi = Kelimelerdao().tumKelimeleriAl()
    }
    
    func veritabaniKopyala() {
        let bundleYol = Bundle.main.path(forResource: "sozluk", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let fileManager = FileManager.default
        let kopyalanacakYol = URL(fileURLWithPath: hedefYol).appendingPathComponent("sozluk.sqlite")
        if fileManager.fileExists(atPath: kopyalanacakYol.path){
            print("Veritabanı zaten var.")
        }else{
            do {
                try fileManager.copyItem(at: URL(fileURLWithPath: bundleYol!), to: URL(fileURLWithPath: kopyalanacakYol.path))
            }catch{
                print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            print("toDetay")
            if let index = sender as? Int{
                let gidilecekVC = segue.destination as! DetayViewController
                gidilecekVC.kelime = kelimeListesi[index]          }
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kelimeListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let kelime = kelimeListesi[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kelimeHucre", for: indexPath) as! KelimeTableViewCell
        cell.turkceLabel.text = kelime.turkce
        cell.ingilizceLabel.text = kelime.ingilizce
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
}
extension ViewController:UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(print(searchText))
        kelimeListesi = Kelimelerdao().aramaYap(ingilizce: searchText)
        kelimeTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel tıklandı")
    }
    
}
