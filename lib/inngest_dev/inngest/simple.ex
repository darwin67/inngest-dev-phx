defmodule InngestDev.Inngest.Simple do
  use Inngest.Function

  # The id and name of the function
  @func %FnOpts{id: "test", name: "Test"}
  # The event this function will react to
  @trigger %Trigger{event: "test/hello"}

  @impl true
  def exec(ctx, %{step: step} = _input) do
    IO.inspect("Starting function...")

    # A return value wrapped in a `step` are memorized, meaning
    # it's guaranteed to be idempotent.
    # if it fails, it'll be retried.
    %{greet: greet} =
      step.run(ctx, "step1", fn ->
        %{greet: "hello"}
      end)

    # Sleeping will pause the execution from running, and function
    # will be reinvoked when time is up.
    step.sleep(ctx, "wait-a-little", "10s")

    %{name: name} =
      step.run(ctx, "retrieve-user", fn ->
        # retrieve user from here
        %{name: "Darwin"}
      end)

    {:ok, %{greetings: "#{greet} #{name}"}}
  end
end
