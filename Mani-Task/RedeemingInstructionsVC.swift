//
//  RedeemingInstructionsVC.swift
//  Mani-Task
//
//  Created by Iman Zabihi on 08/01/2024.
//

import UIKit

class RedeemingInstructionsVC: UIViewController {
    
    @IBOutlet weak var lbl_time: UILabel!
    @IBOutlet weak var lbl_number1: UILabel!
    @IBOutlet weak var btn_copy: UIButton!
    @IBOutlet weak var lbl_number2: UILabel!
    @IBOutlet weak var btn_visitWebsite: UIButton!
    @IBOutlet weak var lbl_number3: UILabel!
    @IBOutlet weak var btn_redeemed: UIButton!
    @IBOutlet weak var view_time: UIView!
    @IBOutlet weak var view_number1: UIView!
    @IBOutlet weak var view_number2: UIView!
    @IBOutlet weak var view_number3: UIView!
    @IBOutlet weak var view_copy: UIView!
    
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.gradientLayer.frame = self.view.bounds
            self.setupGradientBackground()
            self.setupUI()
        }
        
    }
    
    @IBAction func copyButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func visitWesiteTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func reddemedButtonTapped(_ sender: UIButton) {
        
    }
}



extension RedeemingInstructionsVC {
    private func setupGradientBackground() {
        let topColor = UIColor(hex: "#2E133C") ?? UIColor.black
        let bottomColor = UIColor(hex: "#601748") ?? UIColor.red
        
        self.gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        self.gradientLayer.locations = [0.85, 1.0]
        self.gradientLayer.frame = view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func setupUI() {
        self.view_number1.applyGradient(isVertical: false, cornerRadius: 15, colorHexArray: ["#2A153C", "#43375A"])
        self.view_number2.applyGradient(isVertical: false, cornerRadius: 15, colorHexArray: ["#2A153C", "#43375A"])
        self.view_number3.applyGradient(isVertical: false, cornerRadius: 15, colorHexArray: ["#2A153C", "#43375A"])
        
        let topColor = UIColor(hex: "#01E0AD") ?? UIColor.black
        let bottomColor = UIColor(hex: "#E001B5") ?? UIColor.red
        
        self.view_copy.applyGradient(isVertical: false, cornerRadius: 15, colorHexArray: ["#261239", "#601748"])
        self.view_copy.gradientBorder(colors: [topColor, bottomColor], isVertical: false, lineWidth: 2)
        
        self.btn_visitWebsite.layer.cornerRadius = 20
        self.btn_redeemed.layer.cornerRadius = 20
        
        self.lbl_number1.makeCircularWithBackgroundColor(hexColor: "#E42268")
        self.lbl_number2.makeCircularWithBackgroundColor(hexColor: "#E42268")
        self.lbl_number3.makeCircularWithBackgroundColor(hexColor: "#E42268")
        
        self.btn_copy.layer.cornerRadius = 12
        self.btn_copy.addBorder(width: 0.75, color: UIColor(hex: "#01E0AD") ?? UIColor.white)
        
        
        
        self.view_time.backgroundColor = UIColor(hex: "#253B52") ?? UIColor.white
        self.view_time.layer.cornerRadius = 15
        self.view_time.layer.borderWidth = 1
        self.view_time.layer.borderColor = UIColor(hex: "#01E0AD")?.cgColor
    }
}
