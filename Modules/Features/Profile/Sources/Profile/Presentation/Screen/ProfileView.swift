//
//  ProfileView.swift
//
//
//  Created by Ivan Semenov on 25.04.2024.
//

import SwiftUI
import CommonUI

struct ProfileView: View {

    @StateObject private var viewModel: ProfileViewModel

    init(viewModel: ProfileViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        contentView
    }

    @ViewBuilder
    private var contentView: some View {
        switch viewModel.state {
        case .idle, .failed:
            ZStack { EmptyView() }
        case .loading:
            ProgressView().tintColor()
        case .loaded(let viewData):
            loadedView(viewData)
        }
    }
}

// MARK: - Loaded View

private extension ProfileView {

    func loadedView(_ viewData: ProfileViewModel.ViewState.ViewData) -> some View {
        VStack(spacing: .zero) {
            topBackground()
            avatarView(name: viewData.name, joinDate: viewData.joinDate)
            sectionButtons()
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .ignoresSafeArea(edges: .top)
    }

    func topBackground() -> some View {
        LinearGradient(
            colors: [Colors.appYellow.swiftUIColor, Colors.appOrange.swiftUIColor],
            startPoint: .leading,
            endPoint: .trailing
        )
        .frame(maxHeight: Constants.topBackgroundHeight)
    }

    func avatarView(name: String, joinDate: Date) -> some View {
        VStack {
            Image(systemName: Constants.Avatar.personImage)
                .resizable()
                .frame(width: Constants.Avatar.imageSize, height: Constants.Avatar.imageSize)
                .foregroundStyle(.white, Colors.appDark.swiftUIColor)
                .overlay {
                    Circle().stroke(.white, lineWidth: Constants.Avatar.borderWidth)
                }

            VStack(spacing: .zero) {
                Text(name)
                    .font(Fonts.headline4)
                    .foregroundStyle(Colors.appDark.swiftUIColor)

                Text("\(Strings.joined) \(joinDate.formatted(.dateTime.day().month().year()))")
                    .font(Fonts.paragraphSmall)
                    .foregroundStyle(Colors.appDarkGray.swiftUIColor)
                    .padding(.top, Constants.Avatar.joinDateInsetTop)
            }
            .padding(.top, Constants.Avatar.nameInsetTop)
        }
        .padding(.top, Constants.Avatar.insetTop)
    }

    func sectionButtons() -> some View {
        VStack(spacing: Constants.SectionButtons.spacing) {
            SectionButton(title: Strings.personalInfo, systemImage: Constants.SectionButtons.personImage) {

            }

            SectionButton(title: Strings.myDictionary, systemImage: Constants.SectionButtons.bookImage) {

            }

            SectionButton(title: Strings.signOut, systemImage: Constants.SectionButtons.doorImage, showsChevron: false) {

            }
        }
        .padding(.horizontal, Constants.SectionButtons.insetHorizontal)
        .padding(.vertical, Constants.SectionButtons.insetVertical)
    }
}

// MARK: - Constants

private extension ProfileView {

    enum Constants {
        static let topBackgroundHeight: CGFloat = 220

        enum Avatar {
            static let imageSize: CGFloat = 90
            static let borderWidth: CGFloat = 10
            static let personImage = "person.circle"

            static let insetTop: CGFloat = -42
            static let nameInsetTop: CGFloat = -2
            static let joinDateInsetTop: CGFloat = 2
        }

        enum SectionButtons {
            static let spacing: CGFloat = 30
            static let insetVertical: CGFloat = 35
            static let insetHorizontal: CGFloat = 20
            static let doorImage = "door.left.hand.open"
            static let bookImage = "text.book.closed.fill"
            static let personImage = "person.crop.circle.fill"
        }
    }
}
