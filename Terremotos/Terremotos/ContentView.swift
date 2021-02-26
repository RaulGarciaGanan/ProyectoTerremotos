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
        
        VStack {
            
            GroupBox(label: Text("Terremoto1")) {
                //
                if(vm.terremotos.count > 0) {
                Text(vm.terremotos[0].ciudad)
                    Text(String(vm.terremotos[0].magnitud))
                }
            }
            
            
        }.onAppear(perform: {
            vm.cargarDatos()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
        
    }
}
