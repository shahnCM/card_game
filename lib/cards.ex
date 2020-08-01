defmodule Cards do
  @moduledoc """
    Provides methods for creating and handling a deck of cards
  """


  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    # Solution 1
    # cards = for value <- values do
    #           for suit <- suits do
    #             "#{value} of #{suit}"
    #           end
    #         end
          
    # List.flatten(cards)  


    # Solution 2
    for suit <- suits, value <- values do
      "#{value} of #{suit}"
    end

  end   

  def shuffle(deck) do
    Enum.shuffle(deck)
  end  

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end 

  # Solution 3
  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "That File Doesn't Exist" 
    end
  end

  # Solution 2
  # def load(filename) do
  #   {status, binary} = File.read(filename)
  #   case status do
  #     :ok -> :erlang.binary_to_term(binary)
  #     :error -> "That File Doesn't Exist"
  #   end
  # end

  # Solution 1
  # def load(filename) do
  #   {status, binary} = File.read(filename)
  #   :erlang.binary_to_term(binary)

  #   if (status === :error) {
  #     return "Something went wrong !"
  #   }
  # end

  def create_hand(hand_size) do
     Cards.create_deck 
      |> Cards.shuffle 
        |> Cards.deal(hand_size)
  end

end
