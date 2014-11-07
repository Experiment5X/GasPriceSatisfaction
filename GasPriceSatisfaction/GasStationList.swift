//
//  GasStationList.swift
//  GasPriceSatisfaction
//
//  Created by Adam Spindler on 6/4/14.
//  Copyright (c) 2014 expletek. All rights reserved.
//

import Foundation

class GasStationList
{
    let zipCode: String
    var gasStations: [GasStation] = []
    
    init(zipCode: String)
    {
        self.zipCode = zipCode
    }
    
    func fetchList() -> Bool
    {
        // read the data from the api
        let response = NSData(contentsOfURL: self.getUrl())
        let seralizedResponse = NSJSONSerialization.JSONObjectWithData(response!, options: nil, error: nil) as NSDictionary
        
        // clear any old gas stations that may have been there before
        self.gasStations = []

        // iterate through all of the stations in the list
        for stationData: AnyObject in (seralizedResponse["item"] as NSArray)
        {
            self.gasStations.append(GasStation(jsonData: stationData as NSDictionary))
        }
        
        return false
    }
    
    func getUrl() -> NSURL
    {
        return NSURL(string: ("http://www.mshd.net/api/gasprices?zip=" + self.zipCode + "&output=json"))!
    }
}