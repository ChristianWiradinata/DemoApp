//
//  DetailViewController.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 04/04/22.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var Header_View: UIView!
    @IBOutlet weak var Title_Label: UILabel!
    @IBOutlet weak var Title_ImageView: UIImageView!
    
    @IBOutlet weak var kodeBank1Sebelum_Label: UILabel!
    @IBOutlet weak var kodeBank2Sebelum_Label: UILabel!
    @IBOutlet weak var kodeBank3Sebelum_Label: UILabel!
    @IBOutlet weak var kodeBank1Sebelum_View: UIView!
    @IBOutlet weak var kodeBank2Sebelum_View: UIView!
    @IBOutlet weak var kodeBank3Sebelum_View: UIView!
    @IBOutlet weak var NomorKontakSebelum_View: UIView!
    
    @IBOutlet weak var kodeBank1Sesudah_Label: UILabel!
    @IBOutlet weak var kodeBank2Sesudah_Label: UILabel!
    @IBOutlet weak var kodeBank3Sesudah_Label: UILabel!
    @IBOutlet weak var kodeBank1Sesudah_View: UIView!
    @IBOutlet weak var kodeBank2Sesudah_View: UIView!
    @IBOutlet weak var kodeBank3Sesudah_View: UIView!
    @IBOutlet weak var NomorKontakSesudah_View: UIView!
    
    @IBOutlet weak var StackView: UIStackView!
    @IBOutlet weak var MetodeScreen: UIView!
    @IBOutlet weak var MetodeCV: UICollectionView!
    @IBOutlet weak var PanduanTV: UITableView!
    @IBOutlet weak var PanduanHeight: NSLayoutConstraint!
    
    var row: Int?
    var y = 0
    var Metode = [PaymentModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
    }
    
    private func style() {
        Header_View.CornerShadow(corners: [.bottomLeft], color: UIColor.white.cgColor, height: 5, curve: 20, shaddow: 0.3)
        PanduanHeight.constant = PanduanTV.frame.height + 30.0
        
        kodeBank1Sebelum_View.layer.cornerRadius = 5
        kodeBank2Sebelum_View.layer.cornerRadius = 5
        kodeBank3Sebelum_View.layer.cornerRadius = 5
        NomorKontakSebelum_View.layer.cornerRadius = 5
        
        kodeBank1Sesudah_View.layer.cornerRadius = 5
        kodeBank2Sesudah_View.layer.cornerRadius = 5
        kodeBank3Sesudah_View.layer.cornerRadius = 5
        NomorKontakSesudah_View.layer.cornerRadius = 5
        
        if Metode[row ?? 0].CodeBank.count == 5 {
            kodeBank2Sebelum_View.removeFromSuperview()
            kodeBank3Sebelum_View.removeFromSuperview()
        } else if Metode[row ?? 0].CodeBank.count == 8 {
            kodeBank3Sebelum_View.removeFromSuperview()
        }
        
        if Metode[row ?? 0].CodeBank_EXP.count == 5 {
            kodeBank2Sesudah_View.removeFromSuperview()
            kodeBank3Sesudah_View.removeFromSuperview()
        } else if Metode[row ?? 0].CodeBank_EXP.count == 8 {
            kodeBank3Sesudah_View.removeFromSuperview()
        }
        
        if Metode[row ?? 0].PaymentMethod[y].Jenis.count == 0 {
            MetodeScreen.removeFromSuperview()
        }
    }
    
    private func setup() {
        if Metode[row ?? 0].CodeBank.count == 10 {
            kodeBank1Sebelum_Label.text = String(Metode[row ?? 0].CodeBank.prefix(5))
            let suf = String(Metode[row ?? 0].CodeBank.suffix(5))
            kodeBank2Sebelum_Label.text = String(suf.prefix(3))
            kodeBank3Sebelum_Label.text = String(Metode[row ?? 0].CodeBank.suffix(2))
        } else if Metode[row ?? 0].CodeBank.count == 8 {
            kodeBank1Sebelum_Label.text = String(Metode[row ?? 0].CodeBank.prefix(5))
            kodeBank2Sebelum_Label.text = String(Metode[row ?? 0].CodeBank.suffix(3))
        } else {
            kodeBank1Sebelum_Label.text = String(Metode[row ?? 0].CodeBank)
        }
        
        if Metode[row ?? 0].CodeBank_EXP.count == 10 {
            kodeBank1Sesudah_Label.text = String(Metode[row ?? 0].CodeBank_EXP.prefix(5))
            let suf = String(Metode[row ?? 0].CodeBank_EXP.suffix(5))
            kodeBank2Sesudah_Label.text = String(suf.prefix(3))
            kodeBank3Sesudah_Label.text = String(Metode[row ?? 0].CodeBank_EXP.suffix(2))
        } else if Metode[row ?? 0].CodeBank_EXP.count == 8 {
            kodeBank1Sesudah_Label.text = String(Metode[row ?? 0].CodeBank_EXP.prefix(5))
            kodeBank2Sesudah_Label.text = String(Metode[row ?? 0].CodeBank_EXP.suffix(3))
        } else {
            kodeBank1Sesudah_Label.text = String(Metode[row ?? 0].CodeBank_EXP)
        }
        
        MetodeCV.register(UINib(nibName: "MetodeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MetodeCollectionViewCell")
        MetodeCV.dataSource = self
        MetodeCV.delegate = self
        
        PanduanTV.register(UINib(nibName: "PanduanTableViewCell", bundle: nil), forCellReuseIdentifier: "PanduanTableViewCell")
        PanduanTV.dataSource = self
        PanduanTV.delegate = self
        
        Metode[row ?? 0].PaymentMethod[0].isActive = true
        Title_Label.text = "Pembayaran Melalui \(Metode[row ?? 0].Name)"
        let url = URL(string: "\(Metode[row ?? 0].Image)")
        Title_ImageView.kf.indicatorType = .activity
        Title_ImageView.kf.setImage(
            with: url,
            placeholder: nil,
            options: [.transition(.fade(0.7))],
            completionHandler: { result in
                
            }
        )
    }
    
    @IBAction func back_OnClick(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Metode[row ?? 0].PaymentMethod.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MetodeCollectionViewCell", for: indexPath) as! MetodeCollectionViewCell
        
        //MARK: - STYLE
        if Metode[row ?? 0].PaymentMethod[indexPath.row].isActive {
            cell.screen.backgroundColor = UIColor(named: "blue")
            cell.title.textColor = UIColor.white
        } else {
            cell.screen.backgroundColor = UIColor.white
            cell.title.textColor = UIColor(named: "blue")
        }
        
        //MARK: - CUSTOM
        cell.delegate = self
        cell.x = row ?? 0
        cell.y = indexPath.row
        cell.Metode = self.Metode
        cell.title.text = Metode[row ?? 0].PaymentMethod[indexPath.row].Jenis
        
        //MARK: - RETURN
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Metode[row ?? 0].PaymentMethod[y].Deskripsi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PanduanTableViewCell", for: indexPath) as! PanduanTableViewCell
        
        cell.count.text = "\(indexPath.row + 1)"
        cell.count_title.text = Metode[row ?? 0].PaymentMethod[y].Deskripsi[indexPath.row]
        
        return cell
    }
}

extension DetailViewController: MetodeCVCellDelegate{
    func ActiveChange(y: Int) {
        self.y = y
        MetodeCV.reloadData()
        PanduanTV.reloadData()
    }
}
