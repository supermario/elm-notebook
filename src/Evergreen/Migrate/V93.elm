module Evergreen.Migrate.V93 exposing (..)

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

import Evergreen.V90.LiveBook.DataSet
import Evergreen.V90.LiveBook.Types
import Evergreen.V90.Types
import Evergreen.V90.User
import Evergreen.V93.LiveBook.DataSet
import Evergreen.V93.LiveBook.Types
import Evergreen.V93.Types
import Evergreen.V93.User
import Lamdera.Migrations exposing (..)
import List


frontendModel : Evergreen.V90.Types.FrontendModel -> ModelMigration Evergreen.V93.Types.FrontendModel Evergreen.V93.Types.FrontendMsg
frontendModel old =
    ModelUnchanged


backendModel : Evergreen.V90.Types.BackendModel -> ModelMigration Evergreen.V93.Types.BackendModel Evergreen.V93.Types.BackendMsg
backendModel old =
    ModelUnchanged


frontendMsg : Evergreen.V90.Types.FrontendMsg -> MsgMigration Evergreen.V93.Types.FrontendMsg Evergreen.V93.Types.FrontendMsg
frontendMsg old =
    MsgMigrated ( migrate_Types_FrontendMsg old, Cmd.none )


toBackend : Evergreen.V90.Types.ToBackend -> MsgMigration Evergreen.V93.Types.ToBackend Evergreen.V93.Types.BackendMsg
toBackend old =
    MsgMigrated ( migrate_Types_ToBackend old, Cmd.none )


backendMsg : Evergreen.V90.Types.BackendMsg -> MsgMigration Evergreen.V93.Types.BackendMsg Evergreen.V93.Types.BackendMsg
backendMsg old =
    MsgUnchanged


toFrontend : Evergreen.V90.Types.ToFrontend -> MsgMigration Evergreen.V93.Types.ToFrontend Evergreen.V93.Types.FrontendMsg
toFrontend old =
    MsgUnchanged


migrate_LiveBook_DataSet_DataSet : Evergreen.V90.LiveBook.DataSet.DataSet -> Evergreen.V93.LiveBook.DataSet.DataSet
migrate_LiveBook_DataSet_DataSet old =
    old


migrate_LiveBook_DataSet_DataSetMetaData : Evergreen.V90.LiveBook.DataSet.DataSetMetaData -> Evergreen.V93.LiveBook.DataSet.DataSetMetaData
migrate_LiveBook_DataSet_DataSetMetaData old =
    old


migrate_LiveBook_Types_Book : Evergreen.V90.LiveBook.Types.Book -> Evergreen.V93.LiveBook.Types.Book
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
    , initialStateString = old.initialStateString
    , stateExpression = old.stateExpression
    , stateBindings = old.stateBindings
    }


migrate_LiveBook_Types_Cell : Evergreen.V90.LiveBook.Types.Cell -> Evergreen.V93.LiveBook.Types.Cell
migrate_LiveBook_Types_Cell old =
    { index = old.index
    , text = old.text
    , bindings = old.bindings
    , expression = old.expression
    , value = old.value |> migrate_LiveBook_Types_CellValue
    , cellState = old.cellState |> migrate_LiveBook_Types_CellState
    , locked = old.locked
    }


migrate_LiveBook_Types_CellState : Evergreen.V90.LiveBook.Types.CellState -> Evergreen.V93.LiveBook.Types.CellState
migrate_LiveBook_Types_CellState old =
    case old of
        Evergreen.V90.LiveBook.Types.CSEdit ->
            Evergreen.V93.LiveBook.Types.CSEdit

        Evergreen.V90.LiveBook.Types.CSView ->
            Evergreen.V93.LiveBook.Types.CSView


