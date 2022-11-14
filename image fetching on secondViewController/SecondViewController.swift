//
//  SecondViewController.swift
//  image fetching on secondViewController
//
//  Created by Prince's Mac on 12/10/22.
//

import UIKit
import SDWebImage

class SecondViewController: UIViewController {
    
    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var idLAbel: UILabel!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var priceLAbel: UILabel!
    @IBOutlet weak var discriptionsLAbel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var dataFromFirstViewController:product?
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        imageLabel.sd_setImage(with: URL(string: dataFromFirstViewController!.image))
        self.idLAbel.text = "\(dataFromFirstViewController!.id)"
        self.TitleLabel.text = "\(dataFromFirstViewController!.title)"
        self.priceLAbel.text = "$"+"\(dataFromFirstViewController!.price)"
        self.discriptionsLAbel.text = "\(dataFromFirstViewController!.description)"
        self.categoryLabel.text = "\(dataFromFirstViewController!.category)"
    }
    

}
