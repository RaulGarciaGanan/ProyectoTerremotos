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
    @Published var terremotos = [terremotosData]()
    init() {
        cargarDatos()
        
    }
    
    func cargarDatos(){
        AF.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                //let json = JSON(value)
                //print("JSON: \(data)")
            
                self.terremotos = []
                
                let data = JSON(value)
                for feature in data["features"].arrayValue{
                    let place = feature["properties"]["place"].stringValue
                    let magnitud = feature["properties"]["mag"].doubleValue
                    let terremoto: terremotosData = terremotosData(ciudad: place, magnitud: magnitud)
                    self.terremotos.append(terremoto)
                    
                }
                
                //for ciudadJSON in ciudadJSON{
                //  print(ciudadJSON)
                //}
                //self.terremotos.append(ciudadJSON)
                //terremotos[0] = data["place"].arrayValue
            case .failure(let error):
               print(error)
            }
        }
    }
}

let url = "https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson"


/*
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
}*/

struct terremotosData {
    var ciudad: String
    var magnitud: Double
}
