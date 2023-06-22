module Evergreen.Migrate.V19 exposing (..)

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

import Evergreen.V18.Types
import Evergreen.V19.Types
import Lamdera.Migrations exposing (..)
import List


frontendModel : Evergreen.V18.Types.FrontendModel -> ModelMigration Evergreen.V19.Types.FrontendModel Evergreen.V19.Types.FrontendMsg
frontendModel old =
    ModelMigrated ( migrate_Types_FrontendModel old, Cmd.none )


backendModel : Evergreen.V18.Types.BackendModel -> ModelMigration Evergreen.V19.Types.BackendModel Evergreen.V19.Types.BackendMsg
backendModel old =
    ModelUnchanged


frontendMsg : Evergreen.V18.Types.FrontendMsg -> MsgMigration Evergreen.V19.Types.FrontendMsg Evergreen.V19.Types.FrontendMsg
frontendMsg old =
    MsgMigrated ( migrate_Types_FrontendMsg old, Cmd.none )


toBackend : Evergreen.V18.Types.ToBackend -> MsgMigration Evergreen.V19.Types.ToBackend Evergreen.V19.Types.BackendMsg
toBackend old =
    MsgUnchanged


backendMsg : Evergreen.V18.Types.BackendMsg -> MsgMigration Evergreen.V19.Types.BackendMsg Evergreen.V19.Types.BackendMsg
backendMsg old =
    MsgUnchanged


toFrontend : Evergreen.V18.Types.ToFrontend -> MsgMigration Evergreen.V19.Types.ToFrontend Evergreen.V19.Types.FrontendMsg
toFrontend old =
    MsgUnchanged


migrate_Types_FrontendModel : Evergreen.V18.Types.FrontendModel -> Evergreen.V19.Types.FrontendModel
migrate_Types_FrontendModel old =
    { key = old.key
    , url = old.url
    , message = old.message
    , messages = old.messages |> List.map migrate_Types_Message
    , appState = old.appState |> migrate_Types_AppState
    , appMode = old.appMode |> migrate_Types_AppMode
    , currentTime = old.currentTime
    , pressedKeys = []
    , users = old.users
    , books = old.books |> List.map migrate_Types_Book
    , currentBook = old.currentBook |> migrate_Types_Book
    , cellContent = old.cellContent
    , currentCellIndex = 0
    , signupState = old.signupState |> migrate_Types_SignupState
    , currentUser = old.currentUser
    , inputUsername = old.inputUsername
    , inputSignupUsername = old.inputSignupUsername
    , inputEmail = old.inputEmail
    , inputRealname = old.inputRealname
    , inputPassword = old.inputPassword
    , inputPasswordAgain = old.inputPasswordAgain
    , inputTitle = old.inputTitle
    , windowWidth = old.windowWidth
    , windowHeight = old.windowHeight
    , popupState = old.popupState |> migrate_Types_PopupState
    , showEditor = old.showEditor
    }


migrate_Types_AppMode : Evergreen.V18.Types.AppMode -> Evergreen.V19.Types.AppMode
migrate_Types_AppMode old =
    case old of
        Evergreen.V18.Types.AMWorking ->
            Evergreen.V19.Types.AMWorking

        Evergreen.V18.Types.AMEditTitle ->
            Evergreen.V19.Types.AMEditTitle


migrate_Types_AppState : Evergreen.V18.Types.AppState -> Evergreen.V19.Types.AppState
migrate_Types_AppState old =
    case old of
        Evergreen.V18.Types.Loading ->
            Evergreen.V19.Types.Loading

        Evergreen.V18.Types.Loaded ->
            Evergreen.V19.Types.Loaded


migrate_Types_Book : Evergreen.V18.Types.Book -> Evergreen.V19.Types.Book
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


migrate_Types_Cell : Evergreen.V18.Types.Cell -> Evergreen.V19.Types.Cell
migrate_Types_Cell old =
    { index = old.index
    , text = old.text
    , value = old.value
    , cellState = old.cellState |> migrate_Types_CellState
    }


migrate_Types_CellState : Evergreen.V18.Types.CellState -> Evergreen.V19.Types.CellState
migrate_Types_CellState old =
    case old of
        Evergreen.V18.Types.CSEdit ->
            Evergreen.V19.Types.CSEdit

        Evergreen.V18.Types.CSView ->
            Evergreen.V19.Types.CSView


