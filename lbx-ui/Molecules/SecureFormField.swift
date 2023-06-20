//
//  SecureFormField.swift
//  lbx-client
//
//  Created by Ambrose Mbayi on 20/06/2023.
//
import SwiftUI
import Foundation

struct SecureFormField: View {
    private enum FieldTag {
        case hidden
        case visible
    }

    @Environment(\.theme) var theme: Theme
    @FocusState private var focusedField: FieldTag?
    @Binding var text: String
    @State private var isTextHidden: Bool = true

    private let title: String
    private let placeholder: String?
    private let autocapitalized: UITextAutocapitalizationType
    private let keyboardType: UIKeyboardType
    private let contentType: UITextContentType?
    private let onEdit: ((Bool) -> Void)?
    private let onCommit: () -> Void

    init(
        text: Binding<String>,
        title: String,
        placeholder: String? = nil,
        keyboardType: UIKeyboardType = .default,
        autocapitalized: UITextAutocapitalizationType = .none,
        contentType: UITextContentType? = nil,
        onEdit: ((Bool) -> Void)? = nil,
        onCommit: @escaping () -> Void) {
            self._text = text
            self.title = title
            self.placeholder = placeholder
            self.keyboardType = keyboardType
            self.autocapitalized = autocapitalized
            self.contentType = contentType
            self.onEdit = onEdit
            self.onCommit = onCommit
        }

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            AutoSizeText(text: title)
                .font(theme.typography.headingSmall)
                .foregroundColor(theme.colors.textOnSurfaceDefault)
                .frame(width: 144, height: 16, alignment: .leading)

            HStack(alignment: .center, spacing: 2.5) {
                if isTextHidden {
                    SecureField(placeholder ?? title, text: $text)
                    .tint(theme.colors.brand)
                    .focused($focusedField, equals: .hidden)
                    .autocapitalization(autocapitalized)
                    .textContentType(contentType)
                    .font(theme.typography.body)
                    .foregroundColor(theme.colors.textOnSurfaceDefault)
                    .keyboardType(keyboardType)
                    .onSubmit {
                        self.onCommit()
                        self.onEdit?(false)
                    }
                    .onTapGesture
                    {
                        onEdit?(true)
                    }
                } else {
                    TextField(placeholder ?? title, text: $text, onEditingChanged: { isEditing in
                        onEdit?(isEditing)
                    })
                    .tint(theme.colors.brand)
                    .focused($focusedField, equals: .visible)
                    .autocapitalization(autocapitalized)
                    .textContentType(contentType)
                    .font(theme.typography.body)
                    .foregroundColor(theme.colors.textOnSurfaceDefault)
                    .keyboardType(keyboardType)
                    .onSubmit { self.onCommit() }
                }

                Button {
                    isTextHidden.toggle()
                    focusedField = isTextHidden ? .hidden : .visible
                } label: {
                    (isTextHidden ? theme.icons.system.eyeFill : theme.icons.system.eyeSlashFill)
                        .resizable()
                        .scaledToFit()
                        .font(Font.title.weight(.medium))
                        .foregroundColor(theme.colors.textOnSurfaceDefault)
                        .frame(width: 18, height: 18, alignment: .center)
                }
                .padding(.trailing, 5)
            }
            .padding(10)
            .overlay(RoundedRectangle(cornerRadius: 6, style: .circular)
                        .stroke(theme.colors.borderDefault, lineWidth: 1))
        }
    }
}
