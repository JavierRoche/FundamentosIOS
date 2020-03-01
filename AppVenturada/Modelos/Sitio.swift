//
//  Sitio.swift
//  AppVenturada
//
//  Created by APPLE on 27/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class Sitio: Codable, Equatable, CustomStringConvertible {
    var description: String {
        return "id: \(id) nom: \(nom) lat: \(lat) dir: \(dir) imag: \(imag ?? "") desc: \(desc)"
    }
    
    var id: Int
    var lat: String
    var nom: String
    var dir: String
    var imag: String?
    var desc: String
    
    init (id: Int, lat: String, nom: String, dir: String, imag: String?, desc: String) {
        self.id = id
        self.lat = lat
        self.nom = nom
        self.dir = dir
        self.imag = imag
        self.desc = desc
    }
    
    static func == (lhs: Sitio, rhs: Sitio) -> Bool {
        return lhs.id == rhs.id
    }
}
