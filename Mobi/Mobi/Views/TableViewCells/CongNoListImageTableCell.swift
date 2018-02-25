//
//  CongNoListImageTableCell.swift
//  Mobi
//
//  Created by Hoang Do on 12/6/17.
//  Copyright © 2017 HoangSon. All rights reserved.
//

import UIKit
import AlamofireImage

class CongNoListImageTableCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.imgView.layer.cornerRadius = 4
        self.imgView.layer.masksToBounds = true
        self.imgView.clipsToBounds = true
    }
    
    func config(_ url: String) {
         self.imgView.af_setImage(withURL: URL(string: url)!)
    }

}
