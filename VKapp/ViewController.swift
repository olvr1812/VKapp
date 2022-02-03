//
//  ViewController.swift
//  VKapp
//
//  Created by Оливер Салихов on 17.01.2022.
//

import UIKit

var data: [String] = ["Creat view", "Add stirngs", "Add data", "Add buttton", "Create exit from app"]



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Жест нажатия
//        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
//        // Присваиваем его UIScrollVIew
//        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        animateTextField()
    }
    
    @IBOutlet weak var loginInput: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBAction func myUnwindAction(unwindSegue: UIStoryboardSegue) {
        print("Все прошло успешно")
    }
    
    
    @IBAction func loginButonPressed(_ sender: Any) {
        
        let login = loginInput.text!
        let password = passwordInput.text!
        
        if (login == "admin" && password == "1234567") {
            print("Успешная авторизация")
        } else {
                print("Не верный логин или пароль")
        }
        
    }
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {

    // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)

    // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
        print(contentInsets)
    }

    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {

    // Устанавливаем отступ внизу UIScrollView, равный 0

    let contentInsets = UIEdgeInsets.zero

    scrollView?.contentInset = contentInsets
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    // Подписываемся на два уведомления: одно приходит при появлении клавиатуры

    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)

    // Второе — когда она пропадает

    NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

    NotificationCenter.default.removeObserver(self, name:
        UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func hideKeyboard() {

    self.scrollView?.endEditing(true)
    }
    
    // Метод для вывода ошибки, если пароль или лоин будет введен не верно
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // Проверяем введенные данные
        let checkResults = checkUserData()
        
        if !checkResults {
            showLoginError()
        }
            return checkResults
    }
        // Если данные не верны, то выведем ошибку
        
        
        func checkUserData() -> Bool {
    
        guard let login = loginInput.text,
              let password = passwordInput.text else {return false}
        
        if login == "olvr" && password == "1234" {
            return true
        } else {
            return false
        }
    }
        
        
        func showLoginError() {
        // Создаем контроллер
        let alert = UIAlertController(title: "Error", message: "Неверный логин или пароль", preferredStyle: .alert)
        
        // Создаем кнопку контроллера
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        // Добавляем кнопку на UIAlertController
        alert.addAction(action)
        
        // Показываем UIAlertController
        present(alert, animated: true, completion: nil)
        }
}

private extension ViewController {
    func animateTextField() {
        
        let offset = view.bounds.width
        
        passwordInput.transform = CGAffineTransform(scaleX: -offset, y: 0)
        
        loginInput.transform = CGAffineTransform(scaleX: offset, y: 0)
        
        UIView.animate(withDuration: 1, delay: 1, options: [.curveEaseOut], animations: {
            self.loginInput.transform = .identity
            self.passwordInput.transform = .identity
            
        })
    
        
    }
}
