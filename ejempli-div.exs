defmodule Matematicas do
  def main do

    dividir(10, 3)
    |> crear_respuesta()
    |> IO.puts()
  end

  def dividir(a, b) do
    cond == 0 -> {:error, "La mamo"}
    true -> {:ok, a/b}
  end

end

def crear_respuesta(tupla) do

  case tupla do
    {:ok, valor} -> "El resultado es: #{valor}"
    {:errror, mensaje} -> "Error: #{mensaje}"

  end

end


Matematicas.main()
