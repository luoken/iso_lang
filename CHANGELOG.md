# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## v0.4.0

- Moves `use Gettext` inside "private" module so we don't pollute the `IsoLang` namespace with all the generated functions.
- Sets `IsoLang.Data` to `@moduledoc false` to better communicate that it is an implementation detail without stand-alone functionality

## v0.3.1

- Adds `CHANGELOG`
- Defines `@external_resource` for `IsoLang.Data` to link CSV asset
- Updates examples in `@doc` blocks
- Updates dependencies to latest

## previous versions

The beforetimes...
