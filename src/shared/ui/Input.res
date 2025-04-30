@react.component
let make = (~value: string, ~onChange: string => unit) => {
  <input
    type_="text"
    value
    onChange={event =>
      ReactEvent.Form.target(event)["value"]
      ->Belt.Option.getExn
      ->onChange}
    className="w-full px-3 py-2 border rounded-md shadow-sm focus:outline-none focus:ring-2 focus:ring-blue-500"
  />
}
