//
//  ViewController.swift
//  TableviewDifDataSource
//
//  Created by Roberto Fernandes on 27/10/2020.
//

import UIKit

enum Section: CaseIterable {
    case main
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier = "personCell"
    
    var dataSource: PersonDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dataSource.update(animatingDifferences: false)
    }
    
    func configureDataSource() {
        dataSource = PersonDataSource(tableView: tableView) {
            tableView, indexPath, person -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
            let person = self.dataSource.personList[indexPath.row]
            
            cell.textLabel?.text = person.name
            cell.detailTextLabel?.text = "age: \(person.age)"
            
            return cell
        }
    }
    
    @IBAction func addButtonClicked(_ sender: UIBarButtonItem) {
        dataSource.addPerson(PersonManager.persons.randomElement()!)
    }
}

class PersonDataSource: UITableViewDiffableDataSource<Section, Person> {
    var personList = [Person]()
    
    func update(animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Person>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(personList, toSection: .main)
        apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    func addPerson(_ personToAdd: Person) {
        personList.append(personToAdd)
        update()
    }
    
    func deletePerson(_ personToDelete: Person) {
        guard let personIndex = personList.firstIndex(where: {person in
            person == personToDelete
        }) else { return }
        
        personList.remove(at: personIndex)
        update()
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let person = self.itemIdentifier(for: indexPath) else { return }
            deletePerson(person)
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = dataSource.itemIdentifier(for: indexPath)
        print(person?.name ?? "person is nil")
    }
    
}
