//
//  ViewController.swift
//  DoSomething
//
//  Created by Mustafa Filiz on 1.03.2023.
//

import UIKit

class DSToDoListVC: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet var todoTableView: UITableView!

    var todoList: [ToDoListItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        getAllTodos()

//        createDummyArray()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        getAllTodos()
    }

    func getAllTodos() {
        do {
            todoList = try context.fetch(ToDoListItem.fetchRequest())

            DispatchQueue.main.async {
                self.todoTableView.reloadData()
            }
        } catch {
            // error handling
        }
    }



    func deleteTodo(item: ToDoListItem) {
        context.delete(item)

        do {
            try context.save()
            getAllTodos()
        } catch {
            // error handling
        }
    }

    func updateTodo(item: ToDoListItem, todo: String?, date: Date?, note: String?) {
        item.todo = todo
        item.date = date
        item.note = note

        do {
            try context.save()
        } catch {
            // error handling
        }
    }

    func toggleCompleted(item: ToDoListItem) {
        item.completed = !item.completed

        do {
            try context.save()
            getAllTodos()
        } catch {
            // error handling
        }
    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: Segues.showAddToDo, sender: nil)
    }
    
    @objc func toggleCompletedTapped(item: ToDoListItem) {
        print(item)
    }

}

extension DSToDoListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let todoCell = tableView.dequeueReusableCell(withIdentifier: Cells.todoItemCell, for: indexPath) as? DSToDoItemCell else { return UITableViewCell() }

        todoCell.todoLabel.text = todoList[indexPath.row].todo
        todoCell.dateLabel.text = todoList[indexPath.row].date?.formatted(date: .abbreviated, time: .shortened)
        todoCell.checkbox.isChecked = todoList[indexPath.row].completed

        return todoCell
    }

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

        let action = UIContextualAction(style: .normal, title: "Delete") { (action, view, completion) in

            self.todoTableView.beginUpdates()
            self.deleteTodo(item: self.todoList[indexPath.row])
            self.todoTableView.deleteRows(at: [indexPath], with: .automatic)
            self.todoTableView.endUpdates()
            completion(true)
        }

        action.image = UIImage(systemName: "trash")
        action.backgroundColor = .systemRed

        let configuration = UISwipeActionsConfiguration(actions: [action])
        return configuration
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let updateToDoVC = DSAddToDoVC(
//            todo: todoList[indexPath.row].todo,
//            date: todoList[indexPath.row].date,
//            note: todoList[indexPath.row].note,
//            actionText: "Update"
//        )
//
//        navigationController?.pushViewController(updateToDoVC, animated: true)
//    }
}

extension DSToDoListVC: UIAdaptivePresentationControllerDelegate {
    func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
        getAllTodos()
    }
    
    func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
        <#code#>
    }
}
