//
//  SettingsVC.swift
//  AppVenturada
//
//  Created by APPLE on 27/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //Llamamos al DataController para vaciar la lista de favoritos
    @IBAction func vaciaFavs() {
        DataController.shared.eraseFavs()
        
        //La ventana de Favoritos se actualiza porque cada vez que se muestra se repinta, pero la de Personas no. Para ello creamos una notificacion del sistema, que dejara una notificacion cuando se vacien los favoritos, de tal forma que la ventana Persona repinte, tal y como hace cuando hay un cambio en los corazones de su misma ventana
        let noteName = Notification.Name(rawValue: "cambioFavs")
        NotificationCenter.default.post(name: noteName, object: nil)
    }
    
}
