//
//  LabelAppearance.swift
//  MyDestinations
//
//  Created by Ivan Barisic on 21/05/2020.
//  Copyright © 2020 Ivan Barisic. All rights reserved.
//

import UIKit

// MARK: - Protocol
protocol LabelAppearanceProtocol {
    var font: UIFont {get set}
    var backgroundColor: UIColor {get set}
    var textColor: UIColor {get set}
    var cornerRadius: CGFloat {get set}
}

// MARK: - Struct
struct TitleLabelAppearnce: LabelAppearanceProtocol {
    var font: UIFont = UIFont.systemFont(ofSize: 20)
    
    var backgroundColor: UIColor = UIColor.white
    
    var textColor: UIColor = UIColor.black
    
    var cornerRadius: CGFloat = 20
}

struct SubtitleLabelAppearnce: LabelAppearanceProtocol {
    var font: UIFont = UIFont.systemFont(ofSize: 16)
    
    var backgroundColor: UIColor = UIColor.white
    
    var textColor: UIColor = UIColor.gray
    
    var cornerRadius: CGFloat = 20
}

// MARK: - Label extension
extension UILabel {
    func setAppearance(appearance: LabelAppearanceProtocol) {
        self.font = appearance.font
        self.backgroundColor = appearance.backgroundColor
        self.textColor = appearance.textColor
        self.layer.cornerRadius = appearance.cornerRadius
    }
}
