//
//  Kelimelerdao.swift
//  udemy_sqlsozluk
//
//  Created by Eren Demir on 10.05.2022.
//

import Foundation

class Kelimelerdao {
    
    let db:FMDatabase?
    init(){
        let hedefYol =  NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("sozluk.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumKelimeleriAl() -> [Kelimeler] {
        var kelimeler = [Kelimeler]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM kelimeler", values: nil)
            while rs.next() {
                let kelime = Kelimeler(
                    kelime_id: Int(rs.string(forColumn: "kelime_id"))!,
                    turkce: rs.string(forColumn: "turkce")!,
                    ingilizce: rs.string(forColumn: "ingilizce")!)
                kelimeler.append(kelime)
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        return kelimeler
    }
    
    func kelimeGetir(kelime_id:Int) -> Kelimeler {
        var kelime = Kelimeler()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM kelimeler WHERE kelime_id =?", values: [kelime_id])
            while rs.next() {
                kelime = Kelimeler(
                    kelime_id: Int(rs.string(forColumn: "kelime_id"))!,
                    turkce: rs.string(forColumn: "turkce")!,
                    ingilizce: rs.string(forColumn: "ingilizce")!)
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        return kelime
    }
    
    func aramaYap(ingilizce:String) -> [Kelimeler] {
        var liste = [Kelimeler]()
        db?.open()
        do {
            let rs = try db!.executeQuery("SELECT * FROM kelimeler WHERE ingilizce LIKE '%\(ingilizce)%'", values: nil)
            while rs.next() {
                let kelime = Kelimeler(
                    kelime_id: Int(rs.string(forColumn: "kelime_id"))!,
                    turkce: rs.string(forColumn: "turkce")!,
                    ingilizce: rs.string(forColumn: "ingilizce")!)
                liste.append(kelime)
            }
        } catch {
            print(error.localizedDescription)
        }
        db?.close()
        return liste
    }
}
