app "dataframe-example"
    packages {
        pf: "https://github.com/roc-lang/basic-cli/releases/download/0.3.1/97mY3sUwo433-pcnEQUlMhn-sWiIf_J9bPhcAFZoqY4.tar.br",
        df: "./src/main.roc",
    }
    imports [
        pf.Stdout,
        df.DataFrame,
        df.StrSeries,
    ]
    provides [main] to pf

main =
    greetingSeries = ["hello", "hi"] |> StrSeries.fromListAndName "greeting"
    greeting = greetingSeries |> StrSeries.get 0
    # data = DataFrame.fromSeries [greetingSeries]
    Stdout.line "hi \(greeting)"
