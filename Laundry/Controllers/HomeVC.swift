//
//  HomeVC.swift
//  Laundry
//
//  Created by Ranjit Mahto on 10/08/23.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var profileImageBgView:UIView!
    @IBOutlet weak var lblUserName:UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    //
    @IBOutlet weak var cardView:UIView!
    @IBOutlet weak var laundryImage:UIImageView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var btnContinue:UIButton!
    
    var homeData: HomeData = HomeData()
    var laundrayInfo:[LaundryInfo] = [LaundryInfo]()
    var userName:String?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpView()
        
        laundrayInfo = homeData.all()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        tabBarController?.setTabBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear (_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.tintColor = .black
        navigationItem.backBarButtonItem = UIBarButtonItem(title:"", style:.plain, target: nil, action: nil)
        tabBarController?.setTabBarHidden(true, animated: true)
    }
    
    fileprivate func setUpView(){
                
        profileImageBgView.makeCircular()
        
        self.cardView.layer.cornerRadius = 15
        self.cardView.layer.borderWidth = 1
        self.cardView.layer.borderColor = UIColor.gray.cgColor
        
        btnContinue.makeCircular()
        
        let defaults = UserDefaults.standard
        let userName = defaults.string(forKey: "userFirstName")
        lblUserName.text = userName
    }
    
    @IBAction func btnContinueTapped(_ sender: Any) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DeliveryVC") as? DeliveryVC
        navigationController?.pushViewController(vc!, animated:true)
    }
}


extension HomeVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        laundrayInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell", for: indexPath) as! HomeViewCell
        cell.configureCell(laudryInfo: laundrayInfo[indexPath.row])
        return cell
    }
}

extension HomeVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100 * addDemo(number: 5)
    }
    
    func addDemo(number:Int) -> CGFloat {
        return CGFloat(number*number)
    }
    
}
