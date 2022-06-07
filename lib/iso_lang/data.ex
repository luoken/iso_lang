defmodule IsoLang.Data do
  @moduledoc """
  Builds list of language codes at compile-time.

  Data sourced from https://datahub.io/core/language-codes#resource-language-codes-full
  """

  lines =
    File.stream!("priv/language-codes-full.csv")
    |> Stream.drop(1)

  # enm,,,"English, Middle (1100-1500)",anglais moyen (1100-1500)
  # ypk,,,Yupik languages,"yupik, langues"
  # Regex.named_captures(~r/^(?<alpha3b>.*),.*/U, line)
  # "\"English, Middle (1100-1500)\",anglais moyen (1100-1500)"
  # <<?", tail::binary>>
  #  Regex.run(~r/(.*)",(.*)/, "English, Middle (1100-1500)\",anglais moyen (1100-1500)", capture: :all_but_first)

  langs =
    Enum.map(lines, fn l ->
      [alpha3b, alpha3t, alpha2 | rest] =
        l
        |> String.trim()
        |> String.split(",")

      tail = Enum.join(rest, ",")

      # Parse up to the closing double-quote or up to the comma
      f = fn
        <<?", chunk::binary>> ->
          Regex.run(~r/(.*)"/U, chunk, capture: :all_but_first) |> Enum.at(0)

        chunk ->
          Regex.run(~r/(.*),/U, chunk, capture: :all_but_first) |> Enum.at(0)
      end

      %IsoLang{
        alpha2: alpha2,
        alpha3b: alpha3b,
        alpha3t: alpha3t,
        name: f.(tail)
      }
    end)

  def all(_opts) do
    unquote(Macro.escape(langs))
  end
end
