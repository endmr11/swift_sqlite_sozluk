//
//  KelimeTableViewCell.swift
//  udemy_sqlsozluk
//
//  Created by Eren Demir on 10.05.2022.
//

import UIKit

class KelimeTableViewCell: UITableViewCell {

    @IBOutlet weak var ingilizceLabel: UILabel!
    @IBOutlet weak var turkceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
