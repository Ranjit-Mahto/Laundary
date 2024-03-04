//
//  Extensions.swift
//  Laundry
//
//  Created by Ranjit Mahto on 10/08/23.
//

import Foundation
import UIKit

extension UITextField {
    
    func designTextField(imageName:String){
        
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.orange.cgColor
        self.clipsToBounds = true
        
        let aView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        
        self.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
        let image = UIImage(named: imageName)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        aView.addSubview(imageView)
        
        self.leftView = aView
    }
}

extension UIButton {
    
    func designButton(){
        
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.orange.cgColor
        self.clipsToBounds = true
    }
    
    func designButton2(){
        self.backgroundColor = .white
        self.tintColor = .orange
        self.layer.cornerRadius = 15.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.orange.cgColor
        self.clipsToBounds = true
    }
}

extension UIView {
    func makeCircular() {
        self.layer.cornerRadius = min(self.frame.size.height, self.frame.size.width) / 2.0
        self.clipsToBounds = true
    }
}

extension UILabel {
    /**
     This function adding image with text on label.

     - parameter text: The text to add
     - parameter image: The image to add
     - parameter imageBehindText: A boolean value that indicate if the imaga is behind text or not
     - parameter keepPreviousText: A boolean value that indicate if the function keep the actual text or not
     */
    func addTextWithImage(text: String, image: UIImage, imageBehindText: Bool, keepPreviousText: Bool) {
                    let lAttachment = NSTextAttachment()
        lAttachment.image = image

        // 1pt = 1.32px
        let lFontSize = round(self.font.pointSize * 1.32)
        let lRatio = image.size.width / image.size.height

        lAttachment.bounds = CGRect(x: 0, y: ((self.font.capHeight - lFontSize) / 2).rounded(), width: lRatio * lFontSize, height: lFontSize)

        let lAttachmentString = NSAttributedString(attachment: lAttachment)

        if imageBehindText {
            let lStrLabelText: NSMutableAttributedString

            if keepPreviousText, let lCurrentAttributedString = self.attributedText {
                lStrLabelText = NSMutableAttributedString(attributedString: lCurrentAttributedString)
                lStrLabelText.append(NSMutableAttributedString(string: text))
            } else {
                lStrLabelText = NSMutableAttributedString(string: text)
            }

            lStrLabelText.append(lAttachmentString)
            self.attributedText = lStrLabelText
        } else {
            let lStrLabelText: NSMutableAttributedString

            if keepPreviousText, let lCurrentAttributedString = self.attributedText {
                lStrLabelText = NSMutableAttributedString(attributedString: lCurrentAttributedString)
                lStrLabelText.append(NSMutableAttributedString(attributedString: lAttachmentString))
                lStrLabelText.append(NSMutableAttributedString(string: text))
            } else {
                lStrLabelText = NSMutableAttributedString(attributedString: lAttachmentString)
                lStrLabelText.append(NSMutableAttributedString(string: text))
            }

            self.attributedText = lStrLabelText
        }
    }

    func removeImage() {
        let text = self.text
        self.attributedText = nil
        self.text = text
    }
    
}

extension UITabBarController {
    /// Extends the size of the `UITabBarController` view frame, pushing the tab bar controller off screen.
    /// - Parameters:
    ///   - hidden: Hide or Show the `UITabBar`
    ///   - animated: Animate the change
    func setTabBarHidden(_ hidden: Bool, animated: Bool) {
        guard let vc = selectedViewController else { return }
        guard tabBarHidden != hidden else { return }
        
        let frame = self.tabBar.frame
        let height = frame.size.height
        let offsetY = hidden ? height : -height

        UIViewPropertyAnimator(duration: animated ? 0.3 : 0, curve: .easeOut) {
            self.tabBar.frame = self.tabBar.frame.offsetBy(dx: 0, dy: offsetY)
            self.selectedViewController?.view.frame = CGRect(
                x: 0,
                y: 0,
                width: vc.view.frame.width,
                height: vc.view.frame.height + offsetY
            )
            
            self.view.setNeedsDisplay()
            self.view.layoutIfNeeded()
        }
        .startAnimation()
    }
    
    /// Is the tab bar currently off the screen.
    private var tabBarHidden: Bool {
        tabBar.frame.origin.y >= UIScreen.main.bounds.height
    }
}

