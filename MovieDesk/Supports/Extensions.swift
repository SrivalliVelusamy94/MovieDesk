//
//  Extensions.swift
//  MovieDesk
//
//  Created by Srivalli Velusamy on 12/06/21.
//

import UIKit

extension Sequence {
    func limit(_ max: Int) -> [Element] {
        return self.enumerated()
            .filter { $0.offset < max }
            .map { $0.element }
    }
}

extension UIImageView {
    func setCorner() {
        self.layer.borderWidth = 2.0
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 10
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
}
