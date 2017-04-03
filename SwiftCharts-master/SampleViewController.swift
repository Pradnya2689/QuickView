//
//  SampleViewController.swift
//  SwiftCharts
//
//  Created by Administrator on 23/03/17.
//  Copyright © 2017 ivanschuetz. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {

    @IBAction func BarBtn(_ sender: Any) {
        
        let nextView = storyboard?.instantiateViewController(withIdentifier: "barChart") as! BarChartTestViewController
        navigationController?.pushViewController(nextView, animated: true)
    }
    @IBAction func pieChartBtn(_ sender: Any) {
    
        let nextView = storyboard?.instantiateViewController(withIdentifier: "piechart") as! PieChartTestViewController
        navigationController?.pushViewController(nextView, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       // let nextView = storyboard?.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
