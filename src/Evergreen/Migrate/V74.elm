module Evergreen.Migrate.V74 exposing (..)

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

import Dict
import Evergreen.V73.LiveBook.DataSet
import Evergreen.V73.LiveBook.Types
import Evergreen.V73.Types
import Evergreen.V74.LiveBook.DataSet
import Evergreen.V74.LiveBook.Types
import Evergreen.V74.Types
import Lamdera.Migrations exposing (..)
import List


frontendModel : Evergreen.V73.Types.FrontendModel -> ModelMigration Evergreen.V74.Types.FrontendModel Evergreen.V74.Types.FrontendMsg
frontendModel old =
    ModelMigrated ( migrate_Types_FrontendModel old, Cmd.none )


backendModel : Evergreen.V73.Types.BackendModel -> ModelMigration Evergreen.V74.Types.BackendModel Evergreen.V74.Types.BackendMsg
backendModel old =
    ModelUnchanged


frontendMsg : Evergreen.V73.Types.FrontendMsg -> MsgMigration Evergreen.V74.Types.FrontendMsg Evergreen.V74.Types.FrontendMsg
frontendMsg old =
    MsgUnchanged


toBackend : Evergreen.V73.Types.ToBackend -> MsgMigration Evergreen.V74.Types.ToBackend Evergreen.V74.Types.BackendMsg
toBackend old =
    MsgUnchanged


backendMsg : Evergreen.V73.Types.BackendMsg -> MsgMigration Evergreen.V74.Types.BackendMsg Evergreen.V74.Types.BackendMsg
backendMsg old =
    MsgUnchanged


toFrontend : Evergreen.V73.Types.ToFrontend -> MsgMigration Evergreen.V74.Types.ToFrontend Evergreen.V74.Types.FrontendMsg
toFrontend old =
    MsgUnchanged


