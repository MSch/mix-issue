defmodule Project.Mixfile do
  use Mix.Project

  def project do
    [ apps_path: "apps",
      compile_path: ".",
      default_task: "compile",
      deps: deps ]
  end

  def subproject_defaults do
    project_root = Path.expand("../..", Mix.Project.config[:compile_path])
    include_path_options = Enum.map(Path.wildcard("#{project_root}/apps/*/include"), fn(path) -> {:i, path} end)
    [
      compilers: [ :copyapp, :erlang ],
      default_task: "compile",
      erlc_options: include_path_options ++ [ :debug_info ],
      deps: deps,
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
    ]
  end

  defp deps do
    [
      { :riakc, github: "basho/riak-erlang-client" },
    ]
  end
end
