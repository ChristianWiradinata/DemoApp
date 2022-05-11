//
//  CaraBayarViewController.swift
//  demoPorject
//
//  Created by Christian Wiradinata on 30/03/22.
//

import UIKit
import Kingfisher

class CaraBayarViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var Header_View: UIView!
    @IBOutlet weak var Metode_Table: UITableView!

    var Metode = [PaymentModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("This is CaraBayar")
        
        style()
        setup()
        setData()
    }

    private func style() {
        Header_View.CornerShadow(corners: [.bottomLeft], color: UIColor.white.cgColor, height: 5, curve: 20, shaddow: 0.3)
    }
    
    private func setup() {
        Metode_Table.register(UINib(nibName: "MetodeCell", bundle: nil), forCellReuseIdentifier: "MetodeCell")
        Metode_Table.dataSource = self
        Metode_Table.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Metode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MetodeCell", for: indexPath) as! MetodeCell
        
        //MARK: - Custom Cell
        let url = URL(string: "\(Metode[indexPath.row].Image)")
        cell.ImageView!.kf.indicatorType = .activity
        cell.ImageView!.kf.setImage(
            with: url,
            placeholder: nil,
            options: [.transition(.fade(0.7))],
            completionHandler: { result in
                
            }
        )
        
        cell.Title.text = "Pembayaran Melalui \(Metode[indexPath.row].Name)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let VC = DetailViewController()
        
        //MARK: - Pass Variable
        VC.row = indexPath.row
        VC.Metode = self.Metode
        
        //MARK: - Style
//        VC.StackView.removeArrangedSubview()
//        VC.StackView.removeFromSuperview()
        
        //MARK: - Present Detail
        VC.modalPresentationStyle = .fullScreen
        DispatchQueue.main.async {
            self.present(VC, animated: true, completion: nil)
            
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    private func setData() {
        Metode = [
            PaymentModel(Image: "https://www.freepnglogos.com/uploads/logo-bca-png/bank-central-asia-logo-bank-central-asia-bca-format-cdr-png-gudril-1.png", Name: "Bank BCA", CodeBank: "28888", CodeBank_EXP: "28888", PaymentMethod: [
                Method(Jenis: "ATM", Deskripsi: [
                    "Input kartu ATM dan PIN anda",
                    "Pilih Menu Transaksi Lainnya",
                    "Pilih Transfer",
                    "Pilih Ke Rekening BCA Virtual Account",
                    "Input Nomor Virtual Account, misal. 28888XXXXXX atau 28888XXXXXXXX",
                    "Pilih Benar",
                    "Pilih Ya",
                    "Ambil bukti bayar Anda",
                    "Selesai"
                ]),
                Method(Jenis: "Mobile Banking", Deskripsi: [
                    "Test 1",
                    "Test 2"
                ]),
                Method(Jenis: "E-Banking", Deskripsi: [
                    "Test 3",
                    "Test 24"
                ])
            ]),
            PaymentModel(Image: "https://upload.wikimedia.org/wikipedia/commons/9/9e/ALFAMART_LOGO_BARU.png", Name: "Alfamart", CodeBank: "70014623", CodeBank_EXP: "7001462300", PaymentMethod: [
                Method(Jenis: "", Deskripsi: [
                    "Input kartu ATM dan PIN Anda",
                    "Pilih Menu Transaksi Lainnya",
                    "Pilih Transfer",
                    "Pilih Ke rekening BCA Virtual Account",
                    "Input Nomor Virtual Account, misal. 28888XXXXXX atau 28888XXXXXXXX",
                    "Pilih Benar",
                    "Pilih Ya",
                    "Ambil bukti bayar Anda",
                    "Selesai"
                ])
            ])
        ]
    }
}
