type state = Active | Inactive

type action = Toggle

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer((state, action) => {
    switch action {
    | Toggle =>
      switch state {
      | Active => Inactive
      | Inactive => Active
      }
    }
  }, Inactive)

  <div className="text-center m-5 p-5 rounded-sm bg-lime-100">
    <h1 className="text-lg"> {React.string("Reducer")} </h1>
    <div className="text-3xl text-center m-5 text-gray-700">
      {switch state {
      | Active => React.string("Active")
      | Inactive => React.string("Inactive")
      }}
    </div>
    <Button onClick={_ => dispatch(Toggle)}> {React.string("Click Me!")} </Button>
  </div>
}
