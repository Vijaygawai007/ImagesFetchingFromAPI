//
//  ViewController.swift
//  image fetching on secondViewController
//
//  Created by Prince's Mac on 12/10/22.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    @IBOutlet weak var myTable: UITableView!
    
    var newproducts = [product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.delegate = self
        myTable.dataSource = self
        
        //MARK: FUNCTION CALL.
        fetchapiImage()
    }
    //MARK: FUNCTION FOR JSON API CALL.
    func fetchapiImage(){
        let urlString = "https://fakestoreapi.com/products"
        let url = URL(string: urlString)
        URLSession.shared.dataTask(with: url!) {data, response, error in
            if error == nil {
                do {
                    self.newproducts = try! JSONDecoder().decode([product].self, from: data!)
                    DispatchQueue.main.async {
                        self.myTable.reloadData()
                    }
                }catch let err {
                    print("error \(err.localizedDescription)")
                }
            }
        }.resume()
    }
}

//MARK: PROTOCOL FOR UITABLEVIEWDATASOURSE AND UITABLEVIEWDELEGETE.
extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newproducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let TableViewCell = self.myTable.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)as! TableViewCell
        let fetchid = String(newproducts[indexPath.row].id)
        let fetchtitle = String(newproducts[indexPath.row].title)
        let fetchprice = "$"+String(newproducts[indexPath.row].price)
        let fetchimage = String(newproducts[indexPath.row].image)
        
        TableViewCell.idlabel.text = fetchid
        TableViewCell.titlelabel.text = fetchtitle
        TableViewCell.pricelabel.text = fetchprice
        TableViewCell.imageLabel.sd_setImage(with: NSURL(string: newproducts[indexPath.row].image)as URL?)
        TableViewCell.selectionStyle = .none
        //  TableViewCell.imageLabel.layer.cornerRadius = 150
        
        return TableViewCell
    }
    //MARK: DID_SELECT_ROW AT SELECTION OF ROW NEVIGATE TO SECOND_VIEW_CONTROLLER.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let SecondViewController = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        
        let dataToPass = newproducts[indexPath.row]
        SecondViewController.dataFromFirstViewController = dataToPass
        
        self.navigationController?.pushViewController(SecondViewController, animated: true)
    }
}
extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }
}
