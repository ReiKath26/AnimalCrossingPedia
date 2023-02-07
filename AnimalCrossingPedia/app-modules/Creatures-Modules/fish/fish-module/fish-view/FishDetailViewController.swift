//
//  FishDetailViewController.swift
//  AnimalCrossingPedia
//
//  Created by Kathleen Febiola Susanto on 07/02/23.
//

import UIKit

class FishDetailViewController: UIViewController, AnyFishView{
    var presenter: AnyFishPresenter?
    
    func update(with data: [Fish]) {
        
    }
    
    func update(with error: String) {
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
