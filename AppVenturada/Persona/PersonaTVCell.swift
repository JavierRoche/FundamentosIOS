//
//  PersonaTVCell.swift
//  AppVenturada
//
//  Created by APPLE on 28/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

//La clase celda contiene un protocolo a disposicion de la UIView. Si una UIView se acoge a este protocolo podra ser informada de un evento
protocol PersonaTVCellDelegate: class {
    func cambioFavs()
}

class PersonaTVCell: UITableViewCell {
    @IBOutlet weak var foto: UIImageView!
    @IBOutlet weak var nombre: UILabel!
    @IBOutlet weak var edad: UILabel!
    @IBOutlet weak var mote: UILabel!
    @IBOutlet weak var corazon: UIButton!
    
    private weak var persona: Persona?
    //Definicion del delegado que utilizara una UIView para acceder al protocolo
    weak var delegado: PersonaTVCellDelegate?
    
    override func awakeFromNib() {
        foto.layer.cornerRadius = 8
        foto.layer.borderColor  = UIColor.white.withAlphaComponent(0.2).cgColor
        foto.layer.borderWidth  = 1.0
    }
    
    //MARK: Funciones
    func setPersona(_ persona: Persona) {
        //Siempre es util guardar el episodio para su utilizacion posterior
        self.persona = persona
        
        //Preguntamos a Singleton para fijar o no el corazon
        let corazonNomTipo: String = DataController.shared.isFav(persona) ? "heart.fill" : "heart"
        let corazonTipo = UIImage.init(systemName: corazonNomTipo)
        self.corazon.setImage(corazonTipo, for: .normal)
        
        //Fijamos el detalle de la persona en la nueva vista detalle
        if persona.imag == nil {
            foto.image = nil
        } else {
            foto.image = UIImage.init(named: persona.imag!)
        }
        nombre.text  = persona.nom
        edad.text = "\(persona.edad) años"
        mote.text = persona.mote
    }
    
    //MARK: IBActions
    @IBAction func corazonSet(_ sender: Any) {
        print("boton corazon favoriteAction")
        //Comprobamos si el episodio existe, si viene en la pulsacion del corazon de la celda
        if let persona = self.persona {
            if DataController.shared.isFav(persona) {
                DataController.shared.remFav(persona)
            } else {
                DataController.shared.addFav(persona)
            }
            delegado?.cambioFavs()
        }
    }
}
