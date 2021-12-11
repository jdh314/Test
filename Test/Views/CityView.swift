//
//  CityView.swift
//  Test
//
//  Created by Jonathan Hogue on 11/24/21.
//

import SwiftUI

struct CityView: View {
    
    var cityName: String?
    
    func isCityNameEmpty(cityName: String?) -> String {
        guard let checkedName = cityName else { return "--" }
        return checkedName
    }
    
    var body: some View {
        Text(isCityNameEmpty(cityName:cityName))
            .font(.system(size: 32, weight: .medium))
            .foregroundColor(.white)
            .padding(.top, 15)
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        CityView(cityName: "Rochester")
    }
}
