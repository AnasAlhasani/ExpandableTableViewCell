//
//  ExpandableCell.swift
//  ExpandableCell
//
//  Created by Anas Alhasani on 10/9/17.
//  Copyright © 2017 Anas Alhasani. All rights reserved.
//

import UIKit

class ExpandableCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var arrowImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageRotationAngle = CGFloat.pi*2
    }
    
    private var imageRotationAngle: CGFloat = CGFloat.pi {
        didSet{
            arrowImage.transform = CGAffineTransform(rotationAngle: imageRotationAngle)
        }
    }
    
    func update(_ subject: Subject) {
        
        titleLabel.text = subject.title
        
        descriptionLabel.text = subject.isExpanded ? "\n"+subject.description+"\n": ""
        
        imageRotationAngle = subject.isExpanded ? CGFloat.pi*2: CGFloat.pi
    }
}
