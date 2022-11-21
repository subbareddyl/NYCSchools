//
//  SchoolCell.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/20/22.
//

import UIKit

class SchoolCell: UITableViewCell {
    let schoolNameLabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let finalGradesLabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    let neighborhoodLabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubViews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        schoolNameLabel.text = nil
        finalGradesLabel.text = nil
        neighborhoodLabel.text = nil
    }

    private func setupSubViews() {
        backgroundColor = UIColor.white
        addSubview(schoolNameLabel)
        addSubview(finalGradesLabel)
        addSubview(neighborhoodLabel)
    }

    private func setupConstraints()
    {
        var constraints = [NSLayoutConstraint]()
        constraints.append(schoolNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 14))
        constraints.append(schoolNameLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20))
        constraints.append(schoolNameLabel.widthAnchor.constraint(lessThanOrEqualToConstant: frame.width))
        constraints.append(finalGradesLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20))
        constraints.append(finalGradesLabel.topAnchor.constraint(equalTo: schoolNameLabel.bottomAnchor, constant: 6))
        constraints.append(finalGradesLabel.widthAnchor.constraint(lessThanOrEqualToConstant: frame.width))
        constraints.append(neighborhoodLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20))
        constraints.append(neighborhoodLabel.topAnchor.constraint(equalTo: finalGradesLabel.bottomAnchor, constant: 6))
        constraints.append(neighborhoodLabel.widthAnchor.constraint(lessThanOrEqualToConstant: frame.width))
        constraints.append(bottomAnchor.constraint(equalTo: neighborhoodLabel.bottomAnchor, constant: 14))
        NSLayoutConstraint.activate(constraints)
    }

    func updateModel(model: School) {
        schoolNameLabel.text = model.school_name
        if let grades = model.finalgrades {
            finalGradesLabel.text = "\(grades) Grades"
        }
        var neighborhoodStr = "\(model.neighborhood ?? "")"
        if let city = model.city {
            neighborhoodStr = neighborhoodStr + ", \(city)"
        }
        neighborhoodLabel.text = neighborhoodStr
    }
}