migrate_LiveBook_Types_CellValue : Evergreen.V90.LiveBook.Types.CellValue -> Evergreen.V93.LiveBook.Types.CellValue
migrate_LiveBook_Types_CellValue old =
    case old of
        Evergreen.V90.LiveBook.Types.CVNone ->
            Evergreen.V93.LiveBook.Types.CVNone

        Evergreen.V90.LiveBook.Types.CVString p0 ->
            Evergreen.V93.LiveBook.Types.CVString p0

        Evergreen.V90.LiveBook.Types.CVVisual p0 p1 ->
            Evergreen.V93.LiveBook.Types.CVVisual (p0 |> migrate_LiveBook_Types_VisualType) p1

        Evergreen.V90.LiveBook.Types.CVPlot2D p0 p1 ->
            Evergreen.V93.LiveBook.Types.CVPlot2D p0 p1


migrate_LiveBook_Types_VisualType : Evergreen.V90.LiveBook.Types.VisualType -> Evergreen.V93.LiveBook.Types.VisualType
migrate_LiveBook_Types_VisualType old =
    case old of
        Evergreen.V90.LiveBook.Types.VTChart ->
            Evergreen.V93.LiveBook.Types.VTChart

        Evergreen.V90.LiveBook.Types.VTSvg ->
            Evergreen.V93.LiveBook.Types.VTSvg

        Evergreen.V90.LiveBook.Types.VTImage ->
            Evergreen.V93.LiveBook.Types.VTImage


migrate_Types_AppMode : Evergreen.V90.Types.AppMode -> Evergreen.V93.Types.AppMode
migrate_Types_AppMode old =
    case old of
        Evergreen.V90.Types.AMWorking ->
            Evergreen.V93.Types.AMWorking

        Evergreen.V90.Types.AMEditTitle ->
            Evergreen.V93.Types.AMEditTitle


migrate_Types_ClockState : Evergreen.V90.Types.ClockState -> Evergreen.V93.Types.ClockState
migrate_Types_ClockState old =
    case old of
        Evergreen.V90.Types.ClockRunning ->
            Evergreen.V93.Types.ClockRunning

        Evergreen.V90.Types.ClockStopped ->
            Evergreen.V93.Types.ClockStopped

        Evergreen.V90.Types.ClockPaused ->
            Evergreen.V93.Types.ClockPaused


migrate_Types_DataSetDescription : Evergreen.V90.Types.DataSetDescription -> Evergreen.V93.Types.DataSetDescription
migrate_Types_DataSetDescription old =
    case old of
        Evergreen.V90.Types.PublicDatasets ->
            Evergreen.V93.Types.PublicDatasets

        Evergreen.V90.Types.UserDatasets p0 ->
            Evergreen.V93.Types.UserDatasets p0


