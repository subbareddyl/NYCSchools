//
//  NYCSchoolDetailViewController.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/20/22.
//

import UIKit

class NYCSchoolDetailViewController: UIViewController {
    let school: School
    let satScores: SATScores?
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let stackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = NSLayoutConstraint.Axis.vertical
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        view.isLayoutMarginsRelativeArrangement = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(school: School, satScores: SATScores?) {
        self.school = school
        self.satScores = satScores
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        title = school.school_name
        descriptionLabel.text = school.overview_paragraph
        view.backgroundColor = UIColor.white
        setupSubviews()
        setupConstraints()
    }
    
    private func spaceView() -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([view.heightAnchor.constraint(equalToConstant: 20)])
        return view
    }
    
    private func addDetailWith(title:String,
                               detail:String,
                               stackView: UIStackView)
    {
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.semibold)
        stackView.addArrangedSubview(titleLabel)
        let detailLabel = UILabel()
        detailLabel.text = detail
        detailLabel.numberOfLines = 0
        detailLabel.font = UIFont.systemFont(ofSize: 16)
        stackView.addArrangedSubview(detailLabel)
        stackView.addArrangedSubview(spaceView())
    }
    
    private func addHighlightedTitleWith(name: String,
                                         stackView: UIStackView)
    {
        let titleLabel = UILabel()
        titleLabel.text = name
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.bold)
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func setupSubviews() {
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)
        addHighlightedTitleWith(name: "Overview:", stackView: stackView)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(spaceView())
        if let satScores = satScores {
            addHighlightedTitleWith(name: "SAT Scores:", stackView: stackView)
            addDetailWith(title: "Number of SAT test takers:", detail: satScores.num_of_sat_test_takers, stackView: stackView)
            addDetailWith(title: "SAT critical reading avg score:", detail: satScores.sat_critical_reading_avg_score, stackView: stackView)
            addDetailWith(title: "SAT match avg score:", detail: satScores.sat_math_avg_score, stackView: stackView)
            addDetailWith(title: "SAT writing avg score:", detail: satScores.sat_writing_avg_score, stackView: stackView)
        }
        addHighlightedTitleWith(name: "Additional Information:", stackView: stackView)
        if let phoneNumber = school.phone_number {
            addDetailWith(title: "Phone number:", detail: phoneNumber, stackView: stackView)
        }
        if let schoolEmail = school.school_email {
            addDetailWith(title: "Email:", detail: schoolEmail, stackView: stackView)
        }
        if let bus = school.bus {
            addDetailWith(title: "Bus:", detail: bus, stackView: stackView)
        }
        if let subway = school.subway {
            let subwayTitleLabel = UILabel()
            subwayTitleLabel.text = "Subway:"
            subwayTitleLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold)
            stackView.addArrangedSubview(subwayTitleLabel)
            let list = subway.split(separator: ";")
            for item in list {
                let subwayLabel = UILabel()
                subwayLabel.text = item.description
                subwayLabel.font = UIFont.systemFont(ofSize: 16)
                stackView.addArrangedSubview(subwayLabel)
            }
        }
        setupConstraints()
    }
    
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints += stackView.constraintsToFillSuperView()
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant:10))
        constraints.append(scrollView.leftAnchor.constraint(equalTo: view.leftAnchor))
        constraints.append(scrollView.rightAnchor.constraint(equalTo: view.rightAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(descriptionLabel.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20))
        NSLayoutConstraint.activate(constraints)
    }
}
