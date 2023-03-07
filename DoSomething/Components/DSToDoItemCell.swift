//
//  ToDoItemCell.swift
//  DoSomething
//
//  Created by Mustafa Filiz on 3.03.2023.
//

import UIKit

class DSToDoItemCell: UITableViewCell {

    @IBOutlet var checkbox: DSCheckbox!
    @IBOutlet var todoLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
