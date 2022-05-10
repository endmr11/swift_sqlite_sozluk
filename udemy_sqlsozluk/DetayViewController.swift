//
//  DetayViewController.swift
//  udemy_sqlsozluk
//
//  Created by Eren Demir on 10.05.2022.
//

import UIKit

class DetayViewController: UIViewController {

    @IBOutlet weak var ingilizceLabel: UILabel!
    @IBOutlet weak var turkceLabel: UILabel!
    var kelime:Kelimeler?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let k = kelime {
            ingilizceLabel.text = k.ingilizce
            turkceLabel.text = k.turkce
        }
    }
}
