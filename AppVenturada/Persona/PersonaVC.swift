//
//  PersonaVC.swift
//  AppVenturada
//
//  Created by APPLE on 27/02/2020.
//  Copyright © 2020 Javier Roche. All rights reserved.
//

import UIKit

class PersonaVC: UIViewController, UITableViewDelegate, UITableViewDataSource, PersonaTVCellDelegate {
    var personas: [Persona] = []
    
    @IBOutlet weak var tabla: UITableView!
    
    //MARK: Ciclo de vida del PersonaVC
    //Esta funcion es lo primero que se ejecuta al cargarse una pantalla
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupData()
        self.setupUI()
        self.setupTablon()
    }
    
    /*Podriamos usar este evento para recargar la tabla de pantalla en vez de utilizar el Notification Center
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tabla.reloadData()
    }*/
    
    //MARK: Funciones
    func setupData() {
        //Carga de datos desde los JSON
        if let pathURL = Bundle.main.url(forResource: "personas", withExtension: "json") {
            do {
                let data = try Data.init(contentsOf: pathURL)
                let decoder = JSONDecoder()
                personas = try decoder.decode([Persona].self, from: data)
                tabla.reloadData()
            } catch {
                fatalError("No se puede leer el fichero JSON")
            }
        } else {
            fatalError("No se encuentra la ruta del archivo")
        }
    }
    
    func setupUI() {
        //Configuraremos el UITableView para que reconozca la clase de la celda
        let nib: UINib = UINib.init(nibName: "PersonaTVCell", bundle: nil)
        self.tabla.register(nib, forCellReuseIdentifier: "PersonaTVCell")
        
        //Test Equatable protocolo
        if (personas[0] == personas[1]) {
            print("Personas iguales\nAdherido a CustomStringConvertible \(personas[0].description)")
        } else {
           print("Personas diferentes\nAdherido a CustomStringConvertible \(personas[0].description)")
        }
    }
    
    //NotificationCenter para la notificacion de borrado de favoritos
    func setupTablon() {
        let notificacion = Notification.Name(rawValue: "cambioFavs")
        NotificationCenter.default.addObserver(self, selector: #selector(self.cambioFavs), name: notificacion, object: nil)
    }
    //Eliminar memoria retirando al observador viene bien de cara al rendimiento
    deinit {
        let notificacion = Notification.Name(rawValue: "cambioFavs")
        NotificationCenter.default.removeObserver(self, name: notificacion, object: nil)
    }
    
    
    //MARK: Delegados
    //Al tener esta clase acogida al protocolo de fijado de favoritos de la UIViewCell podemos enterarnos del evento
    //Ademas esta sujeta a Objetive C porque tambien la usa el Notification Center
    @objc func cambioFavs() {
        tabla.reloadData()
    }
    
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
        if let cell = tabla.dequeueReusableCell(withIdentifier: "PersonaTVCell", for: indexPath) as? PersonaTVCell {
            cell.setPersona(personas[indexPath.row])
            //Teniendo la clase asociada al protocolo delegado, podemos acceder al delegado y pintar los cambios en los corazones
            cell.delegado = self
            return cell
        }
        fatalError("No se pueden crear las celdas")
    }
}
