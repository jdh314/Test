//
//  SearchView.swift
//  Test
//
//  Created by Jonathan Hogue on 4/16/23.
//

import SwiftUI


struct SearchView: View {
    
    @State var textFieldBindingString: String  = ""
    @StateObject var searchViewModel = SearchViewModel()
    
    
    var body: some View {
        Spacer()
            .frame(height: 30)
        HStack {
            Spacer()
            TextField("City Name or Zip Code", text: $textFieldBindingString)
                .foregroundColor(Color.gray)
                .frame(width: 200)
            Spacer()
        }
        Text(textFieldBindingString)
            .foregroundColor(Color.orange)
        Spacer()
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
