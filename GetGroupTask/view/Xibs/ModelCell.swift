//
//  ModelCell.swift
//  GetGroupTask
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import UIKit

class ModelCell: UITableViewCell {

    @IBOutlet weak var nameLbl: UILabel!
    
    static let id = "ModelCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func bindOn(brand: CarModel) {
        nameLbl.text = brand.name
    }

}
