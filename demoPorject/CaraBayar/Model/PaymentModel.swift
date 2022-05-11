//
//  Model.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 31/03/22.
//

import Foundation

class PaymentModel {
    let Image: String
    let Name: String
    let CodeBank: String
    let CodeBank_EXP: String
    let PaymentMethod: [Method]
    
    init(
        Image: String,
        Name: String,
        CodeBank: String,
        CodeBank_EXP: String,
        PaymentMethod: [Method]
    ) {
        self.Image = Image
        self.Name = Name
        self.CodeBank = CodeBank
        self.CodeBank_EXP = CodeBank_EXP
        self.PaymentMethod = PaymentMethod
    }
}

class Method {
    let Jenis: String
    let Deskripsi: [String]
    var isActive: Bool = false
    
    init(
        Jenis: String,
        Deskripsi: [String],
        isActive: Bool = false
    ) {
        self.Jenis = Jenis
        self.Deskripsi = Deskripsi
        self.isActive = isActive
    }
}

/*
 nama
 image
 
 kode bank
 kode bank expired
 
 [metode]
 [panduan]
 
 */
