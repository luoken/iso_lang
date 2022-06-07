defmodule IsoLang do
  @moduledoc """
  Documentation for `IsoLang`.

  Provides utilities for dealing with [ISO 639](https://en.wikipedia.org/wiki/ISO_639)
  languages.

  ## See Also

  - https://en.wikipedia.org/wiki/IETF_language_tag
  - https://tools.ietf.org/search/bcp47
  - https://datahub.io/core/language-codes#resource-language-codes-full
  """

  @type t :: %__MODULE__{
          alpha2: String.t(),
          alpha3b: String.t(),
          alpha3t: String.t(),
          name: String.t()
        }

  defstruct alpha2: nil, alpha3b: nil, alpha3t: nil, name: nil

  @doc """
  Returns a list of all available ISO language codes.
  """
  defdelegate all(opts \\ []), to: IsoLang.Data

  @doc """
  Gets a single language struct identified by a field.
  If the `:by` field is not specified, fields are checked in the following order:

  - `:alpha2`
  - `:alpha3b`
  - `:alpha3t`
  - `:name`

  ## Options

  - `:by` specifies which struct field to be used in the search. (optional)

  ## Examples

      iex> IsoLang.get("de")
      {:ok, %IsoLang{alpha2: "de", alpha3b: "ger", alpha3t: "deu", name: "German"}}
  """
  @spec get(value :: String.t(), opts :: Keyword.t()) :: {:ok, IsoLang.t()} | {:error, any()}
  def get(value, opts \\ []) do
    key = Keyword.get(opts, :by, nil)

    opts
    |> all()
    |> Enum.find(:not_found, fn
      lang when not is_nil(key) -> Map.get(lang, key) == value
      %__MODULE__{alpha2: ^value} -> true
      %__MODULE__{alpha3b: ^value} -> true
      %__MODULE__{alpha3t: ^value} -> true
      %__MODULE__{name: ^value} -> true
      _ -> false
    end)
    |> case do
      :not_found -> {:error, "Language not found"}
      lang -> {:ok, lang}
    end
  end

  @doc """
  As `get/2`, but raises on error
  """
  def get!(query, opts \\ []) do
    case get(query, opts) do
      {:ok, lang} -> {:ok, lang}
      {:error, error} -> raise error
    end
  end

  @doc """
  Searches for matching languages using a case-insensitive query string

  ## Options

  - `:by` specifies which struct field to be used in the search. Default: `:name`

  ## Examples

      iex> IsoLang.find(~r/eng/)
  """
  @spec find(query :: String.t(), opts :: Keyword.t()) :: {:ok, [IsoLang.t()]} | {:error, any()}
  def find(query, opts \\ []) do
    key = Keyword.get(opts, :by, :name)

    {:ok,
     opts
     |> all()
     |> Enum.filter(fn lang ->
       query
       |> Regex.compile!("i")
       |> Regex.match?(
         lang
         |> Map.fetch!(key)
       )
     end)}
  rescue
    e -> {:error, e}
  end

  @doc """
  As `find/2`, but raises on error
  """
  def find!(query, opts \\ []) do
    case find(query, opts) do
      {:ok, lang} -> {:ok, lang}
      {:error, error} -> raise error
    end
  end
end
