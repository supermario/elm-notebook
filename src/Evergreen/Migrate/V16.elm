module Evergreen.Migrate.V16 exposing (..)

{-| This migration file was automatically generated by the lamdera compiler.

It includes:

  - A migration for each of the 6 Lamdera core types that has changed
  - A function named `migrate_ModuleName_TypeName` for each changed/custom type

Expect to see:

  - `Unimplementеd` values as placeholders wherever I was unable to figure out a clear migration path for you
  - `@NOTICE` comments for things you should know about, i.e. new custom type constructors that won't get any
    value mappings from the old type by default

You can edit this file however you wish! It won't be generated again.

See <https://dashboard.lamdera.com/docs/evergreen> for more info.

-}

import Evergreen.V16.Types
import Evergreen.V9.Types
import Lamdera.Migrations exposing (..)
import List


frontendModel : Evergreen.V9.Types.FrontendModel -> ModelMigration Evergreen.V16.Types.FrontendModel Evergreen.V16.Types.FrontendMsg
frontendModel old =
    ModelMigrated ( migrate_Types_FrontendModel old, Cmd.none )


backendModel : Evergreen.V9.Types.BackendModel -> ModelMigration Evergreen.V16.Types.BackendModel Evergreen.V16.Types.BackendMsg
backendModel old =
    ModelUnchanged


frontendMsg : Evergreen.V9.Types.FrontendMsg -> MsgMigration Evergreen.V16.Types.FrontendMsg Evergreen.V16.Types.FrontendMsg
frontendMsg old =
    MsgMigrated ( migrate_Types_FrontendMsg old, Cmd.none )


toBackend : Evergreen.V9.Types.ToBackend -> MsgMigration Evergreen.V16.Types.ToBackend Evergreen.V16.Types.BackendMsg
toBackend old =
    MsgUnchanged


backendMsg : Evergreen.V9.Types.BackendMsg -> MsgMigration Evergreen.V16.Types.BackendMsg Evergreen.V16.Types.BackendMsg
backendMsg old =
    MsgUnchanged


toFrontend : Evergreen.V9.Types.ToFrontend -> MsgMigration Evergreen.V16.Types.ToFrontend Evergreen.V16.Types.FrontendMsg
toFrontend old =
    MsgUnchanged


migrate_Types_FrontendModel : Evergreen.V9.Types.FrontendModel -> Evergreen.V16.Types.FrontendModel
migrate_Types_FrontendModel old =
    { key = old.key
    , url = old.url
    , message = old.message
    , messages = old.messages |> List.map migrate_Types_Message
    , appState = old.appState |> migrate_Types_AppState
    , appMode = Evergreen.V16.Types.AMWorking
    , currentTime = old.currentTime
    , users = old.users
    , books = old.books |> List.map migrate_Types_Book
    , currentBook = old.currentBook |> migrate_Types_Book
    , cellContent = old.cellContent
    , signupState = old.signupState |> migrate_Types_SignupState
    , currentUser = old.currentUser
    , inputUsername = old.inputUsername
    , inputSignupUsername = old.inputSignupUsername
    , inputEmail = old.inputEmail
    , inputRealname = old.inputRealname
    , inputPassword = old.inputPassword
    , inputPasswordAgain = old.inputPasswordAgain
    , inputTitle = ""
    , windowWidth = old.windowWidth
    , windowHeight = old.windowHeight
    , popupState = old.popupState |> migrate_Types_PopupState
    , showEditor = old.showEditor
    }


migrate_Types_AppState : Evergreen.V9.Types.AppState -> Evergreen.V16.Types.AppState
migrate_Types_AppState old =
    case old of
        Evergreen.V9.Types.Loading ->
            Evergreen.V16.Types.Loading

        Evergreen.V9.Types.Loaded ->
            Evergreen.V16.Types.Loaded


migrate_Types_Book : Evergreen.V9.Types.Book -> Evergreen.V16.Types.Book
migrate_Types_Book old =
    { id = old.id
    , dirty = old.dirty
    , slug = old.slug
    , author = old.author
    , createdAt = old.createdAt
    , updatedAt = old.updatedAt
    , public = old.public
    , title = old.title
    , cells = old.cells |> List.map migrate_Types_Cell
    , currentIndex = old.currentIndex
    }


migrate_Types_Cell : Evergreen.V9.Types.Cell -> Evergreen.V16.Types.Cell
migrate_Types_Cell old =
    { index = old.index
    , text = old.text
    , value = old.value
    , cellState = old.cellState |> migrate_Types_CellState
    }


migrate_Types_CellState : Evergreen.V9.Types.CellState -> Evergreen.V16.Types.CellState
migrate_Types_CellState old =
    case old of
        Evergreen.V9.Types.CSEdit ->
            Evergreen.V16.Types.CSEdit

        Evergreen.V9.Types.CSView ->
            Evergreen.V16.Types.CSView


