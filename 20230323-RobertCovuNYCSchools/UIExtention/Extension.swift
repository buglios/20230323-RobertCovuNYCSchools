//
//  Extension.swift
//  20230323-RobertCovuNYCSchools
//  Created by Robert Covu on 3/22/23.
//

import Foundation
import UIKit

extension UIView {
    
    func bindOnView(insets: UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)) {
        
        guard let superView = self.superview else {
            fatalError("No view hierarchy")
        }
        
        self.topAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.topAnchor, constant: insets.top).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.leadingAnchor, constant: insets.left).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.trailingAnchor, constant: -insets.right).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom).isActive = true
        
    }
    
}
