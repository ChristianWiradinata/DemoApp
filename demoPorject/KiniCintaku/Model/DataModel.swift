//
//  PaymentModel.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 01/04/22.
//

import Foundation

class DataModel{
    let title: String
    let footer: String
    var extendedModel: [ExtendedModel]?
    var isExpand: Bool = false
    
    init(title: String,
         footer: String,
         extendedModel: [ExtendedModel],
         isExpand: Bool = false
    ) {
        self.title = title
        self.footer = footer
        self.extendedModel = extendedModel
        self.isExpand = isExpand
    }
}

class ExtendedModel {
    let title: String
    let subTitle: String
    var status: Bool = false
    
    init(title: String,
         subTitle: String,
         status: Bool = false
    ) {
        self.title = title
        self.subTitle = subTitle
        self.status = status
    }
}