migrate_Types_FrontendMsg : Evergreen.V9.Types.FrontendMsg -> Evergreen.V16.Types.FrontendMsg
migrate_Types_FrontendMsg old =
    case old of
        Evergreen.V9.Types.UrlClicked p0 ->
            Evergreen.V16.Types.UrlClicked p0

        Evergreen.V9.Types.UrlChanged p0 ->
            Evergreen.V16.Types.UrlChanged p0

        Evergreen.V9.Types.NoOpFrontendMsg ->
            Evergreen.V16.Types.NoOpFrontendMsg

        Evergreen.V9.Types.FETick p0 ->
            Evergreen.V16.Types.FETick p0

        Evergreen.V9.Types.NewCell p0 ->
            Evergreen.V16.Types.NewCell p0

        Evergreen.V9.Types.EditCell p0 ->
            Evergreen.V16.Types.EditCell p0

        Evergreen.V9.Types.ClearCell p0 ->
            Evergreen.V16.Types.ClearCell p0

        Evergreen.V9.Types.EvalCell p0 ->
            Evergreen.V16.Types.EvalCell p0

        Evergreen.V9.Types.InputElmCode p0 p1 ->
            Evergreen.V16.Types.InputElmCode p0 p1

        Evergreen.V9.Types.ChangePopup p0 ->
            Evergreen.V16.Types.ChangePopup (p0 |> migrate_Types_PopupState)

        Evergreen.V9.Types.GotViewport p0 ->
            Evergreen.V16.Types.GotViewport p0

        Evergreen.V9.Types.GotNewWindowDimensions p0 p1 ->
            Evergreen.V16.Types.GotNewWindowDimensions p0 p1

        Evergreen.V9.Types.SignUp ->
            Evergreen.V16.Types.SignUp

        Evergreen.V9.Types.SignIn ->
            Evergreen.V16.Types.SignIn

        Evergreen.V9.Types.SignOut ->
            Evergreen.V16.Types.SignOut

        Evergreen.V9.Types.SetSignupState p0 ->
            Evergreen.V16.Types.SetSignupState (p0 |> migrate_Types_SignupState)

        Evergreen.V9.Types.InputUsername p0 ->
            Evergreen.V16.Types.InputUsername p0

        Evergreen.V9.Types.InputSignupUsername p0 ->
            Evergreen.V16.Types.InputSignupUsername p0

        Evergreen.V9.Types.InputPassword p0 ->
            Evergreen.V16.Types.InputPassword p0

        Evergreen.V9.Types.InputPasswordAgain p0 ->
            Evergreen.V16.Types.InputPasswordAgain p0

        Evergreen.V9.Types.InputEmail p0 ->
            Evergreen.V16.Types.InputEmail p0

        Evergreen.V9.Types.AdminRunTask ->
            Evergreen.V16.Types.AdminRunTask

        Evergreen.V9.Types.GetUsers ->
            Evergreen.V16.Types.GetUsers


migrate_Types_Message : Evergreen.V9.Types.Message -> Evergreen.V16.Types.Message
migrate_Types_Message old =
    { txt = old.txt
    , status = old.status |> migrate_Types_MessageStatus
    }


migrate_Types_MessageStatus : Evergreen.V9.Types.MessageStatus -> Evergreen.V16.Types.MessageStatus
migrate_Types_MessageStatus old =
    case old of
        Evergreen.V9.Types.MSWhite ->
            Evergreen.V16.Types.MSWhite

        Evergreen.V9.Types.MSYellow ->
            Evergreen.V16.Types.MSYellow

        Evergreen.V9.Types.MSGreen ->
            Evergreen.V16.Types.MSGreen

        Evergreen.V9.Types.MSRed ->
            Evergreen.V16.Types.MSRed


migrate_Types_PopupState : Evergreen.V9.Types.PopupState -> Evergreen.V16.Types.PopupState
migrate_Types_PopupState old =
    case old of
        Evergreen.V9.Types.NoPopup ->
            Evergreen.V16.Types.NoPopup

        Evergreen.V9.Types.AdminPopup ->
            Evergreen.V16.Types.AdminPopup

        Evergreen.V9.Types.SignUpPopup ->
            Evergreen.V16.Types.SignUpPopup

        Evergreen.V9.Types.NewNotebookPopup ->
            Evergreen.V16.Types.NewNotebookPopup


migrate_Types_SignupState : Evergreen.V9.Types.SignupState -> Evergreen.V16.Types.SignupState
migrate_Types_SignupState old =
    case old of
        Evergreen.V9.Types.ShowSignUpForm ->
            Evergreen.V16.Types.ShowSignUpForm

        Evergreen.V9.Types.HideSignUpForm ->
            Evergreen.V16.Types.HideSignUpForm