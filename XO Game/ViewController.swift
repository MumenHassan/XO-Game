

import UIKit

class ViewController: UIViewController {
    var whoPalyerWon = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        resetGame()
    }
    
    var isActive = true
    
    var player = 1
    var gameState = [0,0,0,
                     0,0,0,
                     0,0,0]
    
    var indexsWinner = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var playAgainLabel: UIButton!
    
    @IBOutlet weak var position0: UIButton!
    @IBOutlet weak var position1: UIButton!
    @IBOutlet weak var position2: UIButton!
    @IBOutlet weak var position3: UIButton!
    @IBOutlet weak var position4: UIButton!
    @IBOutlet weak var position5: UIButton!
    @IBOutlet weak var position6: UIButton!
    @IBOutlet weak var position7: UIButton!
    @IBOutlet weak var position8: UIButton!
    
    
    
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        resetGame()
    }
    
    @IBAction func selectButton(_ sender: UIButton) {
        selectPosition(button: sender)
        print(gameState)
    }
    
    func resetGame(){
        let positions = [position0,position1,position2,position3,position4,position5,position6,position7,position8]
        for position in positions {
            position?.setImage(nil, for: UIControl.State.normal)
        }
        for i in 0...8{
            gameState[i]=0
        }
        isActive=true
    }
    
    func selectPosition(button: UIButton){
        if button.image(for: UIControl.State.normal) == nil && isActive {
        
            if player == 1 {
                button.setImage(#imageLiteral(resourceName: "x3"), for: UIControl.State.normal)
                
            }else{
                button.setImage(#imageLiteral(resourceName: "o2"), for: UIControl.State.normal)
                
            }
            gameState[button.tag]=player
            determineWinner()
            if player==1 {
                player=2
            }else{
                player=1
            }
            
        }
        
        
        
    }
    
    func determineWinner(){
        for index in indexsWinner {
            if gameState[index[0]] == gameState[index[1]]
                && gameState[index[1]] == gameState[index[2]]
                && gameState[index[2]] != 0 {
                resultLabel.text="Player \(player) Won"
                whoPalyerWon = player;
                performSegue(withIdentifier:"whoWon", sender: self)
                isActive = false
                break
            }
            playAgainLabel.setTitle("Play Again", for: UIControl.State.normal)
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var whoWonContoller = segue.destination as! ResultViewController
        whoWonContoller.whoWon = whoPalyerWon;
    }
}

