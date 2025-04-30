module LocalStorage = {
  @val external getItem: string => option<string> = "localStorage.getItem"
  @val external setItem: (string, string) => unit = "localStorage.setItem"
  @val external removeItem: string => unit = "localStorage.removeItem"
  @val external clear: unit => unit = "localStorage.clear"

  @val external jsonParse: string => Js.Json.t = "JSON.parse"
  @val external jsonStringify: 'a => string = "JSON.stringify"

  let setJson = (key: string, value: 'a) => {
    let jsonString = jsonStringify(value)
    setItem(key, jsonString)
  }

  let getJson = (key: string): option<Js.Json.t> => {
    switch getItem(key) {
    | Some(value) =>
      try {
        Some(jsonParse(value))
      } catch {
      | _error => None
      }
    | None => None
    }
  }
}
