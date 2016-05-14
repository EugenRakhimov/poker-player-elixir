defmodule LeanpokerElixir.Player do
  @version "0.0.5"
  def bet_request(game_state) do
    %{
      "in_action" => in_action,
      "dealer" => dealer,
      "players" => players,
      "current_buy_in" => current_buy_in,
    } = game_state
    player = Enum.at(players, in_action)
    if has_pair?(player["hole_cards"]) do
      current_buy_in
    else
      0
    end
  end
  defp has_pair?(cards) do
    rank = (hd cards)["rank"]
    has_pair? = Enum.all?(cards, fn(x) -> x["rank"] == rank end)
  end
  def showdown(game_state) do
    "ok"
  end

  def version, do: @version
end
