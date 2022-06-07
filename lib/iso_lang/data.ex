defmodule IsoLang.Data do
  @moduledoc """
  Builds list of language codes at compile-time.

  Data sourced from https://datahub.io/core/language-codes#resource-language-codes-full
  """

  lines =
    File.stream!("priv/language-codes-full.csv")
    |> Stream.drop(1)

  langs =
    Enum.map(lines, fn l ->
      [alpha3b, alpha3t, alpha2, english_name | _] =
        l
        |> String.trim()
        |> String.split(",")

      %IsoLang{
        alpha2: alpha2,
        alpha3b: alpha3b,
        alpha3t: alpha3t,
        name: english_name
      }
    end)

  def all(_opts) do
    unquote(Macro.escape(langs))
  end

  @spec find(lang_code :: String.t(), opts :: Keyword.t()) :: IsoLang.t()
  def find(lang_code, opts \\ [])

  def find("", _opts), do: nil

  def find(lang_code, opts) do
    standard = Keyword.get(opts, :standard, nil)
    Enum.find(all(opts), fn x -> Map.get(x, standard, nil) == lang_code end)
  end
end
