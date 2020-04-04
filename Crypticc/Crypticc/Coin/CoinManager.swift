//
//  CoinManager.swift
//  Crypticc
//
//  Created by Squiretoss on 2.04.2020.
//  Copyright © 2020 Oguz Demirhan. All rights reserved.
//

import Foundation

class CoinManager {
    
    
    
    func getRequest(url:String,completionHandler : @escaping (CryptoCurrencyItem) -> Void){
        guard let url = URL(string: url) else{return}
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, err) in
            guard let data = data else{return}
            do {
                let decoder = try JSONDecoder().decode(CryptoCurrencyItem.self, from: data)
                
                completionHandler(decoder)
                print(decoder.data.coins[0].name)
            } catch  {
                print(error)
            }
        }.resume()
    }
    

    
}
