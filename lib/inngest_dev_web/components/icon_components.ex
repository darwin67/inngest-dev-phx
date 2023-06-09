defmodule InngestDevWeb.IconComponents do
  use Phoenix.Component

  def status(assigns) do
    ~H"""
    <span class={[@class]}>
      <svg>
        <circle stroke="none" cx="12" cy="12" r="12">
          <animate
            attributeName="opacity"
            dur="1s"
            values="0;1;0"
            repeatCount="indefinite"
            begin="0.1"
          />
        </circle>
      </svg>
    </span>
    """
  end
end
