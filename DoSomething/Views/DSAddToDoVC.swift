//
//  AddToDoVC.swift
//  DoSomething
//
//  Created by Mustafa Filiz on 3.03.2023.
//

import UIKit

class DSAddToDoVC: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    @IBOutlet var todoInput: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var noteInput: UITextView!
    @IBOutlet var actionButton: UIButton!
    
//    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
//        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
//    }
    
//    init(todo: String, date: Date, note: String?, actionText: String) {
//        self.todoInput.text = todo
//        self.datePicker.date = date
//        if let noteLabel = note {
//            self.noteInput.text = noteLabel
//        }
//        self.actionButton.setTitle(actionText, for: .normal)
//
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNoteInput()
        configureTodoInput()

        // Do any additional setup after loading the view.
    }

    func configureNoteInput() {
        noteInput.layer.borderWidth = 1.0
        noteInput.layer.borderColor = UIColor.systemGray4.cgColor
        noteInput.layer.cornerRadius = 5
    }

    func configureTodoInput() {
        todoInput.layer.borderWidth = 1.0
        todoInput.layer.borderColor = UIColor.systemGray4.cgColor
        todoInput.layer.cornerRadius = 5
    }

    func createTodo(todo: String, date: Date, note: String?) {
        let newTodo = ToDoListItem(context: context)

        newTodo.id = UUID()
        newTodo.todo = todo
        newTodo.date = date
        newTodo.note = note
        newTodo.completed = false

        do {
            try context.save()
        } catch {
            // error handling
        }

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(false)
    }

    @IBAction func actionButtonTapped(_ sender: UIButton) {
        guard let newTodo = todoInput.text, !newTodo.isEmpty else { return }

        createTodo(todo: newTodo, date: datePicker.date, note: noteInput.text)

        navigationController?.popViewController(animated: true)
    }

}
