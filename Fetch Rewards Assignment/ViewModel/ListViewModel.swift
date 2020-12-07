//
//  ListViewModel.swift
//  Fetch Rewards Assignment
//
//  Created by Latheeshwarraj Mohanraj on 12/7/20.
//  Copyright © 2020 Veg World. All rights reserved.
//

import Foundation
import Alamofire

class ListViewModel {
    typealias GetListDataCallback = (_ status:Bool, _ items:Items) -> Void
       
    var getListDataCallback:GetListDataCallback?
    
    func getListData(){
        Alamofire.request(Constants.LIST_DATA_URL,method: .get, parameters:nil).responseData { response in switch response.result {
            case .success(let data):
                switch response.response?.statusCode ?? -1 {
                    case 200:
                        let items: Items = try! JSONDecoder().decode(Items.self, from: data)
                        self.getListDataCallback?(true,items)
                        break
                    case 401:
                        self.getListDataCallback?(false,[])
                        break
                    default:
                        self.getListDataCallback?(false,[])
                        break
                }
            case .failure(_):
                self.getListDataCallback?(false,[])
                break
            }
        }
    }
    
    func getListDataCompletionHandler(callBack: @escaping GetListDataCallback) {
        self.getListDataCallback = callBack
    }
    
}
