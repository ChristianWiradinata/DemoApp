//
//  TheViewController.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 01/04/22.
//

import UIKit

@available(iOS 13.0, *)
class TheViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var Table: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addData()
        setup()
    }
    
    @IBAction func Selanjutnya_OnClick(_ sender: Any) {
        for data in dataModel {
            for ext in data.extendedModel! {
                if ext.status {
                    print("=== Cell \(data.title) dengan \(ext.title) Status \(ext.status) ")
                }
            }
        }
    }
    
    @IBAction func Batal_OnClick(_ sender: Any) {
        Table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        dataModel[indexPath.row].isExpand = !dataModel[indexPath.row].isExpand
        Table.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dataCount:Float = Float(dataModel[indexPath.row].extendedModel!.count)
        let rounded:Float = ceil(dataCount/2)
        let hei = CGFloat(rounded)
        let height = hei * 60.0 + 110.0

        if dataModel[indexPath.row].isExpand { return height }
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        //MARK: - Calculation
        let dataCount:Float = Float(dataModel[indexPath.row].extendedModel!.count)
        let rounded:Float = ceil(dataCount/2)
        let hei = CGFloat(rounded)
        let height = hei * 60.0 + 50.0
        
        //MARK: - Pass Variable.
        cell.CellIndex = indexPath
        cell.cv.reloadData()
        cell.delegate = self
        
        //MARK: - CUSTOM THE CELL
        cell.Header.text = "\(dataModel[indexPath.row].title)"
        cell.Footer.text = "\(dataModel[indexPath.row].footer)"
        
        //MARK: - Will used when table reloaded.
        if dataModel[indexPath.row].isExpand {
            cell.Expand_Height.constant = height
        } else {
            cell.Expand_Height.constant = 0
        }
//
        return cell
    }
    
    
    
    
    
    
    
    
    
    
    
    
    func setup() {
        Table.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        Table.dataSource = self
        Table.delegate = self
    }
    
    func addData() {
        dataModel = [
            DataModel(title: "Cell 1", footer: "Footer 1", extendedModel: [
                ExtendedModel(title: "6 Bulan", subTitle: "Bunga: 1.0%")
            ]),
            DataModel(title: "Cell 2", footer: "Footer 2", extendedModel: [
                ExtendedModel(title: "6 Bulan", subTitle: "Bunga: 1.0%"),
                ExtendedModel(title: "12 Bulan", subTitle: "Bunga: 1.0%"),
                ExtendedModel(title: "18 Bulan", subTitle: "Bunga: 2.0%")
            ]),
            DataModel(title: "Cell 3", footer: "Footer 3", extendedModel: [
                ExtendedModel(title: "6 Bulan", subTitle: "Bunga: 1.0%"),
                ExtendedModel(title: "12 Bulan", subTitle: "Bunga: 1.0%")
            ])
        ]
    }
}

@available(iOS 13.0, *)
extension TheViewController: TableViewCellDelegate {
    func buttonClicked() {
        Table.reloadData()
    }
}
