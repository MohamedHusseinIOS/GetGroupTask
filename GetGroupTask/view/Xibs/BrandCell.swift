//
//  BrandCell.swift
//  GetGroupTask
//
//  Created by Mohamed Hussien on 01/10/2019.
//  Copyright © 2019 HNF. All rights reserved.
//

import UIKit

class BrandCell: UITableViewCell {
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    static let id = "BrandCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func bindOn(brand: Brand, brandLogo: UIImage) {
        logoImg.image = brandLogo
        nameLbl.text = brand.name
    }

}
