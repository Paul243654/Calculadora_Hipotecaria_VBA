Attribute VB_Name = "z4_tab_dinamica_intLegal"
Sub crear_tabla_dinamicaLegal()

Rem #6

Dim datos_volcados As Worksheet
Dim tabla_int_legal As Worksheet
Dim PTcache As PivotCache
Dim Tabladin�micaLegal As PivotTable
Dim RangodatosLegal As Range
Dim �ltimafilaLegal As Long


Rem borra la tabla din�micaLegal que se encuentra en la hoja din�mica

For Each Tabladin�micaLegal In Worksheets("tabla_int_legal").PivotTables
        Tabladin�micaLegal.TableRange2.Clear
Next Tabladin�micaLegal

Rem definir el �rea de entrada y establecer el cache din�mico

�ltimafilaLegal = Worksheets("datos_volcados").Cells(Rows.Count, 1).End(xlUp).Row

Set RangodatosLegal = Worksheets("datos_volcados").Cells(1, 1).Resize(�ltimafilaLegal, 8)

Rem nos situamos en la hoja con los datos
'definimos la variable PTcache como valor intermedio necesario para la creaci�n de la tabla din�mica

Sheets("datos_volcados").Select

Set PTcache = ActiveWorkbook.PivotCaches.Add(SourceType:=xlDatabase, SourceData:=RangodatosLegal.Address)

Rem se crea una tabla din�mica en blanco
'especificacmos la ubicaci�n de salida y el nombre de la tabla

Set Tabladin�micaLegal = PTcache.CreatePivotTable(tabledestination:=Worksheets("tabla_int_legal").Range("A1"), tablename:="pivottable1")

Rem se aplica el formato predefinido

Tabladin�micaLegal.Format xlReport6

Rem actualizaci�n autom�tica

Tabladin�micaLegal.ManualUpdate = True

Tabladin�micaLegal.AddFields RowFields:=Array("ncuota")



With Tabladin�micaLegal.PivotFields("ndias")
.Orientation = xlDataField
.Function = xlSum
.Position = 1
.Caption = "n_d�as"
End With

With Tabladin�micaLegal.PivotFields("InteresLegal")
.Orientation = xlDataField
.Function = xlSum
.Position = 2
.Caption = "Interes_Legal"
End With



Tabladin�micaLegal.ManualUpdate = False


End Sub

