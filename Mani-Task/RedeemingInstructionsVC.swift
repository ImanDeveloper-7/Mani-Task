//
//  RedeemingInstructionsVC.swift
//  Mani-Task
//
//  Created by Iman Zabihi on 08/01/2024.
//

import UIKit

class RedeemingInstructionsVC: UIViewController {
    
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
}
