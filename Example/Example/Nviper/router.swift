//
//  router.swift
//  Example
//
//  Created by hassoun on 24/04/2022.
//

import Foundation
import UIKit
 
typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? {get}
    
    static func strat() -> AnyRouter
}
class UserRouter: AnyRouter, AnyPresenter  {
    var router: AnyPresenter?
    
    var interactor: AnyInteractor?
    
    var view: AnyView?
    
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
    
    }
    
     
      var entry: EntryPoint?
    static func strat() -> AnyRouter {
      let router = UserRouter()
   
    
     
        
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router =  router
        presenter.view = view
        presenter.interactor = interactor
       
         router.entry = view as? EntryPoint
         
          return router
         
    }
}
