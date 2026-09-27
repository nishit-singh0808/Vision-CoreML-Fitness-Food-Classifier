import Foundation
struct Nutrition {
    let name: String
    let calories: Int
    let fat: Double
    let protein: Double
    let carbohydrates: Double
}
let nutritionData: [String: Nutrition] = [
    "apple": Nutrition(name: "Apple", calories: 52, fat: 0.2, protein: 0.3, carbohydrates: 14),
        "banana": Nutrition(name: "Banana", calories: 89, fat: 0.3, protein: 1.1, carbohydrates: 23),
        "beetroot": Nutrition(name: "Beetroot", calories: 43, fat: 0.2, protein: 1.6, carbohydrates: 10),
        "bell pepper": Nutrition(name: "Bell Pepper", calories: 20, fat: 0.2, protein: 0.9, carbohydrates: 4.6),
        "cabbage": Nutrition(name: "Cabbage", calories: 25, fat: 0.1, protein: 1.3, carbohydrates: 6),
        "capsicum": Nutrition(name: "Capsicum", calories: 31, fat: 0.3, protein: 1, carbohydrates: 6),
        "carrot": Nutrition(name: "Carrot", calories: 41, fat: 0.2, protein: 0.9, carbohydrates: 10),
        "cauliflower": Nutrition(name: "Cauliflower", calories: 25, fat: 0.3, protein: 1.9, carbohydrates: 5),
        "chilli pepper": Nutrition(name: "Chilli Pepper", calories: 40, fat: 0.4, protein: 2, carbohydrates: 9),
        "corn": Nutrition(name: "Corn", calories: 86, fat: 1.2, protein: 3.2, carbohydrates: 19),
        "cucumber": Nutrition(name: "Cucumber", calories: 16, fat: 0.1, protein: 0.7, carbohydrates: 4),
        "eggplant": Nutrition(name: "Eggplant", calories: 25, fat: 0.2, protein: 1, carbohydrates: 6),
        "garlic": Nutrition(name: "Garlic", calories: 149, fat: 0.5, protein: 6.4, carbohydrates: 33),
        "ginger": Nutrition(name: "Ginger", calories: 80, fat: 0.8, protein: 1.8, carbohydrates: 18),
        "grapes": Nutrition(name: "Grapes", calories: 69, fat: 0.2, protein: 0.7, carbohydrates: 18),
        "jalepeno": Nutrition(name: "Jalepeno", calories: 29, fat: 0.4, protein: 0.9, carbohydrates: 6.5),
        "kiwi": Nutrition(name: "Kiwi", calories: 41, fat: 0.4, protein: 0.8, carbohydrates: 10),
        "lemon": Nutrition(name: "Lemon", calories: 29, fat: 0.3, protein: 1.1, carbohydrates: 9),
        "lettuce": Nutrition(name: "Lettuce", calories: 15, fat: 0.2, protein: 1.4, carbohydrates: 3),
        "mango": Nutrition(name: "Mango", calories: 60, fat: 0.4, protein: 0.8, carbohydrates: 15),
        "onion": Nutrition(name: "Onion", calories: 40, fat: 0.1, protein: 1.1, carbohydrates: 9),
        "orange": Nutrition(name: "Orange", calories: 47, fat: 0.1, protein: 0.9, carbohydrates: 12),
        "paprika": Nutrition(name: "Paprika", calories: 282, fat: 13, protein: 14, carbohydrates: 54), // ground spice
        "pear": Nutrition(name: "Pear", calories: 57, fat: 0.1, protein: 0.4, carbohydrates: 15),
        "peas": Nutrition(name: "Peas", calories: 81, fat: 0.4, protein: 5.4, carbohydrates: 14),
        "pineapple": Nutrition(name: "Pineapple", calories: 50, fat: 0.1, protein: 0.5, carbohydrates: 13),
        "pomegranate": Nutrition(name: "Pomegranate", calories: 83, fat: 1.2, protein: 1.7, carbohydrates: 19),
        "potato": Nutrition(name: "Potato", calories: 77, fat: 0.1, protein: 2, carbohydrates: 17),
        "raddish": Nutrition(name: "Raddish", calories: 16, fat: 0.1, protein: 0.7, carbohydrates: 3),
        "soy beans": Nutrition(name: "Soy Beans", calories: 173, fat: 9, protein: 16.6, carbohydrates: 9.9),
        "spinach": Nutrition(name: "Spinach", calories: 23, fat: 0.4, protein: 2.9, carbohydrates: 3.6),
        "sweetcorn": Nutrition(name: "Sweetcorn", calories: 86, fat: 1.2, protein: 3.2, carbohydrates: 19),
        "sweetpotato": Nutrition(name: "Sweet Potato", calories: 86, fat: 0.1, protein: 1.6, carbohydrates: 20),
        "tomato": Nutrition(name: "Tomato", calories: 18, fat: 0.2, protein: 0.9, carbohydrates: 3.9),
        "turnip": Nutrition(name: "Turnip", calories: 28, fat: 0.1, protein: 0.9, carbohydrates: 6.4),
        "watermelon": Nutrition(name: "Watermelon", calories: 30, fat: 0.2, protein: 0.6, carbohydrates: 8)
    // Add more fruits and vegetables
]

