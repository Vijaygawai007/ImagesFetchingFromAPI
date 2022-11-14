//
//  TableViewCell.swift
//  image fetching on secondViewController
//
//  Created by Prince's Mac on 12/10/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var idlabel: UILabel!
    @IBOutlet weak var titlelabel: UILabel!
    @IBOutlet weak var pricelabel: UILabel!
    @IBOutlet weak var imageLabel: UIImageView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
