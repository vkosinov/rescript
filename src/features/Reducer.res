type state = ActiveValue | InactiveValue

type action = Toggle | Active | Inactive

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer((state, action) => {
    switch action {
    | Active => ActiveValue
    | Inactive => InactiveValue
    | Toggle =>
      switch state {
      | ActiveValue => InactiveValue
      | InactiveValue => ActiveValue
      }
    }
  }, InactiveValue)

  <div className="text-center m-5 p-5 rounded-sm bg-lime-100">
    <h1 className="text-lg"> {React.string("Reducer")} </h1>
    <div className="text-3xl text-center m-5 text-gray-700">
      {switch state {
      | ActiveValue => React.string("Active")
      | InactiveValue => React.string("Inactive")
      }}
    </div>
    <div className="flex gap-5 justify-center w-full">
      <Button onClick={_ => dispatch(Toggle)}> {React.string("Toggle")} </Button>
      <Button onClick={_ => dispatch(Active)}> {React.string("Active")} </Button>
      <Button onClick={_ => dispatch(Inactive)}> {React.string("Inactive")} </Button>
    </div>
  </div>
}
