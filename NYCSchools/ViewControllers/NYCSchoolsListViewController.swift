//
//  ViewController.swift
//  NYCSchools
//
//  Created by Subbareddy l on 11/19/22.
//

import UIKit

class NYCSchoolsListViewController: UIViewController {
    
    let highSchoolsService: NetworkRequestService
    let satScoresService: NetworkRequestService
    let highSchoolsListparser = NYCHighSchoolsDataParser()
    let SATScoresListParser = SATScoresDataParser()
    let schoolsList = UITableView()
    var schoolsData = [School]()
    var SATScoresData = [SATScores]()
    
    init(highSchoolsService: NetworkRequestService, satScoresService: NetworkRequestService)
    {
        self.highSchoolsService = highSchoolsService
        self.satScoresService = satScoresService
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "NYC Schools"
        navigationController?.view.backgroundColor = .systemBackground
        schoolsList.translatesAutoresizingMaskIntoConstraints = false
        schoolsList.dataSource = self
        schoolsList.delegate = self
        schoolsList.register(SchoolCell.self, forCellReuseIdentifier: "school-cell")
        schoolsList.rowHeight = UITableView.automaticDimension
        schoolsList.estimatedRowHeight = 120.0
        setupViews()
        highSchoolsService.getData(parser: highSchoolsListparser) { [weak self] data, error in
            if let schools = data as? [School] {
                self?.schoolsData = schools
                DispatchQueue.main.async {
                    self?.schoolsList.reloadData()
                }
            }
        }
    }
    
    private func setupViews()
    {
        view.addSubview(schoolsList)
        var constraints = [NSLayoutConstraint]()
        constraints.append(view.leftAnchor.constraint(equalTo: schoolsList.leftAnchor))
        constraints.append(view.rightAnchor.constraint(equalTo: schoolsList.rightAnchor))
        constraints.append(view.topAnchor.constraint(equalTo: schoolsList.topAnchor))
        constraints.append(view.bottomAnchor.constraint(equalTo: schoolsList.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
}

extension NYCSchoolsListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "school-cell", for: indexPath) as? SchoolCell {
            cell.updateModel(model: schoolsData[indexPath.item])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schoolsData.count
    }
}

extension NYCSchoolsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if SATScoresData.count > 0{
            presentDetailsVC(school: schoolsData[indexPath.item],
                             satScores: SATScoresData,
                             indexPath: indexPath,
                             tableView:tableView)
        } else {
            fetchSATScoresAndPresentDetailsVC(tableView: tableView, indexPath: indexPath)
        }
    }

    func fetchSATScoresAndPresentDetailsVC(tableView: UITableView, indexPath: IndexPath)
    {
        let schoolsDataCopy = schoolsData
        satScoresService.getData(parser: SATScoresListParser) { [weak self] data, error in
            DispatchQueue.main.async {
                if let satScores = data as? [SATScores] {
                    self?.SATScoresData = satScores
                    self?.presentDetailsVC(school: schoolsDataCopy[indexPath.item],
                                           satScores: satScores,
                                           indexPath: indexPath,
                                           tableView:tableView)
                    
                } else if error != nil {
                    let controller = UIAlertController(title: "Error",
                                                       message: error.debugDescription,
                                                       preferredStyle: UIAlertController.Style.alert)
                    controller.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel))
                    self?.navigationController?.present(controller, animated: true)
                    tableView.deselectRow(at: indexPath, animated: true)
                }
            }
        }
    }

    func presentDetailsVC(school: School,
                          satScores:[SATScores],
                          indexPath: IndexPath,
                          tableView: UITableView) {
        var satScoreForSelectedSchool: SATScores?
        for score in satScores {
            if score.dbn == school.dbn {
                satScoreForSelectedSchool = score
                break
            }
        }
        let detailsVC = NYCSchoolDetailViewController(school: school, satScores: satScoreForSelectedSchool)
        self.navigationController?.pushViewController(detailsVC, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
