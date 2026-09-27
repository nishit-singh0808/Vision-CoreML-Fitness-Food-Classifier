import Foundation

// Declare the struct only once
struct Equipment1 {
    let name: String
    let imageName: String
    let youtubeLink: String
}

// Dictionary holding equipment data
let equipmentData: [String: Equipment1] = [
    "Dumbells": Equipment1(
        name: "Dumbell",
        imageName: "dumbell-set",
        youtubeLink: "https://youtu.be/0A3EgOztptQ?si=P2_VGChRBRUGmjcv"
    ),"Elliptical Machine": Equipment1(
        name: "Elliptical Machine",
        imageName: "Elliptical-Machine",
        youtubeLink: "https://youtu.be/ysWOJYDV6_U?si=ZRJZOCNaPGQY736i"
    ),"Recumbent Bike": Equipment1(
        name: "Recumbent Bike",
        imageName: "Recumbent-Bike",
        youtubeLink: "https://youtu.be/dzIH8-vtVhA?si=yvKOySZ2Tk-7usuq"
    )
]

