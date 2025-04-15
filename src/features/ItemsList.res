@react.component
let make = () => {
  <div className="flex flex-col gap-5 max-w-8/10 w-full">
    <Item item={{name: "Item 1"}} />
    <Item item={{name: "Item 2"}} />
    <Add />
  </div>
}
