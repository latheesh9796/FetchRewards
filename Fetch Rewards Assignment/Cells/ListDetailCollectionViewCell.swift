//
//  ListDetailCollectionViewCell.swift
//  Fetch Rewards Assignment
//
//  Created by Latheeshwarraj Mohanraj on 10/28/20.
//  Copyright © 2020 Veg World. All rights reserved.
//

import UIKit

class ListDetailCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var viewWidth: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupView(_ item: Item){
//        viewWidth.constant = UIScreen.main.bounds.width
        itemName.text = item.name
        view.layer.cornerRadius = 8.0
    }
}
