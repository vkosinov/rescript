@react.component
let make = (~children, ~checked: bool, ~onChange: bool => unit) => {
  <label className="inline-flex items-center space-x-2 cursor-pointer w-full">
    <input
      type_="checkbox"
      checked
      onChange={event => onChange(ReactEvent.Form.target(event)["checked"]->Belt.Option.getExn)}
      className="h-5 w-5 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
    />
    children
  </label>
}
