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

extension UIView {
    
    func applyGradientBorder(colors: [UIColor], width: CGFloat) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.lineWidth = width
        shapeLayer.path = UIBezierPath(rect: bounds).cgPath
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.black.cgColor
        gradientLayer.mask = shapeLayer
        
        layer.addSublayer(gradientLayer)
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

extension UIView {

    func applyTagSpecificStyles() {
        switch self.tag {
        case 1:
            self.layer.cornerRadius = 10 // Replace with the desired corner radius
            self.backgroundColor = UIColor(hex: "#2E133C") // Replace with the desired hex color code
        case 2:
            self.layer.cornerRadius = 15 // Replace with the desired corner radius
            self.backgroundColor = UIColor(hex: "#A01150") // Replace with the desired hex color code
        case 3:
            self.layer.cornerRadius = 20 // Replace with the desired corner radius
            self.backgroundColor = UIColor(hex: "#750F47") // Replace with the desired hex color code
        default:
            break
        }
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
    
    func applyGradient(cornerRadius: CGFloat, colorHexArray: [String]) {
        self.layer.sublayers?.removeAll(where: { $0 is CAGradientLayer }) // Remove existing gradient layers
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colorHexArray.compactMap { UIColor(hex: $0)?.cgColor }
        gradientLayer.locations = [0.0, 1.0] // Start and end points of the gradient
        gradientLayer.cornerRadius = cornerRadius
        
        // Ensure the corner radius is masked
        self.layer.cornerRadius = cornerRadius
        self.layer.masksToBounds = true
        
        self.layer.insertSublayer(gradientLayer, at: 0) // Insert at the bottom of all sublayers
    }
    
}