migrate_Types_FrontendModel : Evergreen.V73.Types.FrontendModel -> Evergreen.V74.Types.FrontendModel
migrate_Types_FrontendModel old =
    { key = old.key
    , url = old.url
    , message = old.message
    , messages = old.messages |> List.map migrate_Types_Message
    , appState = old.appState |> migrate_Types_AppState
    , appMode = old.appMode |> migrate_Types_AppMode
    , currentTime = old.currentTime
    , tickCount = old.tickCount
    , clockState = old.clockState |> migrate_Types_ClockState
    , pressedKeys = old.pressedKeys
    , randomSeed = old.randomSeed
    , randomProbabilities = old.randomProbabilities
    , probabilityVectorLength = old.probabilityVectorLength
    , users = old.users
    , inputName = old.inputName
    , inputIdentifier = old.inputIdentifier
    , inputAuthor = old.inputAuthor
    , inputDescription = old.inputDescription
    , inputComments = old.inputComments
    , inputData = old.inputData
    , publicDataSetMetaDataList = old.publicDataSetMetaDataList
    , privateDataSetMetaDataList = old.privateDataSetMetaDataList
    , kvDict = old.kvDict
    , books = old.books |> List.map migrate_LiveBook_Types_Book
    , currentBook = old.currentBook |> migrate_LiveBook_Types_Book
    , cellContent = old.cellContent
    , currentCellIndex = old.currentCellIndex
    , cloneReference = old.cloneReference
    , deleteNotebookState = old.deleteNotebookState |> migrate_Types_DeleteNotebookState
    , showNotebooks = old.showNotebooks |> migrate_Types_ShowNotebooks
    , valueDict = Dict.empty
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


migrate_LiveBook_DataSet_DataSetMetaData : Evergreen.V73.LiveBook.DataSet.DataSetMetaData -> Evergreen.V74.LiveBook.DataSet.DataSetMetaData
migrate_LiveBook_DataSet_DataSetMetaData old =
    old


migrate_LiveBook_Types_Book : Evergreen.V73.LiveBook.Types.Book -> Evergreen.V74.LiveBook.Types.Book
migrate_LiveBook_Types_Book old =
    { id = old.id
    , dirty = old.dirty
    , slug = old.slug
    , origin = old.origin
    , author = old.author
    , createdAt = old.createdAt
    , updatedAt = old.updatedAt
    , public = old.public
    , title = old.title
    , cells = old.cells |> List.map migrate_LiveBook_Types_Cell
    , currentIndex = old.currentIndex
    }


migrate_LiveBook_Types_Cell : Evergreen.V73.LiveBook.Types.Cell -> Evergreen.V74.LiveBook.Types.Cell
migrate_LiveBook_Types_Cell old =
    { index = old.index
    , text = old.text
    , bindings = old.bindings
    , expression = old.expression
    , value = old.value |> migrate_LiveBook_Types_CellValue
    , cellState = old.cellState |> migrate_LiveBook_Types_CellState
    , locked = old.locked
    }


migrate_LiveBook_Types_CellState : Evergreen.V73.LiveBook.Types.CellState -> Evergreen.V74.LiveBook.Types.CellState
migrate_LiveBook_Types_CellState old =
    case old of
        Evergreen.V73.LiveBook.Types.CSEdit ->
            Evergreen.V74.LiveBook.Types.CSEdit

        Evergreen.V73.LiveBook.Types.CSView ->
            Evergreen.V74.LiveBook.Types.CSView


migrate_LiveBook_Types_CellValue : Evergreen.V73.LiveBook.Types.CellValue -> Evergreen.V74.LiveBook.Types.CellValue
migrate_LiveBook_Types_CellValue old =
    case old of
        Evergreen.V73.LiveBook.Types.CVNone ->
            Evergreen.V74.LiveBook.Types.CVNone

        Evergreen.V73.LiveBook.Types.CVString p0 ->
            Evergreen.V74.LiveBook.Types.CVString p0

        Evergreen.V73.LiveBook.Types.CVVisual p0 p1 ->
            Evergreen.V74.LiveBook.Types.CVVisual (p0 |> migrate_LiveBook_Types_VisualType) p1


migrate_LiveBook_Types_VisualType : Evergreen.V73.LiveBook.Types.VisualType -> Evergreen.V74.LiveBook.Types.VisualType
migrate_LiveBook_Types_VisualType old =
    case old of
        Evergreen.V73.LiveBook.Types.VTChart ->
            Evergreen.V74.LiveBook.Types.VTChart

        Evergreen.V73.LiveBook.Types.VTPlot2D ->
            Evergreen.V74.LiveBook.Types.VTPlot2D

        Evergreen.V73.LiveBook.Types.VTSvg ->
            Evergreen.V74.LiveBook.Types.VTSvg

        Evergreen.V73.LiveBook.Types.VTImage ->
            Evergreen.V74.LiveBook.Types.VTImage


migrate_Types_AppMode : Evergreen.V73.Types.AppMode -> Evergreen.V74.Types.AppMode
migrate_Types_AppMode old =
    case old of
        Evergreen.V73.Types.AMWorking ->
            Evergreen.V74.Types.AMWorking

        Evergreen.V73.Types.AMEditTitle ->
            Evergreen.V74.Types.AMEditTitle


migrate_Types_AppState : Evergreen.V73.Types.AppState -> Evergreen.V74.Types.AppState
migrate_Types_AppState old =
    case old of
        Evergreen.V73.Types.Loading ->
            Evergreen.V74.Types.Loading

        Evergreen.V73.Types.Loaded ->
            Evergreen.V74.Types.Loaded


migrate_Types_ClockState : Evergreen.V73.Types.ClockState -> Evergreen.V74.Types.ClockState
migrate_Types_ClockState old =
    case old of
        Evergreen.V73.Types.ClockRunning ->
            Evergreen.V74.Types.ClockRunning

        Evergreen.V73.Types.ClockStopped ->
            Evergreen.V74.Types.ClockStopped

        Evergreen.V73.Types.ClockPaused ->
            Evergreen.V74.Types.ClockPaused


migrate_Types_DeleteNotebookState : Evergreen.V73.Types.DeleteNotebookState -> Evergreen.V74.Types.DeleteNotebookState
migrate_Types_DeleteNotebookState old =
    case old of
        Evergreen.V73.Types.WaitingToDeleteNotebook ->
            Evergreen.V74.Types.WaitingToDeleteNotebook

        Evergreen.V73.Types.CanDeleteNotebook ->
            Evergreen.V74.Types.CanDeleteNotebook


migrate_Types_Message : Evergreen.V73.Types.Message -> Evergreen.V74.Types.Message
migrate_Types_Message old =
    { txt = old.txt
    , status = old.status |> migrate_Types_MessageStatus
    }


migrate_Types_MessageStatus : Evergreen.V73.Types.MessageStatus -> Evergreen.V74.Types.MessageStatus
migrate_Types_MessageStatus old =
    case old of
        Evergreen.V73.Types.MSWhite ->
            Evergreen.V74.Types.MSWhite

        Evergreen.V73.Types.MSYellow ->
            Evergreen.V74.Types.MSYellow

        Evergreen.V73.Types.MSGreen ->
            Evergreen.V74.Types.MSGreen

        Evergreen.V73.Types.MSRed ->
            Evergreen.V74.Types.MSRed


migrate_Types_PopupState : Evergreen.V73.Types.PopupState -> Evergreen.V74.Types.PopupState
migrate_Types_PopupState old =
    case old of
        Evergreen.V73.Types.NoPopup ->
            Evergreen.V74.Types.NoPopup

        Evergreen.V73.Types.AdminPopup ->
            Evergreen.V74.Types.AdminPopup

        Evergreen.V73.Types.ManualPopup ->
            Evergreen.V74.Types.ManualPopup

        Evergreen.V73.Types.NewDataSetPopup ->
            Evergreen.V74.Types.NewDataSetPopup

        Evergreen.V73.Types.EditDataSetPopup p0 ->
            Evergreen.V74.Types.EditDataSetPopup (p0 |> migrate_LiveBook_DataSet_DataSetMetaData)

        Evergreen.V73.Types.SignUpPopup ->
            Evergreen.V74.Types.SignUpPopup

        Evergreen.V73.Types.NewNotebookPopup ->
            Evergreen.V74.Types.NewNotebookPopup

        Evergreen.V73.Types.ViewPublicDataSetsPopup ->
            Evergreen.V74.Types.ViewPublicDataSetsPopup

        Evergreen.V73.Types.ViewPrivateDataSetsPopup ->
            Evergreen.V74.Types.ViewPrivateDataSetsPopup


migrate_Types_ShowNotebooks : Evergreen.V73.Types.ShowNotebooks -> Evergreen.V74.Types.ShowNotebooks
migrate_Types_ShowNotebooks old =
    case old of
        Evergreen.V73.Types.ShowUserNotebooks ->
            Evergreen.V74.Types.ShowUserNotebooks

        Evergreen.V73.Types.ShowPublicNotebooks ->
            Evergreen.V74.Types.ShowPublicNotebooks


migrate_Types_SignupState : Evergreen.V73.Types.SignupState -> Evergreen.V74.Types.SignupState
migrate_Types_SignupState old =
    case old of
        Evergreen.V73.Types.ShowSignUpForm ->
            Evergreen.V74.Types.ShowSignUpForm

        Evergreen.V73.Types.HideSignUpForm ->
            Evergreen.V74.Types.HideSignUpForm