migrate_Types_FrontendMsg : Evergreen.V18.Types.FrontendMsg -> Evergreen.V19.Types.FrontendMsg
migrate_Types_FrontendMsg old =
    case old of
        Evergreen.V18.Types.UrlClicked p0 ->
            Evergreen.V19.Types.UrlClicked p0

        Evergreen.V18.Types.UrlChanged p0 ->
            Evergreen.V19.Types.UrlChanged p0

        Evergreen.V18.Types.NoOpFrontendMsg ->
            Evergreen.V19.Types.NoOpFrontendMsg

        Evergreen.V18.Types.FETick p0 ->
            Evergreen.V19.Types.FETick p0

        Evergreen.V18.Types.NewCell p0 ->
            Evergreen.V19.Types.NewCell p0

        Evergreen.V18.Types.EditCell p0 ->
            Evergreen.V19.Types.EditCell p0

        Evergreen.V18.Types.ClearCell p0 ->
            Evergreen.V19.Types.ClearCell p0

        Evergreen.V18.Types.EvalCell p0 ->
            Evergreen.V19.Types.EvalCell p0

        Evergreen.V18.Types.InputElmCode p0 p1 ->
            Evergreen.V19.Types.InputElmCode p0 p1

        Evergreen.V18.Types.UpdateNotebookTitle ->
            Evergreen.V19.Types.UpdateNotebookTitle

        Evergreen.V18.Types.NewNotebook ->
            Evergreen.V19.Types.NewNotebook

        Evergreen.V18.Types.ChangeAppMode p0 ->
            Evergreen.V19.Types.ChangeAppMode (p0 |> migrate_Types_AppMode)

        Evergreen.V18.Types.SetCurrentNotebook p0 ->
            Evergreen.V19.Types.SetCurrentNotebook (p0 |> migrate_Types_Book)

        Evergreen.V18.Types.ChangePopup p0 ->
            Evergreen.V19.Types.ChangePopup (p0 |> migrate_Types_PopupState)

        Evergreen.V18.Types.GotViewport p0 ->
            Evergreen.V19.Types.GotViewport p0

        Evergreen.V18.Types.GotNewWindowDimensions p0 p1 ->
            Evergreen.V19.Types.GotNewWindowDimensions p0 p1

        Evergreen.V18.Types.SignUp ->
            Evergreen.V19.Types.SignUp

        Evergreen.V18.Types.SignIn ->
            Evergreen.V19.Types.SignIn

        Evergreen.V18.Types.SignOut ->
            Evergreen.V19.Types.SignOut

        Evergreen.V18.Types.SetSignupState p0 ->
            Evergreen.V19.Types.SetSignupState (p0 |> migrate_Types_SignupState)

        Evergreen.V18.Types.InputUsername p0 ->
            Evergreen.V19.Types.InputUsername p0

        Evergreen.V18.Types.InputSignupUsername p0 ->
            Evergreen.V19.Types.InputSignupUsername p0

        Evergreen.V18.Types.InputPassword p0 ->
            Evergreen.V19.Types.InputPassword p0

        Evergreen.V18.Types.InputPasswordAgain p0 ->
            Evergreen.V19.Types.InputPasswordAgain p0

        Evergreen.V18.Types.InputEmail p0 ->
            Evergreen.V19.Types.InputEmail p0

        Evergreen.V18.Types.InputTitle p0 ->
            Evergreen.V19.Types.InputTitle p0

        Evergreen.V18.Types.AdminRunTask ->
            Evergreen.V19.Types.AdminRunTask

        Evergreen.V18.Types.GetUsers ->
            Evergreen.V19.Types.GetUsers


migrate_Types_Message : Evergreen.V18.Types.Message -> Evergreen.V19.Types.Message
migrate_Types_Message old =
    { txt = old.txt
    , status = old.status |> migrate_Types_MessageStatus
    }


migrate_Types_MessageStatus : Evergreen.V18.Types.MessageStatus -> Evergreen.V19.Types.MessageStatus
migrate_Types_MessageStatus old =
    case old of
        Evergreen.V18.Types.MSWhite ->
            Evergreen.V19.Types.MSWhite

        Evergreen.V18.Types.MSYellow ->
            Evergreen.V19.Types.MSYellow

        Evergreen.V18.Types.MSGreen ->
            Evergreen.V19.Types.MSGreen

        Evergreen.V18.Types.MSRed ->
            Evergreen.V19.Types.MSRed


migrate_Types_PopupState : Evergreen.V18.Types.PopupState -> Evergreen.V19.Types.PopupState
migrate_Types_PopupState old =
    case old of
        Evergreen.V18.Types.NoPopup ->
            Evergreen.V19.Types.NoPopup

        Evergreen.V18.Types.AdminPopup ->
            Evergreen.V19.Types.AdminPopup

        Evergreen.V18.Types.SignUpPopup ->
            Evergreen.V19.Types.SignUpPopup

        Evergreen.V18.Types.NewNotebookPopup ->
            Evergreen.V19.Types.NewNotebookPopup


migrate_Types_SignupState : Evergreen.V18.Types.SignupState -> Evergreen.V19.Types.SignupState
migrate_Types_SignupState old =
    case old of
        Evergreen.V18.Types.ShowSignUpForm ->
            Evergreen.V19.Types.ShowSignUpForm

        Evergreen.V18.Types.HideSignUpForm ->
            Evergreen.V19.Types.HideSignUpForm