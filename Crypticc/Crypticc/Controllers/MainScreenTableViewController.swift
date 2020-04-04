//
//  MainScreenViewController.swift
//  Crypticc
//
//  Created by Squiretoss on 1.04.2020.
//  Copyright © 2020 Oguz Demirhan. All rights reserved.
//

import UIKit



class MainScreenTableViewController: UITableViewController {
    
    
    var baseURL = "https://api.coinranking.com/v1/public/coins"
    var nameArray = [String]()
    var iconArray = [String]()
    var colorArray = [String]()
    var valueArray = [String]()
    var descriptionArray = [String]()
    var highestPriceArray = [String]()
    var symbolArray = [String]()
    
    
    let delayTime = 1.0

    let coinMg = CoinManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        coinMg.getRequest(url: baseURL) { (CyrptoCurrencyItem) in
            
            for i in  0...(CyrptoCurrencyItem.data.coins.count-1) {
                self.nameArray.append(CyrptoCurrencyItem.data.coins[i].name)
                self.iconArray.append(CyrptoCurrencyItem.data.coins[i].iconURL)
                self.colorArray.append(CyrptoCurrencyItem.data.coins[i].color ?? "#ffffffff")
                self.valueArray.append(String(format:"%.2f",Float(CyrptoCurrencyItem.data.coins[i].price)!))
                self.descriptionArray.append(CyrptoCurrencyItem.data.coins[i].coinDescription ?? "lorem ipsum")
                self.highestPriceArray.append(CyrptoCurrencyItem.data.coins[i].allTimeHigh.price)
                self.symbolArray.append(CyrptoCurrencyItem.data.coins[i].symbol)
                
                
                
            }
            
             self.baseURL = CyrptoCurrencyItem.data.coins[0].name
            DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + self.delayTime) {
                   self.tableView.reloadData()
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
            }
            print(self.iconArray)
            
            
        }
        
        
       

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "descriptionSegue" {
            let VC = segue.destination as! DescriptionViewController
            let customIndex = tableView.indexPathForSelectedRow?.row
            let color = UIColor(hex: "\(colorArray[customIndex!])ff")
            VC.descriptionText = descriptionArray[(customIndex ?? 0)]
            //VC.descriptionTextView.backgroundColor = .clear
            VC.title = nameArray[customIndex!]
            VC.price = valueArray[customIndex!]
            VC.highestPrice = String(format:"%.2f",Float(highestPriceArray[customIndex!])!)
            VC.view.backgroundColor = color
        }
        
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return nameArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCurrencyReusableCell", for: indexPath) as! CoinTableViewCell
        //cell.iconView = UIView(SVGURL: URL(string: iconArray[indexPath.row])!)
        
      
//        let svgString = iconArray[indexPath.row]
//        cell.wkWebView.loadHTMLString(svgString, baseURL:URL(string: svgString)!)
        
        let color = UIColor(hex: "\(colorArray[indexPath.row])ff")
        cell.coinNameLabel.text = "\(nameArray[indexPath.row]) (\(symbolArray[indexPath.row]))"
        cell.CoinValueLabel.text = valueArray[indexPath.row]
        cell.coinNameLabel.textColor = color
        cell.CoinValueLabel.textColor = color
        
        

        // Configure the cell...

        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}

