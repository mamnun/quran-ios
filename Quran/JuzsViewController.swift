//
//  JuzsViewController.swift
//  Quran
//
//  Created by Mohamed Afifi on 4/19/16.
//
//  Quran for iOS is a Quran reading application for iOS.
//  Copyright (C) 2017  Quran.com
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
import GenericDataSources
import UIKit

protocol JuzsPresentableListener: class {
    func navigateTo(quranPage: Int, lastPage: LastPage?)
}

class JuzsViewController: BasePageSelectionViewController<Quarter, QuarterTableViewCell>, JuzsPresentable, JuzsViewControllable {
    weak var listener: JuzsPresentableListener?

    override var screen: Analytics.Screen { return .juzs }

    override func createItemsDataSource() -> BasicDataSource<Quarter, QuarterTableViewCell> {
        return QuartersDataSource()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = lAndroid("quran_juz2")
        tableView.ds_register(cellNib: QuarterTableViewCell.self)
    }

    override func navigateTo(quranPage: Int, lastPage: LastPage?) {
        listener?.navigateTo(quranPage: quranPage, lastPage: lastPage)
    }
}
