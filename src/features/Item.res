open AntDesignRescriptIcons.Icons
type item = {name: string}

@react.component
let make = (~item: item) => {
  let cx = Cx.cx

  let (isEdit, setisEdit) = React.useState(() => false)
  let (value, setValue) = React.useState(() => item.name)

  <div
    className={cx([
      "flex items-center p-4 rounded-sm w-full",
      switch isEdit {
      | true => "bg-red-50"
      | false => "bg-green-50 hover:bg-green-100"
      },
    ])}>
    {switch isEdit {
    | true =>
      <div className="grow-1 text-left">
        <input value={value} onChange={event => setValue(ReactEvent.Form.target(event)["value"])} />
      </div>
    | false => <p className="text-m grow-1 text-left"> {React.string(item.name)} </p>
    }}
    <div className="flex gap-3">
      <Button onClick={_ => setisEdit(active => !active)}>
        {switch isEdit {
        | true => <Outlined.Save />
        | false => <Outlined.Edit />
        }}
      </Button>
      <Button onClick={_ => setisEdit(active => !active)} variant={Danger}>
        <Outlined.Delete />
      </Button>
    </div>
  </div>
}
