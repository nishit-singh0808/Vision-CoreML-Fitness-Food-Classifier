import UIKit

class EquipmentViewController: UIViewController {

    @IBOutlet weak var equipmentImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var youtubeButton: UIButton!

    var detectedEquipment: String? // This gets set from the previous screen

    override func viewDidLoad() {
        super.viewDidLoad()
        print(detectedEquipment!)
        // Make button look clickable
        youtubeButton.setTitleColor(.systemBlue, for: .normal)
        youtubeButton.setTitle("Watch on YouTube ▶️", for: .normal)

        // Display equipment data
        if let key = detectedEquipment, let equipment = equipmentData[key] {
            nameLabel.text = equipment.name
            equipmentImageView.image = UIImage(named: equipment.imageName)
            youtubeButton.addTarget(self, action: #selector(openYouTubeLink), for: .touchUpInside)
        } else {
            nameLabel.text = "Equipment not found"
            equipmentImageView.image = nil
            youtubeButton.isHidden = true
        }
    }

    @objc func openYouTubeLink() {
        if let key = detectedEquipment, let equipment = equipmentData[key],
           let url = URL(string: equipment.youtubeLink) {
            UIApplication.shared.open(url)
        }
    }
}
