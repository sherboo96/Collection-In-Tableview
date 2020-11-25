//
//  CategoriesCCell.swift
//  Collection-In-Tableview
//
//  Created by Mahmoud Sherbeny on 11/22/20.
//

import UIKit

class CategoriesCCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        backView.layer.cornerRadius = 10.0
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backView.backgroundColor = .cyan
            } else {
                backView.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            }
        }
    }

}
