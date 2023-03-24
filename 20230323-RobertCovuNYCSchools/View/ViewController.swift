//
//  ViewController.swift
//  20230323-RobertCovuNYCSchools
//
//  Created by Robert Covu on 3/22/23.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    lazy var highSchoolTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.reuseId)
        return table
    }()
    
    let viewModel: UserAccess = ViewControllerModel()

    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        self.setUpUI()
        super.viewDidLoad()
        
        cancellable = viewModel.schoolListPublisher
            .receive(on: OperationQueue.main)
            .sink { [weak self] in
                self?.highSchoolTableView.reloadData()
            }
    }
    
    private func setUpUI() {
        self.title = "New York Schools"
        self.view.addSubview(self.highSchoolTableView)
        self.highSchoolTableView.bindOnView(insets: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfSchools()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.reuseId, for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.hsName.text = self.viewModel.schoolName(index: indexPath.row)
    
        return cell
    }
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let presentData = PresentingData()
        let schoolInfo = self.viewModel.schoolInfo(index: indexPath.row)
        guard let dbn = schoolInfo.dbn else {
            return
        }
        guard let schoolname = schoolInfo.schoolName else {
            return
        }
        guard let numofTestTakers = schoolInfo.numOfSatTestTakers else {
            return
        }
        guard let avgReadingScore = schoolInfo.satCriticalReadingAvgScore else {
            return
        }
        guard let avgMathScore = schoolInfo.satMathAvgScore else {
            return
        }
        guard let avgWritingScore = schoolInfo.satWritingAvgScore else {
            return
        }
        
        presentData.dbnLabel.text = "School DBN number: " + dbn
        presentData.schoolNameLabel.text = schoolname
        presentData.numofTestTakerLabel.text = "Number of SAT Takers: " + numofTestTakers
        presentData.readingScoreAvgLabel.text = "Average Reading Scores: " + avgReadingScore
        presentData.mathScoreAvgLabel.text = "Average Math Scores: " + avgMathScore
        presentData.writingScoreAvgLabel.text = "Average Writing Scores: " + avgWritingScore
        
        self.navigationController?.pushViewController(presentData, animated: true)
                
    }
}
