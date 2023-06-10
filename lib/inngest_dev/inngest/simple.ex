defmodule InngestDev.Inngest.Simple do
  use Inngest.V1.Function,
    name: "my/awesome.func",
    event: "my/awesome.hello"
end
