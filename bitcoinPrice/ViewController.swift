//
//  ViewController.swift
//  bitcoinPrice
//
//  Created by taiki on 2019/02/05.
//  Copyright © 2019 taiki. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
//    let url = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC"
    let url = "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCJPY"
    override func viewDidLoad() {
        super.viewDidLoad()
        getBitcoinPrice(url: url)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getBitcoinPrice(url: String){
        
        Alamofire.request(url, method: .get).responseJSON { (response) in
            if response.result.isSuccess{
                print("Got Biitcoin Price!!")
                let bitcoinJSON = JSON(response.result.value)
                print(bitcoinJSON)
                self.priceLabel.text = bitcoinJSON["ask"].stringValue
            }else{
                print("error")
            }
        }
        
        
    }


}

