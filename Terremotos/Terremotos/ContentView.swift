//
//  ContentView.swift
//  Terremotos
//
//  Created by  on 05/02/2021.
//

import SwiftUI
import SwiftyJSON
import Alamofire
import SwiftyXMLParser



struct ContentView: View {
    
    @ObservedObject var vm = ViewModel()
    
    var body: some View {
        
        Text(vm.ciudad)
            .padding()
        
            
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}

