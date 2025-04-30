@react.component
let make = (~onCreate: Item.t => unit) => {
  let (value, setValue) = React.useState(() => "")

  let handleCreate = () => {
    if Js.String.trim(value) == "" {
      Js.log("Поле не должно быть пустым")
      ()
    } else {
      let newItem: Item.t = {
        id: Utils.generateId(),
        name: value,
        done: false,
      }

      onCreate(newItem)
      setValue(_ => "")
    }
  }

  <div className="flex flex-col gap-3">
    <Input value onChange={value => setValue(_ => value)} />
    <Button onClick={_ => handleCreate()}>
      {React.string("Добавить элемент")}
    </Button>
  </div>
}
