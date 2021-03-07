//
//  CourseCell.swift
//  myNetworking
//
//  Created by Marius Malyshev on 04.03.2021.
//

import UIKit

class CourseCell: UITableViewCell {

    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
 
    func configure(with cource: Course) {
        nameLabel.text = cource.name
        numberOfLessons.text = "Number of lessons: \(cource.number_of_lessons ?? 0)"
        numberOfTests.text = "Number of tests: \(cource.number_of_tests ?? 0)"
        
        DispatchQueue.global().async {
            guard let stringURL = cource.imageUrl else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
            }
        }
    }
}
