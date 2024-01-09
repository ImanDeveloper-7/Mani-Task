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
        gradientLayer.frame = view.bounds

        setupGradientBackground()
        
        DispatchQueue.main.async {
            self.view_number1.applyGradient(cornerRadius: 15, colorHexArray: ["#2A153C", "#43375A"])
            self.view_number2.applyGradient(cornerRadius: 15, colorHexArray: ["#2A153C", "#43375A"])
            self.view_number3.applyGradient(cornerRadius: 15, colorHexArray: ["#2A153C", "#43375A"])
            
            self.view_copy.applyGradient(cornerRadius: 15, colorHexArray: ["#261239", "#601748"])
        }
        
        
        self.lbl_number1.makeCircularWithBackgroundColor(hexColor: "#E42268")
        self.lbl_number2.makeCircularWithBackgroundColor(hexColor: "#E42268")
        self.lbl_number3.makeCircularWithBackgroundColor(hexColor: "#E42268")
        
        self.btn_copy.layer.cornerRadius = 10
        self.btn_copy.addBorder(width: 2, color: UIColor(hex: "#01E0AD") ?? UIColor.white)
        
        
        
        self.view_time.backgroundColor = UIColor(hex: "#253B52") ?? UIColor.white
        self.view_time.layer.cornerRadius = 15
        self.view_time.layer.borderWidth = 1
        self.view_time.layer.borderColor = UIColor(hex: "#01E0AD")?.cgColor
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        if let gradientLayer = self.view_number1.layer.sublayers?.first(where: { $0 is CAGradientLayer }) as? CAGradientLayer {
//            gradientLayer.frame = self.view_number1.bounds
//                
//                if let shapeLayer = gradientLayer.mask as? CAShapeLayer {
//                    shapeLayer.path = UIBezierPath(rect: self.view_number1.bounds).cgPath
//                }
//            }
//    }
    
//    private func gradientColor() {
//        let topColor = UIColor(hex: "#2E133C") ?? UIColor.black
//        let bottomColor = UIColor(hex: "#E42268") ?? UIColor.red
//        
//        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.frame = view.bounds
//        self.view_number1.layer.insertSublayer(gradientLayer, at: 0)
//    }
    
    private func setupGradientBackground() {
        let topColor = UIColor(hex: "#2E133C") ?? UIColor.black
        let bottomColor = UIColor(hex: "#E42268") ?? UIColor.red
        
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @IBAction func copyButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func visitWesiteTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func reddemedButtonTapped(_ sender: UIButton) {
        
    }
}
