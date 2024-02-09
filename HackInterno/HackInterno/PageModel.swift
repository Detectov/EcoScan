//
//  PageModel.swift
//  EcoScan
//
//  Created by Daniel Moukarzel on 08/02/24.
//

import Foundation

struct Page: Identifiable{
    let id = UUID()
    var name: String
    var description: String
    var imageUrl: String
    var tag: Int
    
    
    static var slidePages: [Page] = [
        Page(name: "Transparencia en\ncada etiqueta!", description: "CONOCE LA SUSTENTABILIDAD DE TUS\nPRODUCTOS FAVORITOS Y APRENDE SOBRE\nSUS ALTERNATIVAS.", imageUrl: <#T##String#>, tag: 0),
        Page(name: "Convierte tus\nelecciones en\nbenefeficios", description: "ACUMULA PUNTOS Y DESBLOQUEA\nRECOMPENSAS ECO-AMIGABLES DISEÑADAS\nPARA CELEBRAR TU COMPROMISO POR UN\nESTILO DE VIDA MAS CONSCIENTE.", imageUrl: <#T##String#>, tag: 1),
        Page(name: "Descubre el poder\nde las palabras en\nnuestro chat", description: "INTERCAMBIA OPINIONES SOBRE\nPRODUCTOS, COMPARTE CONSEJOS Y EXPON\nTUS DUDAS SOBRE SUSTENTABILIDAD\nDENTRO DE UNA COMUNIDAD ECO-\nCONSCIENTE", imageUrl: <#T##String#>, tag: 2)
        
    ]
}
