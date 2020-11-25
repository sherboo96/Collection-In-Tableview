//
//  PickerCCell.swift
//  Collection-In-Tableview
//
//  Created by Mahmoud Sherbeny on 11/22/20.
//

import UIKit

class PickerCCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        backView.layer.cornerRadius = 10.0
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backView.backgroundColor = .cyan
            } else {
                backView.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            }
        }
    }

}
