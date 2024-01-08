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
    
    let gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientLayer.frame = view.bounds

        setupGradientBackground()
        
        
        
    }
    
    private func setupGradientBackground() {
        let topColor = UIColor(hex: "#2E133C") ?? UIColor.black // Fallback to black if hex conversion fails
        let bottomColor = UIColor(hex: "#E42268") ?? UIColor.red // Fallback to red if hex conversion fails
        
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
