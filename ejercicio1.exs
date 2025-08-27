defmodule CalculadoraSalario do
  def main do
    nombre = pedir_nombre()
    horas = pedir_horas_trabajadas()
    valor = pedir_valor_por_hora()

    salario = calcular_salario(horas, valor)

    mostrar_resultado(nombre, horas, valor, salario)
  end

  def pedir_nombre do
    IO.gets("Ingrese el nombre del empleado: ")
    |> String.trim()
  end

  def pedir_horas_trabajadas do
    IO.gets("Ingrese las horas trabajadas: ")
    |> String.trim()
    |> convertir_a_entero("horas trabajadas")
  end

  def pedir_valor_por_hora do
    IO.gets("Ingrese el valor por hora: ")
    |> String.trim()
    |> convertir_a_flotante("valor por hora")
  end

  def convertir_a_entero(valor_str, campo) do
    case Integer.parse(valor_str) do
      {numero, _} -> numero
      :error ->
        IO.puts("❌ Entrada inválida para #{campo}. Debe ser un número entero. Inténtelo de nuevo.")
        aplicar_retry(campo)
    end
  end
manul
  def convertir_a_flotante(valor_str, campo) do
    case Float.parse(valor_str) do
      {numero, _} -> numero
      :error ->
        IO.puts("❌ Entrada inválida para #{campo}. Debe ser un número. Inténtelo de nuevo.")
        aplicar_retry(campo)
    end
  end

  defp aplicar_retry("horas trabajadas"), do: pedir_horas_trabajadas()
  defp aplicar_retry("valor por hora"), do: pedir_valor_por_hora()

  defp calcular_salario(horas, valor), do: horas * valor

  defp mostrar_resultado(nombre, horas, valor, salario) do
    IO.puts("\n--- Resultado ---")
    IO.puts("Empleado        : #{nombre}")
    IO.puts("Horas trabajadas: #{horas}")
    IO.puts("Valor por hora  : $#{valor}")
    IO.puts("Salario total   : $#{salario}")
  end


end

CalculadoraSalario.main()
