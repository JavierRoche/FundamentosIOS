//
//  Persona.swift
//  AppVenturada
//
//  Created by APPLE on 28/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class Persona: Codable, Equatable, CustomStringConvertible {
    var description: String {
        return "id: \(id) nom: \(nom), mote: \(mote), edad: \(edad) lat: \(lat) imag: \(imag ?? "") desc: \(desc)"
    }
    
    var id: Int
    var nom: String
    var mote: String
    var edad: Int
    var lat: String
    var imag: String?
    var desc: String
    
    init (id: Int, nom: String, mote: String, edad: Int, lat: String, imag: String?, desc: String) {
        self.id = id
        self.nom = nom
        self.mote = mote
        self.edad = edad
        self.lat = lat
        self.imag = imag
        self.desc = desc
    }
    
    static func == (lhs: Persona, rhs: Persona) -> Bool {
        return lhs.id == rhs.id
    }
}

