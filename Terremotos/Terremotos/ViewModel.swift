//
//  ViewModel.swift
//  Terremotos
//
//  Created by  on 08/02/2021.
//

import SwiftUI
import SwiftyJSON
import Alamofire
import SwiftyXMLParser

class ViewModel: ObservableObject {
    @Published var terremotos: [terremotosData]
    init(terremotos: [terremotosData]) {
        self.terremotos: [terremotosData]
    }
    
    
}

let url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson"

func cargarDatos(){
    print("Inicio")
    AF.request(url, method: .get).validate().responseJSON { response in
        switch response.result {
        case .success(let value):
            //let json = JSON(value)
            //print("JSON: \(data)")
            let data = JSON(value)
            let ciudadJSON = data["place"].arrayValue
            for ciudadJSON in ciudadJSON{
                print(ciudadJSON)
            }
        case .failure(let error):
           print(error)
        }
    }
    print("Fin")
    
    
}

struct terremotosData {
    var ciudad: String
    var url: String
    var hora: CLongLong
    var tipo: String
    var magnitud: Decimal
    var latitud: Decimal
    var longitud: Decimal
    var tsunami: Int
    var profundidad: Decimal
    init( ciudad: String, url: String,hora: CLongLong,tipo: String,magnitud: Decimal,latitud: Decimal,longitud: Decimal,tsunami: Int,profundidad: Decimal) {
        self.ciudad = ciudad
        self.url = url
        self.hora = hora
        self.tipo = tipo
        self.magnitud = magnitud
        self.latitud = latitud
        self.longitud = longitud
        self.tsunami = tsunami
        self.profundidad = profundidad
    }
}
