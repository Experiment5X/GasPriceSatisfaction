//
//  GasStation.swift
//  GasPriceSatisfaction
//
//  Created by Adam Spindler on 6/4/14.
//  Copyright (c) 2014 expletek. All rights reserved.
//

import Foundation

class GasStation
{
    let priceRegular: String = ""
    let pricePlus: String = ""
    let pricePremium: String = ""
    let priceDiesel: String = ""
    let brand: String = ""
    let address: String = ""
    
    init(jsonData: NSDictionary)
    {
        if let regularPrice: AnyObject = jsonData["regular"]
        {
            self.priceRegular = "\(regularPrice)"
        }
        if let plusPrice: AnyObject = jsonData["plus"]
        {
            self.pricePlus = "\(plusPrice)"
        }
        if let premiumPrice: AnyObject = jsonData["premium"]
        {
            self.pricePremium = "\(premiumPrice)"
        }
        if let deiselPrice: AnyObject = jsonData["diesel"]
        {
            self.priceDiesel = "\(deiselPrice)"
        }
        if let br: AnyObject = jsonData["brand"]
        {
            self.brand = "\(br)"
        }
        if let addr: AnyObject = jsonData["address"]
        {
            self.address = "\(addr)"
        }
    }
}