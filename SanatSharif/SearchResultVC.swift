//
//  SearchVC.swift
//  SanatSharif
//
//  Created by cyrus refahi on 8/20/16.
//  Copyright © 2016 cyrus refahi. All rights reserved.
//

import UIKit

class SearchResultVC: UIViewController {
    
    var textSearched : String!
    @IBOutlet weak var textTempLabel : UILabel!
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.setBackgroundImage(nil, forBarMetrics: UIBarMetrics.Default)
        
        
        
    }
    
    override func viewDidAppear(animated: Bool) {
        textTempLabel.text = textSearched
    }

}
