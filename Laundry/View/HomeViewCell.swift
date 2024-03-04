//
//  HomeViewCell.swift
//  Laundry
//
//  Created by Ranjit Mahto on 10/08/23.
//

import UIKit

class HomeViewCell: UITableViewCell {
    
    @IBOutlet weak var cardView:UIView!
    @IBOutlet weak var laundryImage:UIImageView!
    @IBOutlet weak var lblTitle:UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var btnAccessory:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.cardView.layer.cornerRadius = 15
        self.cardView.layer.borderWidth = 1
        self.cardView.layer.borderColor = UIColor.gray.cgColor
        
        btnAccessory.makeCircular()
    }
    
    func configureCell(laudryInfo: LaundryInfo) {
        laundryImage.image = UIImage(named:laudryInfo.imageurl)
        lblTitle.text = laudryInfo.title
        lblDetail.text = laudryInfo.details
        lblPrice.text = laudryInfo.price
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
