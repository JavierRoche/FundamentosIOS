//
//  FavoritoVC.swift
//  AppVenturada
//
//  Created by APPLE on 27/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class FavoritoVC: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    var personas: [Persona] = []
    
    @IBOutlet weak var tabla: UITableView!
    
    //MARK: Ciclo de vida del FavoritoVC
    //Esta funcion es lo primero que se ejecuta al cargarse una pantalla
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setupData()
        tabla.reloadData()
    }

    //MARK: Funciones
    func setupData() {
        //Carga de datos desde los JSON
        if let pathURL = Bundle.main.url(forResource: "personas", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                personas = try decoder.decode([Persona].self, from: data)
            } catch {
                fatalError("No se puede leer el fichero JSON")
            }
        } else {
            fatalError("No se encuentra la ruta del archivo")
        }
        
        //Algoritmo para dejar la tabla que se carga con los favoritos correctos
        var personasFav: [Persona] = []
        for sujeto in personas {
            //Como nuestra lista inicial se carga con todo comprobamos 1 por 1
            //Si es favorito pasa a la lista definitica que sera la que se cargara
            if DataController.shared.isFav(sujeto) == true {
                personasFav.append(sujeto)
            }
        }
        personas = personasFav
    }
    
    func setupUI() {
        //Configuraremos el UITableView para que reconozca la clase de la celda
        let nib: UINib = UINib.init(nibName: "PersonaTVCell", bundle: nil)
        self.tabla.register(nib, forCellReuseIdentifier: "PersonaTVCell")
    }
    
    
    //MARK: Delegados
    //MARK: - UITableViewDelegate
    //Se ejecuta al pulsar en una celda
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let persona = personas[indexPath.row]
        let detalle = PersonaVCDetalle.init(persona)
        self.navigationController?.pushViewController(detalle, animated: true)
        tabla.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    //MARK: - UITableViewDatasource
    //Numero de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Numero de filas en la seccion
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return personas.count
    }
    
    //Las celdas reusables se van llenando con los sitios del array de sitios
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Obligamos a que la celda sea del nuestro tipo celda
        print("crea celdas-FavoritoVC")
        if let cell = tabla.dequeueReusableCell(withIdentifier: "PersonaTVCell", for: indexPath) as? PersonaTVCell {
            cell.setPersona(personas[indexPath.row])
            cell.corazon.isEnabled = false
            cell.corazon.setImage(UIImage.init(systemName: "heart.fill"), for: .normal)
            return cell
        }
        fatalError("No se pueden crear las celdas")
    }
}

