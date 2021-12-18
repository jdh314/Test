//
//  CityView.swift
//  Test
//
//  Created by Jonathan Hogue on 11/24/21.
//

import SwiftUI

struct CityView: View {
    
    var cityName: String?
    var dynamicTypeSize: DynamicTypeSize
    
    func isCityNameEmpty(cityName: String?) -> String {
        guard let checkedName = cityName else { return "--" }
        return checkedName
    }
    
    var body: some View {
        if dynamicTypeSize >= .accessibility2 {
            Text(isCityNameEmpty(cityName:cityName))
                .font(.system(size: 60, weight: .medium))
                .foregroundColor(.white)
                .padding(.top, 15)
        } else {
            Text(isCityNameEmpty(cityName:cityName))
                .font(.system(size: 35, weight: .medium))
                .foregroundColor(.white)
                .padding(.top, 15)
            
        }
        
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(cityName: "Rochester", dynamicTypeSize: .accessibility2)
    }
}
