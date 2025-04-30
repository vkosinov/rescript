type state = array<Item.t>
type action = Create(Item.t) | Update(Item.t) | Delete(string)

@react.component
let make = () => {
  let reducer = (state: state, action: action): state =>
    switch action {
    | Create(newItem) => [...state, newItem]

    | Update(updatedItem) =>
      state->Belt.Array.map(item =>
        if item.id == updatedItem.id {
          updatedItem
        } else {
          item
        }
      )

    | Delete(idToDelete) => state->Belt.Array.keep(item => item.id != idToDelete)
    }

  let (state, dispatch) = React.useReducer(reducer, [])

  let handleCheck = (item: Item.t) => {
    dispatch(Update(item))
  }

  let handleAdd = (item: Item.t) => {
    dispatch(Create(item))
  }

  <div className="flex flex-col gap-5 max-w-8/10 w-full">
    {state
    ->Belt.Array.map(item => <Item key=item.id item onChecked={_ => handleCheck(item)} />)
    ->React.array}
    <Add onCreate={handleAdd} />
  </div>
}
