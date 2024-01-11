//
//  Extensions.swift
//  Mani-Task
//
//  Created by Iman Zabihi on 08/01/2024.
//

import UIKit

extension UIButton {
    
    func addBorder(width: CGFloat, color: UIColor) {
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}

extension UILabel {
    func setCustomFont(fontName: String, size: CGFloat) {
        guard let customFont = UIFont(name: fontName, size: size) else {
            fatalError("Failed to load the \(fontName) font.")
        }
        self.font = customFont
    }
}

extension UILabel {
    
    func makeCircularWithBackgroundColor(hexColor: String) {
        // The number of lines is set to 1 for a proper circle
        self.numberOfLines = 1
        
        // Change the text alignment to center
        self.textAlignment = .center
        
        // Set the background color using the hex color provided
        self.backgroundColor = UIColor(hex: hexColor)
        
        // Set the layer's cornerRadius to half of the shorter side of the label
        // to make it a perfect circle
        self.layer.cornerRadius = min(self.bounds.size.width, self.bounds.size.height) / 2
        
        // Enable masks to bounds so that the corners are clipped to a circle
        self.layer.masksToBounds = true
    }
}

import UIKit

// Extension to convert hex string to UIColor
extension UIColor {
    convenience init?(hex: String) {
        let r, g, b, a: CGFloat
        
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            if hexColor.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
                    g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
                    b = CGFloat(hexNumber & 0x0000ff) / 255
                    a = 1.0
                    
                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}

// Extension to add gradient background and corner radius to UIView
extension UIView {
    
    func applyGradient(isVertical: Bool, cornerRadius: CGFloat, colorHexArray: [String]) {
        self.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer }) // Remove existing gradient layers
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colorHexArray.compactMap { UIColor(hex: $0)?.cgColor }
        gradientLayer.locations = [0.0, 1.0] // Start and end points of the gradient
        gradientLayer.cornerRadius = cornerRadius
        
        
        
        if(isVertical){
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        }
        else {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        }
        
        // Ensure the corner radius is masked
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        
        self.layer.insertSublayer(gradientLayer, at: 0) // Insert at the bottom of all sublayers
    }
    
}

extension UIView {
    func gradientBorder(colors: [UIColor], isVertical: Bool, lineWidth: CGFloat){
        self.layer.masksToBounds = true
        
        //Create gradient layer
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(origin: CGPoint.zero, size: self.bounds.size)
        gradient.colors = colors.map({ (color) -> CGColor in
            color.cgColor
        })

        //Set gradient direction
        if(isVertical){
            gradient.startPoint = CGPoint(x: 0.5, y: 0)
            gradient.endPoint = CGPoint(x: 0.5, y: 1)
        }
        else {
            gradient.startPoint = CGPoint(x: 0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1, y: 0.5)
        }

        //Create shape layer
        let shape = CAShapeLayer()
        shape.lineWidth = lineWidth
        shape.path = UIBezierPath(roundedRect: gradient.frame.insetBy(dx: 1, dy: 1), cornerRadius: self.layer.cornerRadius).cgPath
        shape.strokeColor = UIColor.black.cgColor
        shape.fillColor = UIColor.clear.cgColor
        gradient.mask = shape

        //Add layer to view
        self.layer.addSublayer(gradient)
        gradient.zPosition = 0
    }
}
