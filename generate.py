#!/usr/bin/env python3

from typing import NamedTuple
from pathlib import Path
from textwrap import dedent
from typing import TypeVar, List, Iterable

T = TypeVar("T")


def flatten(nested_list: Iterable[List[T]]) -> List[T]:
    return [item for sublist in nested_list for item in sublist]


SRC_DIR = Path(".") / "src"


class DataType(NamedTuple):
    data_type: str
    is_optional: str

    @property
    def column_type(self) -> str:
        return ("Optional" if self.is_optional else "") + self.data_type

    @property
    def series_name(self) -> str:
        return self.column_type + "Series"

    @property
    def series_data_type(self) -> str:
        return (
            f"([Some {self.data_type}, None])" if self.is_optional else self.data_type
        )


data_types = flatten(
    [
        [
            DataType(data_type, is_optional)
            for data_type in ["Bool", "U64", "U32", "I64", "I32", "F64", "F32", "Str"]
        ]
        for is_optional in (False, True)
    ]
)


for data_type in data_types:
    with open(SRC_DIR / (data_type.series_name + ".roc"), "w") as f:
        f.write(
            dedent(
                f"""
                interface {data_type.series_name}
                    exposes [{data_type.series_name}, fromListAndName, getName, toList, len, get]
                    imports []

                {data_type.series_name} := {{ name : Str, data : List {data_type.series_data_type} }}

                fromListAndName : List {data_type.series_data_type}, Str -> {data_type.series_name}
                fromListAndName = \data, name ->
                    @{data_type.series_name} {{ name: name, data : data }}

                # expect
                #     out = fromListAndName [] "test"
                #     out == @{data_type.series_name} {{ name: "test", data : [] }}

                getName : {data_type.series_name} -> Str
                getName = \@{data_type.series_name} {{ name }} ->
                    name

                toList : {data_type.series_name} -> List {data_type.series_data_type}
                toList = \@{data_type.series_name} {{ data }} ->
                    data

                len : {data_type.series_name} -> Nat
                len = \series ->
                    series |> toList |> List.len

                get : {data_type.series_name}, Nat -> Result {data_type.series_data_type} [OutOfBounds]
                get = \series, index ->
                    series |> toList |> List.get index
                """
            )
        )

with open(SRC_DIR / "Series.roc", "w") as f:
    len_cases = "\n".join(
        [f"        {d.column_type} s -> {d.series_name}.len s" for d in data_types]
    )
    len_definition = (
        dedent(
            """
            len : Series -> Nat
            len = \series ->
                when series is
            """
        )
        + len_cases
    )
    f.write(
        dedent(
            f"""
            interface Series
                exposes [Series, len]
                imports [
                    {", ".join(d.series_name for d in data_types)}
                    ]

            Series : [
                {", ".join(f"{d.column_type} {d.series_name}.{d.series_name}" for d in data_types)}
                ]
            """
        )
        + len_definition
    )

with open(SRC_DIR / "DataFrame.roc", "w") as f:
    get_column_definitions = [
        dedent(
            f"""
            get{data_type.column_type}ColumnByName : DataFrame, Str -> Result {data_type.series_name}.{data_type.series_name} [ColumnNameNotFound]
            get{data_type.column_type}ColumnByName = \@DataFrame columns, columnName ->
                getColumnIfRightType = \column -> when column is
                        {data_type.column_type} series -> Ok series
                        _ -> Err WrongType
                getColumnIfRightName = \series ->
                    if ({data_type.series_name}.getName series) == columnName then
                        Ok  series
                    else
                        Err WrongName         
                walkOutput= List.walkUntil columns ColumnNameNotFound (
                    \_hasBeenFound, column ->
                        when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                            Ok series -> Break (ColumnNameFound series)
                            Err _ -> Continue ColumnNameNotFound
                    )
                when walkOutput is
                    ColumnNameFound series -> Ok series
                    ColumnNameNotFound -> Err ColumnNameNotFound
            """
            + "\n"
        )
        for data_type in data_types
    ]
    f.write(
        dedent(
            f"""
            interface DataFrame
                exposes [DataFrame,
                fromSeries,
                nRows,nColumns,
                    {", ".join(f"get{d.column_type}ColumnByName" for d in data_types)}
                ]
                imports [
                    Series,
                    {", ".join(d.series_name for d in data_types)},
                ]

            DataFrame := List Series.Series

            fromSeries : List Series.Series -> DataFrame
            fromSeries = \listOfSeries ->
                @DataFrame listOfSeries
            
            nRows : DataFrame -> Nat
            nRows = \@DataFrame columns ->
                when List.get columns 0 is
                    Ok column -> Series.len column
                    Err _ -> 0

            nColumns : DataFrame -> Nat
            nColumns = \@DataFrame columns ->
                List.len columns
            """
        )
        + "\n".join(get_column_definitions)
    )

with open(SRC_DIR / "main.roc", "w") as f:
    f.write(
        dedent(
            f"""
            package "DataFrames"
                exposes [
                DataFrame,Series,{", ".join(d.series_name for d in data_types)}
                ]
                packages {{}}
            """
        )
    )
