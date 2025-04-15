type variant =
  | Default
  | Danger

@react.component
let make = (~children, ~onClick, ~variant: variant=Default) => {
  let cx = Cx.cx

  <button
    className={cx([
      "text-white font-bold py-2 px-4 rounded cursor-pointer",
      switch variant {
      | Default => "bg-sky-500 hover:bg-sky-700"
      | Danger => "bg-red-500 hover:bg-red-700"
      },
    ])}
    onClick>
    children
  </button>
}
