import UIKit
class OutputViewController: UIViewController {
    var calories: Double?
    var protein: Double?
    var carbs: Double?
    var fat: Double?
    
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var proteinLabel: UILabel!
    @IBOutlet weak var carbsLabel: UILabel!
    @IBOutlet weak var fatLabel: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
        
               // Helper function to format Double values to a string with 2 decimal places
               func format(value: Double?) -> String {
                   if let value = value {
                       return String(format: "%.2f", value)
                   }
                   return "Data not available"
               }
               
               // Update the labels with formatted values
               caloriesLabel.text = "Calories: \(format(value: calories))"
               proteinLabel.text = "Protein: \(format(value: protein))"
               carbsLabel.text = "Carbs: \(format(value: carbs))"
               fatLabel.text = "Fat: \(format(value: fat))"
        }
}
