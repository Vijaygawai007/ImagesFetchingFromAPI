//
//  model.swift
//  image fetching on secondViewController
//
//  Created by Prince's Mac on 12/10/22.
//

import Foundation
//MARK: MODEL OF JSON DATA.
struct product : Decodable {
    var id : Int
    var title : String
    var price : Double
    var image : String
    var description : String
    var category : String
    
}
