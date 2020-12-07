//
//  ListCollectionViewCell.swift
//  Fetch Rewards Assignment
//
//  Created by Latheeshwarraj Mohanraj on 10/28/20.
//  Copyright © 2020 Veg World. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var listCount: UILabel!
    @IBOutlet weak var listName: UILabel!
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var viewWidth: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupView(_ listId: Int,_ listCount: Int){
        self.listName.text = "List \(listId)"
        self.listCount.text = listCount > 0 ? "\(listCount) items" : "0 item"
        view.layer.cornerRadius = 8.0
        viewWidth.constant = (UIScreen.main.bounds.width - 48)/2
    }

}
