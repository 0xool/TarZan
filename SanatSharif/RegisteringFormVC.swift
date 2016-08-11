//
//  RegisteringFormVC.swift
//  SanatSharif
//
//  Created by CyrusREfahi on 4/13/1395 AP.
//  Copyright © 1395 cyrus refahi. All rights reserved.
//

import UIKit

class RegisteringFormVC: UIViewController {

    
    @IBOutlet weak var Pwd: UITextField!
    @IBOutlet weak var FName: UITextField!
    @IBOutlet weak var LName: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Area: UITextField!
    @IBOutlet weak var MainAdress: UITextField!
    @IBOutlet weak var Type: UISegmentedControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
     @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       //  scrollView.contentSize = CGSize(width: stackView.frame.width, height: stackView.frame.height)
        
//        scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(scrollView)
//        
//       view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[scrollView]|", options: .AlignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
//        view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[scrollView]|", options: .AlignAllCenterX, metrics: nil, views: ["scrollView": scrollView]))
        
        
//        stackView = UIStackView()
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .Vertical
//        scrollView.addSubview(stackView)
//        
//        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|[stackView]|", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["stackView": stackView]))
//        scrollView.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[stackView]", options: NSLayoutFormatOptions.AlignAllCenterX, metrics: nil, views: ["stackView": stackView]))
//        
//        for _ in 1 ..< 100 {
//            let vw = UIButton(type: UIButtonType.System)
//            vw.setTitle("Button", forState: .Normal)
//            stackView.addArrangedSubview(vw)
//        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
      //  scrollView.contentSize = stackView.frame.size
        

        
    }
    
    
    @IBAction func BackBtnClicked(sender: AnyObject) {
        
        self.performSegueWithIdentifier("BackToLoggin", sender: nil)
        
    }
    

}
