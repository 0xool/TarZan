//
//  ListCell.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/31/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class ListCell: UICollectionViewCell {

    @IBOutlet weak var nameLabel : UILabel!
    @IBOutlet weak var imageView : UIImageView!
    
    var request: Request?
    
    
    
    func configureCell(name : String , imageSRC : String)  {
    
        
        self.nameLabel.text = name
        reset()
        let url = imageSRC.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        loadImage(url!)
        
    }
    
    func getNetworkImage(urlString: String, completion: (UIImage? -> Void)) -> (Request) {
        return Alamofire.request(.GET, urlString).responseImage { (response) -> Void in
            guard let image = response.result.value else { return }
            completion(image)
        }
    }
    
    func reset() {
        imageView.image = nil
        request?.cancel()
        
    }
    
    func loadImage(url : String) {
        
        
        request = getNetworkImage(url) { image in
            self.populateCell(image!)
        }
    }
    
    func populateCell(image: UIImage) {
        
        self.imageView.image = image
        
    }
    
}