migrate_Types_FrontendMsg : Evergreen.V90.Types.FrontendMsg -> Evergreen.V93.Types.FrontendMsg
migrate_Types_FrontendMsg old =
    case old of
        Evergreen.V90.Types.UrlClicked p0 ->
            Evergreen.V93.Types.UrlClicked p0

        Evergreen.V90.Types.UrlChanged p0 ->
            Evergreen.V93.Types.UrlChanged p0

        Evergreen.V90.Types.NoOpFrontendMsg ->
            Evergreen.V93.Types.NoOpFrontendMsg

        Evergreen.V90.Types.FETick p0 ->
            Evergreen.V93.Types.FETick p0

        Evergreen.V90.Types.FastTick p0 ->
            Evergreen.V93.Types.FastTick p0

        Evergreen.V90.Types.KeyboardMsg p0 ->
            Evergreen.V93.Types.KeyboardMsg p0

        Evergreen.V90.Types.GetRandomProbabilities p0 ->
            Evergreen.V93.Types.GetRandomProbabilities p0

        Evergreen.V90.Types.GotRandomProbabilities p0 ->
            Evergreen.V93.Types.GotRandomProbabilities p0

        Evergreen.V90.Types.StringDataRequested p0 p1 ->
            Evergreen.V93.Types.StringDataRequested p0 p1

        Evergreen.V90.Types.StringDataSelected p0 p1 p2 ->
            Evergreen.V93.Types.StringDataSelected p0 p1 p2

        Evergreen.V90.Types.StringDataLoaded p0 p1 p2 p3 ->
            Evergreen.V93.Types.StringDataLoaded p0 p1 p2 p3

        Evergreen.V90.Types.InputName p0 ->
            Evergreen.V93.Types.InputName p0

        Evergreen.V90.Types.InputIdentifier p0 ->
            Evergreen.V93.Types.InputIdentifier p0

        Evergreen.V90.Types.InputDescription p0 ->
            Evergreen.V93.Types.InputDescription p0

        Evergreen.V90.Types.InputComments p0 ->
            Evergreen.V93.Types.InputComments p0

        Evergreen.V90.Types.InputData p0 ->
            Evergreen.V93.Types.InputData p0

        Evergreen.V90.Types.InputAuthor p0 ->
            Evergreen.V93.Types.InputAuthor p0

        Evergreen.V90.Types.InputInitialStateValue p0 ->
            Evergreen.V93.Types.InputInitialStateValue p0

        Evergreen.V90.Types.InputStateExpression p0 ->
            Evergreen.V93.Types.InputStateExpression p0

        Evergreen.V90.Types.InputStateBindings p0 ->
            Evergreen.V93.Types.InputStateBindings p0

        Evergreen.V90.Types.AskToListDataSets p0 ->
            Evergreen.V93.Types.AskToListDataSets (p0 |> migrate_Types_DataSetDescription)

        Evergreen.V90.Types.AskToSaveDataSet p0 ->
            Evergreen.V93.Types.AskToSaveDataSet (p0 |> migrate_LiveBook_DataSet_DataSetMetaData)

        Evergreen.V90.Types.AskToCreateDataSet ->
            Evergreen.V93.Types.AskToCreateDataSet

        Evergreen.V90.Types.AskToDeleteDataSet p0 ->
            Evergreen.V93.Types.AskToDeleteDataSet (p0 |> migrate_LiveBook_DataSet_DataSetMetaData)

        Evergreen.V90.Types.ToggleCellLock p0 ->
            Evergreen.V93.Types.ToggleCellLock (p0 |> migrate_LiveBook_Types_Cell)

        Evergreen.V90.Types.NewCell p0 ->
            Evergreen.V93.Types.NewCell p0

        Evergreen.V90.Types.DeleteCell p0 ->
            Evergreen.V93.Types.DeleteCell p0

        Evergreen.V90.Types.EditCell p0 ->
            Evergreen.V93.Types.EditCell (p0 |> migrate_LiveBook_Types_Cell)

        Evergreen.V90.Types.ClearCell p0 ->
            Evergreen.V93.Types.ClearCell p0

        Evergreen.V90.Types.EvalCell p0 ->
            Evergreen.V93.Types.EvalCell p0

        Evergreen.V90.Types.InputElmCode p0 p1 ->
            Evergreen.V93.Types.InputElmCode p0 p1

        Evergreen.V90.Types.UpdateNotebookTitle ->
            Evergreen.V93.Types.UpdateNotebookTitle

        Evergreen.V90.Types.NewNotebook ->
            Evergreen.V93.Types.NewNotebook

        Evergreen.V90.Types.ProposeDeletingNotebook ->
            Evergreen.V93.Types.ProposeDeletingNotebook

        Evergreen.V90.Types.CancelDeleteNotebook ->
            Evergreen.V93.Types.CancelDeleteNotebook

        Evergreen.V90.Types.ChangeAppMode p0 ->
            Evergreen.V93.Types.ChangeAppMode (p0 |> migrate_Types_AppMode)

        Evergreen.V90.Types.SetClock p0 ->
            Evergreen.V93.Types.SetClock (p0 |> migrate_Types_ClockState)

        Evergreen.V90.Types.SetState ->
            Evergreen.V93.Types.SetState

        Evergreen.V90.Types.Reset ->
            Evergreen.V93.Types.Reset

        Evergreen.V90.Types.TogglePublic ->
            Evergreen.V93.Types.TogglePublic

        Evergreen.V90.Types.ClearNotebookValues ->
            Evergreen.V93.Types.ClearNotebookValues

        Evergreen.V90.Types.SetCurrentNotebook p0 ->
            Evergreen.V93.Types.SetCurrentNotebook (p0 |> migrate_LiveBook_Types_Book)

        Evergreen.V90.Types.CloneNotebook ->
            Evergreen.V93.Types.CloneNotebook

        Evergreen.V90.Types.PullNotebook ->
            Evergreen.V93.Types.PullNotebook

        Evergreen.V90.Types.SetShowNotebooksState p0 ->
            Evergreen.V93.Types.SetShowNotebooksState (p0 |> migrate_Types_ShowNotebooks)

        Evergreen.V90.Types.ChangePopup p0 ->
            Evergreen.V93.Types.ChangePopup (p0 |> migrate_Types_PopupState)

        Evergreen.V90.Types.GotViewport p0 ->
            Evergreen.V93.Types.GotViewport p0

        Evergreen.V90.Types.GotNewWindowDimensions p0 p1 ->
            Evergreen.V93.Types.GotNewWindowDimensions p0 p1

        Evergreen.V90.Types.SignUp ->
            Evergreen.V93.Types.SignUp

        Evergreen.V90.Types.SignIn ->
            Evergreen.V93.Types.SignIn

        Evergreen.V90.Types.SignOut ->
            Evergreen.V93.Types.SignOut

        Evergreen.V90.Types.SetSignupState p0 ->
            Evergreen.V93.Types.SetSignupState (p0 |> migrate_Types_SignupState)

        Evergreen.V90.Types.InputUsername p0 ->
            Evergreen.V93.Types.InputUsername p0

        Evergreen.V90.Types.InputSignupUsername p0 ->
            Evergreen.V93.Types.InputSignupUsername p0

        Evergreen.V90.Types.InputPassword p0 ->
            Evergreen.V93.Types.InputPassword p0

        Evergreen.V90.Types.InputPasswordAgain p0 ->
            Evergreen.V93.Types.InputPasswordAgain p0

        Evergreen.V90.Types.InputEmail p0 ->
            Evergreen.V93.Types.InputEmail p0

        Evergreen.V90.Types.InputTitle p0 ->
            Evergreen.V93.Types.InputTitle p0

        Evergreen.V90.Types.InputCloneReference p0 ->
            Evergreen.V93.Types.InputCloneReference p0

        Evergreen.V90.Types.AdminRunTask ->
            Evergreen.V93.Types.AdminRunTask

        Evergreen.V90.Types.GetUsers ->
            Evergreen.V93.Types.GetUsers


