@react.component
let make = () => {
  <div className="text-center m-5 ">
    <div className="text-center m-5 p-5 bg-white rounded-sm flex flex-col items-center">
      <h1 className="text-3xl mb-8"> {React.string("ToDoRes")} </h1>
      <div className="flex flex-col gap-5 max-w-8/10 w-full">
        <Item />
        <Item />
      </div>
    </div>
  </div>
}
