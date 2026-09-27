import Foundation
import UIKit

class NutritionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!

    var detectedFruit: String?// Store the fruit name received from the previous screen
    var nutritionInfo: Nutrition?
    var nutritionDetails: [(String, String)] = []  // Array to hold formatted data
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        if let fruit = detectedFruit, let nutrition = nutritionData[fruit] {
            nutritionInfo = nutrition
            // Populate array with nutrient details
            nutritionDetails = [
                ("Fruit", nutrition.name),
                ("Calories", "\(nutrition.calories) kcal"),
                ("Fat", "\(nutrition.fat) g"),
                ("Protein", "\(nutrition.protein) g"),
                ("Carbohydrates", "\(nutrition.carbohydrates) g")
            ]
        }
        
        tableView.reloadData() // Refresh the table
    }
    
    // MARK: - TableView Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nutritionDetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NutritionCell", for: indexPath)
        
        let detail = nutritionDetails[indexPath.row]
        cell.textLabel?.text = "\(detail.0): \(detail.1)"  // Example: "Calories: 52 kcal"
        
        return cell
    }
}
