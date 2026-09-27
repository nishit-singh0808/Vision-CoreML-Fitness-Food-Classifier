import UIKit
import CoreML

class WorkoutViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // MARK: - IBOutlets
    @IBOutlet weak var bodyPartPicker: UIPickerView!
    @IBOutlet weak var levelPicker: UIPickerView!
    @IBOutlet weak var equipmentPicker: UIPickerView!
    @IBOutlet weak var resultLabel: UILabel!
    
    // MARK: - Data Arrays
    let bodyParts = ["Abdominals", "Shoulders", "Quadriceps", "Lats", "Hamstrings", "Adductors", "Biceps", "Chest", "Lower Back", "Middle Back", "Triceps", "Traps", "Calves", "Glutes"]
    let levels = ["Beginner", "Intermediate"]
    let equipmentOptions = ["Other", "Cable", "Dumbbell", "Body Only", "Barbell", "Machine", "Bands", "Kettlebells", "None", "Exercise Ball", "E-Z Curl Bar"]
    
    // MARK: - Model
    var workoutModel: WorkoutPredictor?

    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup pickers
        bodyPartPicker.delegate = self
        bodyPartPicker.dataSource = self
        levelPicker.delegate = self
        levelPicker.dataSource = self
        equipmentPicker.delegate = self
        equipmentPicker.dataSource = self
        
        // Load Core ML model
        guard let model = try? WorkoutPredictor(configuration: MLModelConfiguration()) else {
            fatalError("Failed to load Core ML model")
        }
        workoutModel = model
        
        // Set default selections
        bodyPartPicker.selectRow(0, inComponent: 0, animated: false)
        levelPicker.selectRow(0, inComponent: 0, animated: false)
        equipmentPicker.selectRow(0, inComponent: 0, animated: false)
    }
    
    // MARK: - UIPickerView DataSource & Delegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == bodyPartPicker {
            return bodyParts.count
        } else if pickerView == levelPicker {
            return levels.count
        } else if pickerView == equipmentPicker {
            return equipmentOptions.count
        }
        return 0
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == bodyPartPicker {
            return bodyParts[row]
        } else if pickerView == levelPicker {
            return levels[row]
        } else if pickerView == equipmentPicker {
            return equipmentOptions[row]
        }
        return nil
    }

    // MARK: - Predict Button Action
    @IBAction func predictWorkoutButtonTapped(_ sender: UIButton) {
        let selectedBodyPart = bodyParts[bodyPartPicker.selectedRow(inComponent: 0)]
            let selectedLevel = levels[levelPicker.selectedRow(inComponent: 0)]
            let selectedEquipment = equipmentOptions[equipmentPicker.selectedRow(inComponent: 0)]

            do {
                let input = WorkoutPredictorInput(bodyPart: selectedBodyPart, level: selectedLevel, equipment: selectedEquipment)
                let prediction = try workoutModel?.prediction(input: input)

                if let labelProbs = prediction?.labelProbability {
                    let topExercises = labelProbs.sorted { $0.value > $1.value }.prefix(3)
                    var resultText = "Suggested Exercises:\n\n"
                    for (index, exercise) in topExercises.enumerated() {
                        let percent = Int(exercise.value * 100)
                        resultText += "\(index + 1). \(exercise.key)\n"
                    }
                    resultLabel.text = resultText
                } else {
                    resultLabel.text = "No prediction probabilities found."
                }
            } catch {
                print("Prediction error: \(error)")
                resultLabel.text = "Prediction failed. Try again."
            }
    }
}

