@react.component
let make = () => {
  let (active, setActive) = React.useState(() => false)

  <div className="text-center m-5 p-5 bg-white rounded-sm">
    <h1 className="text-lg"> {React.string("State")} </h1>
    <div className="text-3xl text-center m-5 text-gray-700">
      {active ? React.string("Active") : React.string("Not Active")}
    </div>
    <Button onClick={_ => setActive(active => !active)}> {React.string("Click me")} </Button>
  </div>
}
