Attribute VB_Name = "referencias_formularios"
Option Explicit

Sub declaraci�n_nombres()

Worksheets("formulario").Select
Worksheets("formulario").Range("A1").Value = "A�o de firma de la hipoteca"
Worksheets("formulario").Range("A2").Value = "Plazo (a�os)"
Worksheets("formulario").Range("A3").Value = "n� de mes de revisi�n"
Worksheets("formulario").Range("A4").Value = "n� de mes del 1er pago"
Worksheets("formulario").Range("A5").Value = "Capital inicial"
Worksheets("formulario").Range("A6").Value = "Diferencial"
Worksheets("formulario").Range("A7").Value = "A�o en curso"
Worksheets("formulario").Range("A8").Value = "n� de mes en curso"
Worksheets("formulario").Range("A9").Value = "A�os a plazo fijo"
Worksheets("formulario").Range("A10").Value = "Inter�s a plazo fijo"
Worksheets("formulario").Range("A11").Value = "Diferencial sustitutivo"

Worksheets("formulario_simulacion").Select
Worksheets("formulario_simulacion").Range("A1").Value = "Cuotas pendientes de pago"
Worksheets("formulario_simulacion").Range("A2").Value = "n� de mes de revisi�n"
Worksheets("formulario_simulacion").Range("A3").Value = "n� de mes del 1er pago"
Worksheets("formulario_simulacion").Range("A4").Value = "Capital pendiente"
Worksheets("formulario_simulacion").Range("A5").Value = "Diferencial sustitutivo"
Worksheets("formulario_simulacion").Range("A6").Value = "�ltimo a�o de revisi�n"
Worksheets("formulario_simulacion").Range("A7").Value = "n� de mes en curso"
Worksheets("formulario_simulacion").Range("A9").Value = "Nueva cuota simulada "
Worksheets("formulario_simulacion").Range("A10").Value = "Amortizaci�n de cuota simulada"
Worksheets("formulario_simulacion").Range("A11").Value = "Inter�s de cuota simulada"


End Sub
