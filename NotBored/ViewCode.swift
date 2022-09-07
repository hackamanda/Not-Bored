//
//  ViewCode.swift
//  NotBored
//
//  Created by Amanda Hack Adriano on 06/09/22.
//

import Foundation

protocol ViewCode {
    func setupSubViews() //colocar os elementos na tela
    func setupConstrains()
    func setupExtraConfiguration()
    func setup()
}

extension ViewCode {
    func setup(){
        setupSubViews()
        setupConstrains()
        setupExtraConfiguration()
    }
}
