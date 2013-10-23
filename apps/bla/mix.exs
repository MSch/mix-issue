Code.require_file "mix.exs", "../.."

defmodule Project.Bla.Mixfile do
  use Mix.Project

  def project do
    Dict.merge(Project.Mixfile.subproject_defaults, [
      app: :bla,
    ])
  end
end
