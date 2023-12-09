Attribute VB_Name = "tabla_dinamica"
Option Explicit

Sub crear_tabla_dinamica()

Dim datos_tabla As Worksheet
Dim tdp As Worksheet
Dim PTcache As PivotCache
Dim Tabladin�mica As PivotTable
Dim Rangodatos As Range
Dim �ltimafila As Long


Rem borra la tabla din�mica que se encuentra en la hoja din�mica

For Each Tabladin�mica In Worksheets("tdp").PivotTables
        Tabladin�mica.TableRange2.Clear
Next Tabladin�mica

Rem definir el �rea de entrada y establecer el cache din�mico

�ltimafila = Worksheets("datos_tabla").Cells(Rows.Count, 1).End(xlUp).Row

Set Rangodatos = Worksheets("datos_tabla").Cells(1, 1).Resize(�ltimafila, 7)

Rem nos situamos en la hoja con los datos
'definimos la variable PTcache como valor intermedio necesario para la creaci�n de la tabla din�mica

Sheets("datos_tabla").Select

Set PTcache = ActiveWorkbook.PivotCaches.Add(SourceType:=xlDatabase, SourceData:=Rangodatos.Address)

Rem se crea una tabla din�mica en blanco
'especificacmos la ubicaci�n de salida y el nombre de la tabla

Set Tabladin�mica = PTcache.CreatePivotTable(tabledestination:=Worksheets("tdp").Range("A1"), tablename:="pivottable1")

Rem se aplica el formato predefinido

Tabladin�mica.Format xlReport6

Rem actualizaci�n autom�tica

Tabladin�mica.ManualUpdate = True

Tabladin�mica.AddFields RowFields:=Array("nrev")


With Tabladin�mica.PivotFields("ncuota")
.Orientation = xlDataField
.Function = xlCount
.Position = 1
.Caption = "Total cuotas"
End With

With Tabladin�mica.PivotFields("irph")
.Orientation = xlDataField
.Function = xlAverage
.Position = 2
.Caption = "Valor irph"
End With

With Tabladin�mica.PivotFields("euribor")
.Orientation = xlDataField
.Function = xlAverage
.Position = 3
.Caption = "Valor euribor"
End With

With Tabladin�mica.PivotFields("nrev")
.Orientation = xlDataField
.Function = xlAverage
.Position = 4
.Caption = "n� de Revisi�n"
End With

With Tabladin�mica.PivotFields("cuota_irph")
.Orientation = xlDataField
.Function = xlSum
.Position = 5
.Caption = "Acumulado cuota IRPH"
End With

With Tabladin�mica.PivotFields("cuota_eur")
.Orientation = xlDataField
.Function = xlSum
.Position = 6
.Caption = "Acumulado cuota euribor"
End With

With Tabladin�mica.PivotFields("dif_cuotas")
.Orientation = xlDataField
.Function = xlSum
.Position = 7
.Caption = "Diferencia cuotas"
End With

Tabladin�mica.ManualUpdate = False

'Sheets("tdp").Select
'
'Sheets("tdp").CheckBox1.Value = True
'Sheets("tdp").CheckBox2.Value = True
'Sheets("tdp").CheckBox3.Value = True
'Sheets("tdp").CheckBox4.Value = True
'Sheets("tdp").CheckBox5.Value = True
'Sheets("tdp").CheckBox6.Value = True
'Sheets("tdp").CheckBox7.Value = True
'Sheets("tdp").CheckBox8.Value = True


End Sub

