//
//  DataController.swift
//  AppVenturada
//
//  Created by APPLE on 27/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import Foundation

//El protocolo nos permitira identificar a cada id
/*protocol Identifiable {
    var id: Int { get }
}*/

class DataController {
    //Esta clase contiene un array de id's, correspondientes a las personas que se incluyan en la lista de favoritas
    private var favs: [Int] = []
    //Contiene el objeto que guarda la informacion global
    static let shared = DataController()
    //Con llamar al inicializador vacio se vacia el array
    private init() {}
    
    //MARK: Funciones
    //Reciben un identificador de persona y comprueban/añaden/eliminan del array, utilizando el protocolo de identificacion, el elemento correcto
    
    func isFav(_ persona: Persona) -> Bool {
        return favs.contains(persona.id)
    }
    func addFav(_ persona: Persona) {
        if self.isFav(persona) == false {
            favs.append(persona.id)
        }
    }
    func remFav(_ persona: Persona) {
        if let ind = favs.firstIndex(of: persona.id) {
            favs.remove(at: ind)
        }
    }
    func eraseFavs() {
        favs = []
    }
}
