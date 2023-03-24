//
//  ViewControllerModel.swift
//  20230323-RobertCovuNYCSchools
//
//  Created by Robert Covu on 3/22/23.
//

import Foundation
import UIKit
import Combine

protocol UserAccess{
    
    var schoolList: School { get }
    var schoolListPublisher: PassthroughSubject<Void, Never> { get }
    func fetchSchools() -> School
    func numberOfSchools() -> Int
    func schoolName(index: Int) -> String
    func schoolInfo(index: Int) -> Schools
}

class ViewControllerModel {
    
    var schoolList: School
    let schoolListPublisher = PassthroughSubject<Void, Never>()
    
    let network: DataFetcher
    
    init(list: School = [], network: DataFetcher = NetworkManager()){
        self.network = network
        self.schoolList = list
        self.network.fetchHighSchoolList(url: APIEndpoint.SchoolList.url){
            [weak self] (result: Result<School, Error>) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let list):
                
                self.schoolList = list
                self.schoolListPublisher.send(())
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewControllerModel: UserAccess{
    
      
    func fetchSchools() -> School{
        return self.schoolList
    }
    
    func numberOfSchools() -> Int{
        return self.schoolList.count
    }
   
    func schoolName(index: Int) -> String{
        guard let schoolName = self.schoolList[index].schoolName else{
            return "Does Not Exist"
        }
        return schoolName
    }
    
    func schoolInfo(index: Int) -> Schools{
        return self.schoolList[index]
    }
}
