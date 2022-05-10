//
//  Kelimeler.swift
//  udemy_sqlsozluk
//
//  Created by Eren Demir on 10.05.2022.
//

import Foundation

class Kelimeler {
    var kelime_id:Int?
    var turkce:String?
    var ingilizce:String?
    
    init() {
        
    }
    init(kelime_id:Int,turkce:String,ingilizce:String) {
        self.kelime_id = kelime_id
        self.turkce = turkce
        self.ingilizce = ingilizce
    }
}
