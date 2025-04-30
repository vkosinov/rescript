open AntDesignRescriptIcons.Icons

type t = {
  id: string,
  name: string,
  done: bool,
}

type status = Idle | Edit | Done

@react.component
let make = (~item: t, ~onChecked: t => unit, ~onRemove: string => unit) => {
  Js.log(item.done)

  let cx = Cx.cx

  let (status, setStatus) = React.useState(() => item.done ? Done : Idle)
  let (value, setValue) = React.useState(() => item.name)

  React.useEffect1(() => {
    setStatus(_ => item.done ? Done : Idle)
    None
  }, [item.done])

  <div
    id={item.id}
    className={cx([
      "flex items-center p-4 rounded-sm w-full",
      switch status {
      | Edit => "bg-red-50"
      | Idle => "bg-green-50 hover:bg-green-100"
      | Done => "bg-gray-50"
      },
    ])}>
    {switch status {
    | Edit =>
      <div className="grow-1 text-left">
        <input value={value} onChange={event => setValue(ReactEvent.Form.target(event)["value"])} />
      </div>
    | Idle =>
      <Checkbox checked={false} onChange={check => onChecked({...item, done: check})}>
        <p className="text-m grow-1 text-left"> {React.string(item.name)} </p>
      </Checkbox>
    | Done => <p className="text-m grow-1 text-left line-through"> {React.string(item.name)} </p>
    }}
    <div className="flex gap-3">
      {switch status {
      | Edit =>
        <Button onClick={_ => setStatus(_ => Edit)}>
          <Outlined.Save />
        </Button>
      | Idle =>
        <Button onClick={_ => setStatus(_ => Edit)}>
          <Outlined.Edit />
        </Button>
      | Done => React.null
      }}
      <Button onClick={_ => onRemove(item.id)} variant={Danger}>
        <Outlined.Delete />
      </Button>
    </div>
  </div>
}
