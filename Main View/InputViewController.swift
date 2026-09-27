import UIKit
import CoreML
class InputViewController: UIViewController {

    @IBOutlet weak var stepsTextField: UITextField!
    @IBOutlet weak var caloriesTextField: UITextField!
    @IBOutlet weak var workoutTextField: UITextField!
    @IBOutlet weak var sleepTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add tap gesture to dismiss keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }

    // MARK: - Dismiss Keyboard Method
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }


    @IBAction func predictButtonTapped(_ sender: UIButton) {
        dismissKeyboard()
            sender.isEnabled = false

            guard let steps = Double(stepsTextField.text ?? ""),
                  let caloriesBurned = Double(caloriesTextField.text ?? ""),
                  let workoutTime = Double(workoutTextField.text ?? ""),
                  let sleepTime = Double(sleepTextField.text ?? ""),
                  let age = Double(ageTextField.text ?? ""),
                  let weight = Double(weightTextField.text ?? ""),
                  let height = Double(heightTextField.text ?? "") else {
                print("Invalid input")
                sender.isEnabled = true
                return
            }

            if let result = predictNutrition(
                steps: steps,
                caloriesBurned: caloriesBurned,
                workoutTime: workoutTime,
                sleepTime: sleepTime,
                age: age,
                weight: weight,
                height: height
            ) {
                // Push OutputViewController programmatically
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                if let outputVC = storyboard.instantiateViewController(withIdentifier: "OutputViewController") as? OutputViewController {
                    outputVC.calories = result.calories
                    outputVC.protein = result.protein
                    outputVC.carbs = result.carbs
                    outputVC.fat = result.fat
                    navigationController?.pushViewController(outputVC, animated: true)
                }
            } else {
                print("Prediction failed.")
            }

            sender.isEnabled = true
        }

       
       // Core ML Prediction Function
       func predictNutrition(steps: Double, caloriesBurned: Double, workoutTime: Double, sleepTime: Double, age: Double, weight: Double, height: Double) -> (calories: Double, protein: Double, carbs: Double, fat: Double)? {
           do {
               // Initialize model objects for each nutritional aspect
               let caloriesModel = try NutritionCalories(configuration: MLModelConfiguration())
               let proteinModel = try NutritionProtein(configuration: MLModelConfiguration())
               let carbsModel = try NutritionCarbs(configuration: MLModelConfiguration())
               let fatModel = try NutritionFat(configuration: MLModelConfiguration())
               
               // Create input objects for each model
               let caloriesInput = NutritionCaloriesInput(
                   steps_walked: Int64(steps),
                   calories_burned: Int64(caloriesBurned),
                   workout_time: Int64(workoutTime),
                   sleep_time: sleepTime,
                   age: Int64(age),
                   weight: weight,
                   height: Int64(height)
               )
               let proteinInput = NutritionProteinInput(
                   steps_walked: Int64(steps),
                   calories_burned: Int64(caloriesBurned),
                   workout_time: Int64(workoutTime),
                   sleep_time: sleepTime,
                   age: Int64(age),
                   weight: weight,
                   height: Int64(height)
               )
               let carbsInput = NutritionCarbsInput(
                   steps_walked: Int64(steps),
                   calories_burned: Int64(caloriesBurned),
                   workout_time: Int64(workoutTime),
                   sleep_time: sleepTime,
                   age: Int64(age),
                   weight: weight,
                   height: Int64(height)
               )
               let fatInput = NutritionFatInput(
                   steps_walked: Int64(steps),
                   calories_burned: Int64(caloriesBurned),
                   workout_time: Int64(workoutTime),
                   sleep_time: sleepTime,
                   age: Int64(age),
                   weight: weight,
                   height: Int64(height)
               )
               
               // Make predictions using each model
               let caloriesResult = try caloriesModel.prediction(input: caloriesInput)
               let proteinResult = try proteinModel.prediction(input: proteinInput)
               let carbsResult = try carbsModel.prediction(input: carbsInput)
               let fatResult = try fatModel.prediction(input: fatInput)
               
               // Return the results as a tuple
               return (caloriesResult.recommended_calories, proteinResult.recommended_protein, carbsResult.recommended_carbs, fatResult.recommended_fat)
               
           } catch {
               // Print the error if prediction fails
               print("Prediction failed: \(error)")
               return nil
           }
       }
   }
