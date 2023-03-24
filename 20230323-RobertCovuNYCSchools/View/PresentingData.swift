//
//  PresentingData.swift
//  20230323-RobertCovuNYCSchools
//
//  Created by Robert Covu on 3/22/23.
//

import UIKit

class PresentingData: UIViewController {
    
    lazy var dbnLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var schoolNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var numofTestTakerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var readingScoreAvgLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var mathScoreAvgLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    lazy var writingScoreAvgLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(15)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupUI()

        // Do any additional setup after loading the view.
    }
    
    func setupUI(){
        self.view.addSubview(self.dbnLabel)
        self.view.addSubview(self.schoolNameLabel)
        self.view.addSubview(self.numofTestTakerLabel)
        self.view.addSubview(self.readingScoreAvgLabel)
        self.view.addSubview(self.mathScoreAvgLabel)
        self.view.addSubview(self.writingScoreAvgLabel)
        
        self.schoolNameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        self.schoolNameLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.schoolNameLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        self.schoolNameLabel.bottomAnchor.constraint(equalTo: self.dbnLabel.topAnchor, constant: -10).isActive = true
        
        self.dbnLabel.topAnchor.constraint(equalTo: self.schoolNameLabel.bottomAnchor, constant: 10).isActive = true
        self.dbnLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.dbnLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        self.dbnLabel.bottomAnchor.constraint(equalTo: self.numofTestTakerLabel.topAnchor, constant: -10).isActive = true
        
        self.numofTestTakerLabel.topAnchor.constraint(equalTo: self.dbnLabel.bottomAnchor, constant: 10).isActive = true
        self.numofTestTakerLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.numofTestTakerLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        self.numofTestTakerLabel.bottomAnchor.constraint(equalTo: self.readingScoreAvgLabel.topAnchor, constant: -10).isActive = true
        
        self.readingScoreAvgLabel.topAnchor.constraint(equalTo: self.numofTestTakerLabel.bottomAnchor, constant: 10).isActive = true
        self.readingScoreAvgLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.readingScoreAvgLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        self.readingScoreAvgLabel.bottomAnchor.constraint(equalTo: self.mathScoreAvgLabel.topAnchor, constant: -10).isActive = true
        self.mathScoreAvgLabel.topAnchor.constraint(equalTo: self.readingScoreAvgLabel.bottomAnchor, constant: 10).isActive = true
        self.mathScoreAvgLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.mathScoreAvgLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        self.mathScoreAvgLabel.bottomAnchor.constraint(equalTo: self.writingScoreAvgLabel.topAnchor, constant: -10).isActive = true
        self.writingScoreAvgLabel.topAnchor.constraint(equalTo: self.mathScoreAvgLabel.bottomAnchor, constant: 10).isActive = true
        self.writingScoreAvgLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        self.writingScoreAvgLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        
    }
    

    

}
