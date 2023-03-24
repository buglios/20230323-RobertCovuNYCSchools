//
//  TableViewCell.swift
//  20230323-RobertCovuNYCSchools
//
//  Created by Robert Covu on 3/22/23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let reuseId = "\(TableViewCell.self)"
    
    lazy var hsName: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(18)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUpUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpUI() {
        let stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        stackView.addArrangedSubview(self.hsName)
        
        self.contentView.addSubview(stackView)
        stackView.bindOnView(insets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    override func prepareForReuse() {
        self.hsName.text = nil
    }

}



