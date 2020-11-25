//
//  FeatureCCell.swift
//  Collection-In-Tableview
//
//  Created by Mahmoud Sherbeny on 11/22/20.
//

import UIKit

class FeatureCCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        backView.layer.cornerRadius = 10.0
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                backView.backgroundColor = .cyan
            } else {
                backView.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            }
        }
    }
}
