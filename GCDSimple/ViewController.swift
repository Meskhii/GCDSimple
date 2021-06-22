//
//  ViewController.swift
//  GCDSimple
//
//  Created by user200328 on 6/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    private var currentNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func calculatePrimeNumbers(_ sender: UIButton) {
        sender.isEnabled = false
        DispatchQueue.global().async {
            self.primes()
            DispatchQueue.main.async {
                sender.isEnabled = true
                self.numberLabel.text = "\(self.currentNumber)"
            }
        }
    }
    
    private func primes() {
            let firstPrime = 2
            guard 100_000 >= firstPrime else {
                fatalError("End of range has to be greater than or equal to \(firstPrime)!")
            }
            var numbers = Array(firstPrime...100_000)

            var currentPrimeIndex = 0

            while currentPrimeIndex < numbers.count {
                
                let currentPrime = numbers[currentPrimeIndex]

                var numbersAfterPrime = numbers.suffix(from: currentPrimeIndex + 1)
                numbersAfterPrime.removeAll(where: { $0 % currentPrime == 0 })

                numbers = numbers.prefix(currentPrimeIndex + 1) + Array(numbersAfterPrime)
                
                print(currentPrime)

                currentPrimeIndex += 1
            }
            
            currentNumber = numbers.last!
        }
}

