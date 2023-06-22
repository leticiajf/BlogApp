//
//  BlogAppNewPostView.swift
//  BlogApp
//
//  Created by Leticia on 20/06/23.
//

import UIKit

protocol BlogAppNewPostViewDelegate: AnyObject {
    func didTapAddButton(with data: BlogObject)
}

final class BlogAppNewPostView: UIView {
    
    // MARK: - PROPERTIES
    
    weak var delegate: BlogAppNewPostViewDelegate?
    private var isEditingTextField: Bool = false
    
    // MARK: - INITIALIZER
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .purple
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI
    
    private lazy var title: UILabel = {
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.font = .systemFont(ofSize: 20, weight: .bold)
        title.text = "Adicionar novo Post"
        title.textColor = .white
        return title
    }()
    
    private lazy var titleTextField: UITextField = {
        let titleTextField = UITextField(frame: .zero)
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.backgroundColor = .white
        titleTextField.textColor = .black
        titleTextField.font = .systemFont(ofSize: 16, weight: .regular)
        titleTextField.layer.cornerRadius = 6
        titleTextField.delegate = self
        titleTextField.attributedPlaceholder = NSAttributedString(
            string: "Adicione o título do Post",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        return titleTextField
    }()
    
    private lazy var descriptionTextView: UITextView = {
        let descriptionTextView = UITextView(frame: .zero)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.backgroundColor = .white
        descriptionTextView.textColor = .black
        descriptionTextView.font = .systemFont(ofSize: 16, weight: .regular)
        descriptionTextView.layer.cornerRadius = 6
        descriptionTextView.delegate = self
        return descriptionTextView
    }()
    
    private lazy var placeHolderText: UILabel = {
        let placeHolderText = UILabel()
        placeHolderText.translatesAutoresizingMaskIntoConstraints = false
        placeHolderText.font = .systemFont(ofSize: 16, weight: .regular)
        placeHolderText.text = "Adicione o texto do Post"
        placeHolderText.textColor = .lightGray
        placeHolderText.isHidden = !descriptionTextView.text.isEmpty
        return placeHolderText
    }()
    
    private lazy var addButton: UIButton = {
        let addButton = UIButton(frame: .zero)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.layer.cornerRadius = 8
        addButton.setTitle("Adicionar Post!", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        addButton.backgroundColor = .black
        addButton.addTarget(self, action: #selector(didTapAddButton), for: .touchUpInside)
        return addButton
    }()
    
    // MARK: - PRIVATE METHODS
    
    private func getDate() -> String {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: currentDate)
    }
    
    private func validateData() -> BlogObject? {
        guard let titleText = titleTextField.text,
              let descriptionText = descriptionTextView.text else { return nil }
        if !titleText.isEmpty, !descriptionText.isEmpty {
            let data = BlogObject(title: titleText,
                                  description: descriptionText,
                                  date: getDate())
            return data
        } else { return nil }
    }
    
    @objc private func didTapAddButton() {
        guard let data = validateData() else { return }
        delegate?.didTapAddButton(with: data)
    }
    
    @objc private func closeKeyboard() {
        if isEditingTextField {
            titleTextField.endEditing(true)
            descriptionTextView.endEditing(true)
        }
    }
    
    // MARK: - SETUP VIEW
    
    private func setupView() {
        buildViewHierarchy()
        addConstraints()
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeKeyboard)))
    }
    
    private func buildViewHierarchy() {
        addSubview(title)
        addSubview(titleTextField)
        addSubview(descriptionTextView)
        addSubview(placeHolderText)
        addSubview(addButton)
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 24),
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            titleTextField.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            titleTextField.heightAnchor.constraint(equalToConstant: 50),
            titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 24),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 200),
            descriptionTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            descriptionTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            placeHolderText.topAnchor.constraint(equalTo: descriptionTextView.topAnchor, constant: 8),
            placeHolderText.leadingAnchor.constraint(equalTo: descriptionTextView.leadingAnchor),
            placeHolderText.trailingAnchor.constraint(equalTo: descriptionTextView.trailingAnchor),
            
            addButton.heightAnchor.constraint(equalToConstant: 60),
            addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            addButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

// MARK: - EXTENSION

extension BlogAppNewPostView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleTextField.endEditing(true)
        isEditingTextField = false
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        isEditingTextField = false
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        isEditingTextField = true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        isEditingTextField = false
    }
}

extension BlogAppNewPostView: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeHolderText.isHidden = !textView.text.isEmpty
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        placeHolderText.isHidden = !textView.text.isEmpty
        isEditingTextField = false
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeHolderText.isHidden = true
        isEditingTextField = true
    }
}