migrate_Types_PopupState : Evergreen.V90.Types.PopupState -> Evergreen.V93.Types.PopupState
migrate_Types_PopupState old =
    case old of
        Evergreen.V90.Types.NoPopup ->
            Evergreen.V93.Types.NoPopup

        Evergreen.V90.Types.AdminPopup ->
            Evergreen.V93.Types.AdminPopup

        Evergreen.V90.Types.ManualPopup ->
            Evergreen.V93.Types.ManualPopup

        Evergreen.V90.Types.NewDataSetPopup ->
            Evergreen.V93.Types.NewDataSetPopup

        Evergreen.V90.Types.EditDataSetPopup p0 ->
            Evergreen.V93.Types.EditDataSetPopup (p0 |> migrate_LiveBook_DataSet_DataSetMetaData)

        Evergreen.V90.Types.SignUpPopup ->
            Evergreen.V93.Types.SignUpPopup

        Evergreen.V90.Types.NewNotebookPopup ->
            Evergreen.V93.Types.NewNotebookPopup

        Evergreen.V90.Types.StateEditorPopup ->
            Evergreen.V93.Types.StateEditorPopup

        Evergreen.V90.Types.ViewPublicDataSetsPopup ->
            Evergreen.V93.Types.ViewPublicDataSetsPopup

        Evergreen.V90.Types.ViewPrivateDataSetsPopup ->
            Evergreen.V93.Types.ViewPrivateDataSetsPopup


migrate_Types_ShowNotebooks : Evergreen.V90.Types.ShowNotebooks -> Evergreen.V93.Types.ShowNotebooks
migrate_Types_ShowNotebooks old =
    case old of
        Evergreen.V90.Types.ShowUserNotebooks ->
            Evergreen.V93.Types.ShowUserNotebooks

        Evergreen.V90.Types.ShowPublicNotebooks ->
            Evergreen.V93.Types.ShowPublicNotebooks


