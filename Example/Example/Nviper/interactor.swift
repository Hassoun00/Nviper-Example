//
//  interactor.swift
//  Example
//
//  Created by hassoun on 24/04/2022.
//

import Foundation

protocol AnyInteractor {
    var presenter: AnyPresenter? { get set }
    func getUsers()
}

class UserInteractor: AnyInteractor {
    
    var presenter: AnyPresenter?
    func getUsers() {
         print("Feching")
        guard let url = URL(string: " https://app.zeplin.io/project/6264407895ba8e1349b44a00") else {return}
             
        let task = URLSession.shared.dataTask(with: url) { [weak  self] data, _,error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
        
            }
            
            do{
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactorDidFetchUsers(with: .success(entities))
            }
            catch{
                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
         
            }
        
        }
        
            task.resume()
        
    }
   
}
 


