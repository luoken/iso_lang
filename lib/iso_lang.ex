defmodule IsoLang do
  @moduledoc """
  Documentation for `IsoLang`.

  https://en.wikipedia.org/wiki/IETF_language_tag
  https://tools.ietf.org/search/bcp47
  https://datahub.io/core/language-codes#resource-language-codes-full
  """

  defstruct alpha2: nil, alpha3b: nil, alpha3t: nil, name: nil

  defdelegate all(opts \\ []), to: IsoLang.Data
end