migrate_Types_SignupState : Evergreen.V90.Types.SignupState -> Evergreen.V93.Types.SignupState
migrate_Types_SignupState old =
    case old of
        Evergreen.V90.Types.ShowSignUpForm ->
            Evergreen.V93.Types.ShowSignUpForm

        Evergreen.V90.Types.HideSignUpForm ->
            Evergreen.V93.Types.HideSignUpForm


migrate_Types_ToBackend : Evergreen.V90.Types.ToBackend -> Evergreen.V93.Types.ToBackend
migrate_Types_ToBackend old =
    case old of
        Evergreen.V90.Types.NoOpToBackend ->
            Evergreen.V93.Types.NoOpToBackend

        Evergreen.V90.Types.GetRandomSeed ->
            Evergreen.V93.Types.GetRandomSeed

        Evergreen.V90.Types.RunTask ->
            Evergreen.V93.Types.RunTask

        Evergreen.V90.Types.SendUsers ->
            Evergreen.V93.Types.SendUsers

        Evergreen.V90.Types.DeleteDataSet p0 ->
            Evergreen.V93.Types.DeleteDataSet (p0 |> migrate_LiveBook_DataSet_DataSetMetaData)

        Evergreen.V90.Types.SaveDataSet p0 ->
            Evergreen.V93.Types.SaveDataSet (p0 |> migrate_LiveBook_DataSet_DataSetMetaData)

        Evergreen.V90.Types.GetListOfDataSets p0 ->
            Evergreen.V93.Types.GetListOfDataSets (p0 |> migrate_Types_DataSetDescription)

        Evergreen.V90.Types.CreateDataSet p0 ->
            Evergreen.V93.Types.CreateDataSet (p0 |> migrate_LiveBook_DataSet_DataSet)

        Evergreen.V90.Types.GetData p0 p1 p2 ->
            Evergreen.V93.Types.GetData p0 p1 p2

        Evergreen.V90.Types.GetDataSetForDownload p0 ->
            Evergreen.V93.Types.GetDataSetForDownload p0

        Evergreen.V90.Types.CreateNotebook p0 p1 ->
            Evergreen.V93.Types.CreateNotebook p0 p1

        Evergreen.V90.Types.SaveNotebook p0 ->
            Evergreen.V93.Types.SaveNotebook (p0 |> migrate_LiveBook_Types_Book)

        Evergreen.V90.Types.DeleteNotebook p0 ->
            Evergreen.V93.Types.DeleteNotebook (p0 |> migrate_LiveBook_Types_Book)

        Evergreen.V90.Types.GetClonedNotebook p0 p1 ->
            Evergreen.V93.Types.GetClonedNotebook p0 p1

        Evergreen.V90.Types.GetPulledNotebook p0 p1 p2 p3 ->
            Evergreen.V93.Types.GetPulledNotebook p0 p1 p2 p3

        Evergreen.V90.Types.UpdateSlugDict p0 ->
            Evergreen.V93.Types.UpdateSlugDict (p0 |> migrate_LiveBook_Types_Book)

        Evergreen.V90.Types.GetUsersNotebooks p0 ->
            Evergreen.V93.Types.GetUsersNotebooks p0

        Evergreen.V90.Types.GetPublicNotebooks p0 ->
            Evergreen.V93.Types.GetPublicNotebooks p0

        Evergreen.V90.Types.SignUpBE p0 p1 p2 ->
            Evergreen.V93.Types.SignUpBE p0 p1 p2

        Evergreen.V90.Types.SignInBEDev ->
            Evergreen.V93.Types.SignInBEDev

        Evergreen.V90.Types.SignInBE p0 p1 ->
            Evergreen.V93.Types.SignInBE p0 p1

        Evergreen.V90.Types.SignOutBE p0 ->
            Evergreen.V93.Types.SignOutBE p0

        Evergreen.V90.Types.UpdateUserWith p0 ->
            Evergreen.V93.Types.UpdateUserWith (p0 |> migrate_User_User)


migrate_User_User : Evergreen.V90.User.User -> Evergreen.V93.User.User
migrate_User_User old =
    old