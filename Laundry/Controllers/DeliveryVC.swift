//
//  DeliveryVC.swift
//  Laundry
//
//  Created by Ranjit Mahto on 11/08/23.
//

import UIKit

class DeliveryVC: UIViewController {
    
    @IBOutlet weak var btnContinue:UIButton!
    
    @IBOutlet weak var bgViewFastDelivery:UIView!
    @IBOutlet weak var lblSelectFastDelevery:UILabel!
    
    @IBOutlet weak var bgViewRegularDelivery:UIView!
    @IBOutlet weak var lblSelectRegularDelevery:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Delivery Option"
        setUpView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    fileprivate func setUpView() {
        
        btnContinue.designButton()
        
        bgViewFastDelivery.layer.cornerRadius = 10
        bgViewFastDelivery.layer.borderWidth = 1.5
        bgViewFastDelivery.layer.borderColor = UIColor.gray.cgColor
        lblSelectFastDelevery.makeCircular()
        
        bgViewRegularDelivery.layer.cornerRadius = 10
        bgViewRegularDelivery.layer.borderWidth = 1.5
        bgViewRegularDelivery.layer.borderColor = UIColor.gray.cgColor
        lblSelectRegularDelevery.makeCircular()
        
        bgViewFastDelivery.layer.borderColor = UIColor.orange.cgColor
        bgViewRegularDelivery.layer.borderColor = UIColor.gray.cgColor
        lblSelectFastDelevery.backgroundColor = UIColor.orange
        lblSelectFastDelevery.textColor = UIColor.white
        lblSelectRegularDelevery.backgroundColor = UIColor.white
        lblSelectRegularDelevery.textColor = UIColor.black
    }
    
    @IBAction func btnDeliveryTapped(_ sender: UIButton) {
        
        switch sender.tag {
            case 0:
                print("Delivery Select")
                bgViewFastDelivery.layer.borderColor = UIColor.orange.cgColor
                bgViewRegularDelivery.layer.borderColor = UIColor.gray.cgColor
                lblSelectFastDelevery.backgroundColor = UIColor.orange
                lblSelectFastDelevery.textColor = UIColor.white
                lblSelectRegularDelevery.backgroundColor = UIColor.white
                lblSelectRegularDelevery.textColor = UIColor.black
                
            case 1:
                print("Regular Select")
                bgViewFastDelivery.layer.borderColor = UIColor.gray.cgColor
                bgViewRegularDelivery.layer.borderColor = UIColor.orange.cgColor
                lblSelectFastDelevery.backgroundColor = UIColor.white
                lblSelectFastDelevery.textColor = UIColor.black
                lblSelectRegularDelevery.backgroundColor = UIColor.orange
                lblSelectRegularDelevery.textColor = UIColor.white
                
            default:
                return
        }
    }
    
}
