Attribute VB_Name = "td_informe_n1"
Option Explicit

Sub informe_hipoteca_general()

Dim dato_informe As Worksheet
Dim informe As Worksheet
Dim PTcache As PivotCache
Dim Tabladin�mica As PivotTable
Dim Rangodatos As Range
Dim �ltimafila As Long


Rem borra la tabla din�mica que se encuentra en la hoja din�mica

For Each Tabladin�mica In Worksheets("informe").PivotTables
        Tabladin�mica.TableRange2.Clear
Next Tabladin�mica

Rem definir el �rea de entrada y establecer el cache din�mico

�ltimafila = Worksheets("dato_informe").Cells(Rows.Count, 1).End(xlUp).Row

Set Rangodatos = Worksheets("dato_informe").Cells(1, 1).Resize(�ltimafila, 7)

Rem nos situamos en la hoja con los datos
'definimos la variable PTcache como valor intermedio necesario para la creaci�n de la tabla din�mica

Sheets("dato_informe").Select

Set PTcache = ActiveWorkbook.PivotCaches.Add(SourceType:=xlDatabase, SourceData:=Rangodatos.Address)

Rem se crea una tabla din�mica en blanco
'especificacmos la ubicaci�n de salida y el nombre de la tabla

Set Tabladin�mica = PTcache.CreatePivotTable(tabledestination:=Worksheets("informe").Range("A1"), tablename:="pivottable1")

Rem se aplica el formato predefinido

Tabladin�mica.Format xlReport6

Rem actualizaci�n autom�tica

Tabladin�mica.ManualUpdate = True

Rem Tabladin�mica.AddFields RowFields:=Array("ncuota")


With Tabladin�mica.PivotFields("ncuota")
.Orientation = xlDataField
.Function = xlCount
.Position = 1
.Caption = "Total cuotas"
End With

With Tabladin�mica.PivotFields("int_irph")
.Orientation = xlDataField
.Function = xlSum
.Position = 2
.Caption = "Intereses_irph (�)"
End With

With Tabladin�mica.PivotFields("amort_irph")
.Orientation = xlDataField
.Function = xlSum
.Position = 3
.Caption = "Amortizado_irph (�)"
End With

With Tabladin�mica.PivotFields("int_eur")
.Orientation = xlDataField
.Function = xlSum
.Position = 4
.Caption = "Intereses_euribor (�)"
End With

With Tabladin�mica.PivotFields("amort_eur")
.Orientation = xlDataField
.Function = xlSum
.Position = 5
.Caption = "Amortizado_euribor (�)"
End With

With Tabladin�mica.PivotFields("a_amort")
.Orientation = xlDataField
.Function = xlSum
.Position = 6
.Caption = "Destinado a amortizar (�)"
End With

With Tabladin�mica.PivotFields("devolver")
.Orientation = xlDataField
.Function = xlSum
.Position = 7
.Caption = "Destinado a devolver (�)"
End With

Tabladin�mica.ManualUpdate = False

'Sheets("informe").Select
'
'Sheets("informe").CheckBox1.Value = True
'Sheets("informe").CheckBox2.Value = True
'Sheets("informe").CheckBox3.Value = True
'Sheets("informe").CheckBox4.Value = True
'Sheets("informe").CheckBox5.Value = True
'Sheets("informe").CheckBox6.Value = True
'Sheets("informe").CheckBox7.Value = True
'Sheets("informe").CheckBox8.Value = True

End Sub

Sub format_informe()

Worksheets("informe").Select

With Worksheets("informe").Range("A1:H2")
 .Font.Size = 10
End With
With Worksheets("informe").Range("C2:H2")
 .NumberFormat = "#,##0.00"
End With

Range("A1:H2").Select
Cells.Select
Cells.EntireColumn.AutoFit
Cells.EntireRow.AutoFit

End Sub

Sub imprimir_resultados_generales()

Dim ruta As String
Dim titulo As String
Dim Fecha As String

Fecha = Now ' ahora remplazamos signos para qjue no den problemas a la hora de guardar
Fecha = Replace(Fecha, "/", "-") 'slash remplazado por gui�n
Fecha = Replace(Fecha, ":", ".")
ruta = ThisWorkbook.Path
ruta = ruta & "\"
titulo = "Resultados hipoteca"

Worksheets("informe").Select
ActiveSheet.PageSetup.Orientation = xlLandscape
Range(Cells(1, 1), Cells(3, 8)).Select
Selection.ExportAsFixedFormat Type:=xlTypePDF, _
Filename:=ruta & titulo & " " & Fecha & ".pdf", Quality:=xlQualityStandard, openafterpublish:=True


End Sub

