//
//  Extensions.swift
//  Mani-Task
//
//  Created by Iman Zabihi on 08/01/2024.
//

import UIKit

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
