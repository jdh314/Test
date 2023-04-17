//
//  SearchViewModel.swift
//  Test
//
//  Created by Jonathan Hogue on 4/17/23.
//

import Foundation

final class SearchViewModel: NSObject, ObservableObject {
    
    @Published var responseSearchRequestData: CityStruct?
    @Published var searchRequestText: String?
    
    
    var returnData: Data?
    
    
    
    
    let searchURL = "http://api.weatherapi.com/v1/search.json?key=7c145ce76f2549af8b4144902210511&q="
    
    
    func getWeatherAPISearchResponse() {
        guard let checkedSearchRequestText = searchRequestText else {return}
        guard let searchURL = URL(string: searchURL + checkedSearchRequestText) else {return}
        
        let dataTask = URLSession.shared.dataTask(with: searchURL) {data, response,
            error in
            if let error = error {
                print("Request error: \(error)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {return}
            self.returnData = data
            
            switch response.statusCode {
            case 200...299:
                guard let returnData = data else {return}
                DispatchQueue.main.async {
                    do {
                        self.responseSearchRequestData = try JSONDecoder().decode(CityStruct.self, from: returnData)
                    } catch let error {
                        print("Error decoding: \(error)")
                    }
                }
                //print("HTTP response code \(response.statusCode) returned")
            case 300...399:
                print("HTTP response code 3xx returned")
                
            case 400...499:
                print("something not found, HTTP reponse code 4xx returned")
                
            default:
                print("default in switch statment reached... hm")
            }
            
        }
        
        
    }
    
}
