defmodule CalcularNota do
  def main() do
    IO.puts("Curso 1")
    {n1, n2, n3, n4} = pedir_notas(1)
    nota1 = calcular_nota_curso1(n1, n2, n3, n4)
    IO.puts("Nota definitiva del curso 1: #{Float.round(nota1, 2)}")
    IO.puts("Resultado: #{estado(nota1)}")

    IO.puts("Curso 2")
    {m1, m2, m3, m4} = pedir_notas(2)
    nota2 = calcular_nota_curso2(m1, m2, m3, m4)
    IO.puts("Nota definitiva del curso 2: #{Float.round(nota2, 2)}")
    IO.puts("Resultado: #{estado(nota2)}")
  end

  def pedir_notas(curso) do
    n1 = pedir_float("Ingrese la nota 1 del curso #{curso}: ")
    n2 = pedir_float("Ingrese la nota 2 del curso #{curso}: ")
    n3 = pedir_float("Ingrese la nota 3 del curso #{curso}: ")
    n4 = pedir_float("Ingrese la nota 4 del curso #{curso}: ")
    {n1, n2, n3, n4}
  end

  def pedir_float(mensaje) do
    input = IO.gets(mensaje) |> String.trim()

    case Float.parse(input) do
      {numero, _} when numero >= 0.0 and numero <= 5.0 -> numero

      {numero, _} ->
        IO.puts("La nota #{numero} no es válida. Debe estar entre 0 y 5.")
        pedir_float(mensaje)

      :error ->
        IO.puts("Entrada inválida. Debe ser un número (ej: 3.5). Inténtelo de nuevo.")
        pedir_float(mensaje)
    end
  end

  def calcular_nota_curso1(n1, n2, n3, n4) do
    (n1 + n2 + n3 + n4) / 4
  end

  def calcular_nota_curso2(n1, n2, n3, n4) do
    (n1 * 0.15) + (n2 * 0.30) + (n3 * 0.35) + (n4 * 0.20)
  end

  def estado(nota) when nota >= 3.0, do: "APROBADO ✅"
  def estado(_), do: "REPROBADO ❌"

end

CalcularNota.main()
