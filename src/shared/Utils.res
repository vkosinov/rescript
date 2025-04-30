let generateId = (): string => {
  let timestamp = Js.Date.now()

  let randomPart = Js.Math.random() *. 1_000_000.0

  let total = timestamp +. randomPart

  total->Js.Float.toString
}
