let generateId = (): string => {
  let timestamp = Js.Date.now()

  let randomPart = Js.Math.random() *. 1_000_000.0

  let total = timestamp +. randomPart

  total->Js.Float.toString
}

let decodeItem = (json: Js.Json.t): option<Item.t> =>
  switch Js.Json.decodeObject(json) {
  | Some(obj) =>
    switch (
      Js.Dict.get(obj, "id")->Belt.Option.flatMap(Js.Json.decodeString),
      Js.Dict.get(obj, "name")->Belt.Option.flatMap(Js.Json.decodeString),
      Js.Dict.get(obj, "done")->Belt.Option.flatMap(Js.Json.decodeBoolean),
    ) {
    | (Some(id), Some(name), Some(done)) => Some({id, name, done})
    | _ => None
    }
  | None => None
  }

let parseItems = (json: Js.Json.t): array<Item.t> =>
  switch Js.Json.decodeArray(json) {
  | Some(arr) => Belt.Array.keepMap(arr, decodeItem)
  | None => []
  }
