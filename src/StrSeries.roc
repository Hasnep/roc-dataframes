interface StrSeries
    exposes [StrSeries, fromListAndName, getName, toList, len, get]
    imports []

StrSeries := { name : Str, data : List Str }

fromListAndName : List Str, Str -> StrSeries
fromListAndName = \data, name ->
    @StrSeries { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @StrSeries { name: "test", data : [] }

getName : StrSeries -> Str
getName = \@StrSeries { name } ->
    name

toList : StrSeries -> List Str
toList = \@StrSeries { data } ->
    data

len : StrSeries -> Nat
len = \series ->
    series |> toList |> List.len

get : StrSeries, Nat -> Result Str [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
