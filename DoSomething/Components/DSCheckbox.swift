//
//  DSCheckbox.swift
//  DoSomething
//
//  Created by Mustafa Filiz on 4.03.2023.
//

import UIKit

class DSCheckbox: UIButton {
    
    // Images
    let checkedImage = UIImage(systemName: "checkmark.circle.fill")! as UIImage
    let uncheckedImage = UIImage(systemName: "circle")! as UIImage
    
    // Bool property
    var isChecked: Bool = false {
        didSet {
            if isChecked == true {
                self.setImage(checkedImage, for: UIControl.State.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControl.State.normal)
            }
        }
    }
        
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: .touchUpInside)
        self.isChecked = false
    }
        
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            isChecked = !isChecked
        }
    }

}
