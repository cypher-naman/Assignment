//
//  reusableCell.swift
//  AssignmentAntino
//
//  Created by Naman Sharma on 28/12/19.
//  Copyright © 2019 Naman Sharma. All rights reserved.
//

import UIKit

class reusableCell: UITableViewCell {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBOutlet weak var nameText: UILabel!
    
    @IBOutlet weak var ageText: UILabel!
    
    @IBOutlet weak var locationText: UILabel!
    
    @IBOutlet weak var personImage: UIImageView!
    
    
}
