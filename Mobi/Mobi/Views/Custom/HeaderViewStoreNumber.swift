//
//  HeaderViewStoreNumber.swift
//  Mobi
//
//  Created by Hoang Do on 2/25/18.
//  Copyright © 2018 HoangSon. All rights reserved.
//

import UIKit

class HeaderViewStoreNumber: UIView {

    @IBOutlet weak var viewMaskTop: UIView!
    @IBOutlet weak var containView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        comoninit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        comoninit()
    }
    
    private func comoninit() {
        Bundle.main.loadNibNamed("HeaderViewStoreNumber", owner: self, options: nil)
        addSubview(containView)
    }
}
