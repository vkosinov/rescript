type state = array<Item.t>
type action = Create(Item.t) | Update(Item.t) | Delete(string)

@react.component
let make = () => {
  let reducer = (state: state, action: action): state =>
    switch action {
    | Create(newItem) => [...state, newItem]

    | Update(updatedItem) =>
      state
      ->Belt.Array.map(item =>
        if item.id == updatedItem.id {
          updatedItem
        } else {
          item
        }
      )
      ->Belt.SortArray.stableSortBy((a, _b) => a.done ? 1 : -1)

    | Delete(idToDelete) => state->Belt.Array.keep(item => item.id != idToDelete)
    }

  let (state, dispatch) = React.useReducer(
    reducer,
    switch LocalStorage.getJson("items") {
    | Some(items) => Obj.magic(items)
    | None => []
    },
  )

  let handleUpdate = (item: Item.t) => {
    dispatch(Update(item))
  }

  let handleAdd = (item: Item.t) => {
    dispatch(Create(item))
  }

  let handleRemove = (id: string) => {
    dispatch(Delete(id))
  }

  React.useEffect1(() => {
    LocalStorage.setJson("items", state)
    Js.log(state)
    None
  }, [state])

  <div className="flex flex-col gap-5 max-w-8/10 w-full">
    {state
    ->Belt.Array.map(item =>
      <Item key=item.id item onUpdate={handleUpdate} onRemove={handleRemove} />
    )
    ->React.array}
    <Add onCreate={handleAdd} />
  </div>
}
