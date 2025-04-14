open AntDesignRescriptIcons.Icons

@react.component
let make = () => {
  let cx = Cx.cx

  let (isEdit, setisEdit) = React.useState(() => false)

  <div
    className={cx([
      "flex items-center p-4 rounded-sm w-full hover:bg-green-100",
      switch isEdit {
      | true => "bg-red-50"
      | false => "bg-green-50"
      },
    ])}>
    <p className="text-m grow-1 text-left">
      {React.string("State: ")}
      {isEdit ? React.string("Active") : React.string("Inactive")}
    </p>
    <Button onClick={_ => setisEdit(active => !active)}>
      {switch isEdit {
      | true => <Outlined.Save />
      | false => <Outlined.Edit />
      }}
    </Button>
  </div>
}
