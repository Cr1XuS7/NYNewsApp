//
//  NewsCell.swift
//  NYNewsApp--CodingChallenge--ChristopherBoyajian
//
//  Created by Christopher Boyajian on 22/07/2022.
//

import UIKit
import SafariServices
import Foundation


class NewsCell: UITableViewCell {

    
    
    
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var NewsBox: UIView!
    @IBOutlet weak var publisheddateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bylineLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    
    

    var buttonAction : (() -> ())?
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        buttonAction?()
            }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        
    }
}
