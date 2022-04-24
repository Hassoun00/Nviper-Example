//
//  presenter.swift
//  Example
//
//  Created by hassoun on 24/04/2022.
//

import Foundation

enum FetchError: Error {
    case failed
}
protocol AnyPresenter {
    var router: AnyPresenter? {get set}
    var interactor: AnyInteractor? {get set}
    var view: AnyView? {get set}
    
    func interactorDidFetchUsers(with result: Result<[User], Error>)
    }
    
    

class UserPresenter: AnyPresenter{
    var router: AnyPresenter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
         
    }
    
    
    
    
    }

     
     
    
    
var router: AnyPresenter?

var interactor: AnyInteractor?

    func didSet()  {
        interactor?.getUsers()
       }



var view: AnyView?

        
        func interactorDidFetchUsers(with result: Result<[User], Error>){
            switch result{
            case .success(let users):
                view?.update(with: users)
                
            case .failure:
                view?.update(with: "Somthing wrong")
                 
            }
    

    }






