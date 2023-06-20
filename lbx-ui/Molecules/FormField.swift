import SwiftUI

struct FormField: View
{
    @Environment(\.theme) var theme: Theme

    @Binding var text: String
    @State private var fieldText: String

    private let title: String
    private let placeholder: String?
    private let autocapitalized: UITextAutocapitalizationType
    private let autocorrectDisabled: Bool
    private let isDisabled: Bool
    private let isActionable: Bool
    private let isClearable: Bool
    private let isAddress: Bool
    private let leftText: String?
    private let contentType: UITextContentType?
    private let keyboardType: UIKeyboardType
    private let formatStyle: StringFormatStyle?
    private let onActionPress: (() -> Void)?
    private let onEdit: ((Bool) -> Void)?
    private let onCommit: (() -> Void)?
    private let onClear: (() -> Void)?

    @ViewBuilder private let leftImage: Image?

    init(
        text: Binding<String>,
        title: String = "",
        placeholder: String? = nil,
        autocapitalized: UITextAutocapitalizationType = .none,
        autocorrectDisabled: Bool = false,
        isDisabled: Bool = false,
        isActionable: Bool = false,
        isClearable: Bool = false,
        isAddress: Bool = false,
        contentType: UITextContentType? = nil,
        keyboardType: UIKeyboardType = .default,
        formatStyle: StringFormatStyle? = nil,
        leftImage: Image? = nil,
        leftText: String? = nil,
        onActionPress: (() -> Void)? = nil,
        onEdit: ((Bool) -> Void)? = nil,
        onCommit: (() -> Void)? = nil,
        onClear: (() -> Void)? = nil)
    {
        self.title = title
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.formatStyle = formatStyle
        self.autocapitalized = autocapitalized
        self.autocorrectDisabled = autocorrectDisabled
        self.contentType = contentType
        self.isDisabled = isDisabled
        self.isActionable = isActionable
        self.isClearable = isClearable
        self.isAddress = isAddress
        self.leftImage = leftImage
        self.leftText = leftText
        self.onActionPress = onActionPress
        self.onEdit = onEdit
        self.onCommit = onCommit
        self.onClear = onClear

        _text = text

        if let formatStyle = formatStyle {
            fieldText = text.wrappedValue.formatString(with: formatStyle).formattedString
        } else {
            fieldText = text.wrappedValue
        }
    }

    var body: some View
    {
        HStack
        {
            VStack(alignment: .leading, spacing: 10)
            {
                if !title.isEmpty
                {
                    AutoSizeText(text: title)
                        .font(theme.typography.headingSmall)
                        .foregroundColor(theme.colors.textOnSurfaceDefault)
                        .frame(width: 144, height: 16, alignment: .leading)
                }

                HStack
                {
                    leftImage
                    
                    if let leftText = leftText {
                        Text(leftText)
                            .font(theme.typography.body)
                            .foregroundColor(theme.colors.textOnSurfaceDefault)
                    }

                    // FIXME: When setting the `text` of a field after the field has already been initialized, if the field has a formatStyle, then the new `text` won't be displayed
                    let textBinding = Binding(
                        get: { () -> String in
                            if formatStyle == nil
                            {
                                return text
                            }
                            else
                            {
                                return fieldText
                            }
                        },
                        set: { value in
                            if formatStyle == nil
                            {
                                text = value
                            }
                            else
                            {
                                fieldText = value
                            }
                        }
                    )

                    TextField(placeholder ?? title,
                              text: textBinding,
                              onEditingChanged: { isEditing in
                        onEdit?(isEditing)
                    })
                    .onChange(of: fieldText, perform: { _ in
                        formatText()
                    })
                    .tint(theme.colors.brand)
                    .font(theme.typography.body)
                    .foregroundColor(theme.colors.textOnSurfaceDefault)
                    .disabled(isDisabled)
                    .autocapitalization(autocapitalized)
                    .disableAutocorrection(autocorrectDisabled)
                    .textContentType(contentType)
                    .keyboardType(keyboardType)
                    .onSubmit
                    {
                        guard let onCommit = onCommit else
                        {
                            return
                        }

                        onCommit()
                    }

                    if isClearable
                    {
                        //FormFieldClearButton(fieldText: $text, onClear: onClear)
                    }
                    
                    if isAddress && text.isEmpty
                    {
                       // UseCurrentLocationButton(hasTitle: false)
                           // .setIdentifier(.locations_pickup_button_usecurrentlocation)
                    }

                    if isActionable
                    {
                        Button
                        {
                            guard let onActionPress = onActionPress else
                            {
                                return
                            }

                            onActionPress()
                        } label:
                        {
                            Text(String(localized: "Molecules.FormField.Edit"))
                                .font(theme.typography.buttonLinkBold)
                                .foregroundColor(theme.colors.actionSecondary)
                        }
                    }
                }
                .padding(10)
                .background(theme.colors.surfaceDefault)
                .cornerRadius(6)
                .overlay(
                    RoundedRectangle(cornerRadius: 6, style: .circular)
                        .stroke(theme.colors.borderDefault, lineWidth: 1)
                )
            }
        }
    }

    private func formatText() {
        guard let formatStyle = formatStyle else {
            text = fieldText

            return
        }

        let result = fieldText.formatString(with: formatStyle)

        fieldText = result.formattedString
        text = result.rawValue
    }
}
