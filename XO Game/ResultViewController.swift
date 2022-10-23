//
//  ResultViewController.swift
//  XO Game
//
//  Created by MacBook on 3/10/22.
//

import UIKit

class ResultViewController: ViewController {

    var whoWon = 0;
    

    override func viewDidLoad() {
        super.viewDidLoad()
        switch whoWon {
        case 1:
            whoWonLabel.text = "Player\(whoWon) Won"
            view.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            whoWonLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case 2:
            whoWonLabel.text = "Player\(whoWon) Won"
            view.backgroundColor = #colorLiteral(red: 1, green: 0.7695345123, blue: 0.2496652145, alpha: 1)
            whoWonLabel.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        default:
            whoWonLabel.text = "error"
        }

        // Do any additional setup after loading the view.
    }
    
    
    @IBOutlet weak var whoWonLabel: UILabel!
    
    @IBAction func againButton(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: resetGame)
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
