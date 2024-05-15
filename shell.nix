let pkgs = import <nixos-23.11> { };

in pkgs.mkShell {
  buildInputs = [
    # Elixir
    pkgs.elixir
    pkgs.erlang

    # LSPs
    pkgs.elixir-ls
    pkgs.erlang-ls

    # Tools
    pkgs.yamllint
    pkgs.shfmt
    pkgs.shellcheck
  ];
}
