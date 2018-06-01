cell = dbOpenCellViewByType("PTS18_KIT10" "inv" "layout")

# import KIT's GDS with scale=1, layer conversion, then flat it all.
# note: DRC errors on KIT -> PTS (scale=1.0)
#  - Diff-Poly separation : 0.0(KIT) / 0.5(PTS)
#  - Cont-M1 enclosure    : 0.5(KIT) / 0.6(PTS) * will be solved by Cont resize
#  - Via-M1 enclosure     : 0.5(KIT) / 0.6(PTS) * will be solved by Via resize

leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))

# y0 = Psel
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))

# y1 = Cont -> y4 = PolyCont
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))

# y1 = Cont -> y5 = DiffCont
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))

# y4 = PolyCont / 1.2->0.6 (Poly cont)
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))

# y5 = DiffCont / 1.5->0.6(Diff cont)
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))

# y2 = Via / 1.5->0.6
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

# ToDo:
# - Cont-Via / Via-Via2 stack&spacing

# In case of scale=0.8
# Poly Cont     : 0.96 -> 0.6 (-0.18)
# Diff Cont&Via : 1.2  -> 0.6 (-0.3)

---------------
cell = dbOpenCellViewByType("PTS18_KIT10" "inv1" "layout")
dbCopyCellView(cell "PTS18_KIT10" "inv1f" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "inv2" "layout")
dbCopyCellView(cell "PTS18_KIT10" "inv2f" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "inv3" "layout")
dbCopyCellView(cell "PTS18_KIT10" "inv3f" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "and3" "layout")
dbCopyCellView(cell "PTS18_KIT10" "and3f" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "nand2" "layout")
dbCopyCellView(cell "PTS18_KIT10" "nand2f" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "nand2" "layout")
dbCopyCellView(cell "PTS18_KIT10" "nand2f" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "nand3" "layout")
dbCopyCellView(cell "PTS18_KIT10" "nand3f" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "eor2" "layout")
dbCopyCellView(cell "PTS18_KIT10" "eor2f" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "eor3" "layout")
dbCopyCellView(cell "PTS18_KIT10" "eor3f" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "enor2" "layout")
dbCopyCellView(cell "PTS18_KIT10" "enor2f" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "enor3" "layout")
dbCopyCellView(cell "PTS18_KIT10" "enor3f" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "dffrst" "layout")
dbCopyCellView(cell "PTS18_KIT10" "dffrstf" "layout" nil nil t)
cell = dbOpenCellViewByType("PTS18_KIT10" "Opamp" "layout")
dbCopyCellView(cell "PTS18_KIT10" "Opampf" "layout" nil nil t)

cell = dbOpenCellViewByType("PTS18_KIT10" "inv1f" "layout")
w = geOpen(?window hiGetCurrentWindow() ?lib "PTS18_KIT10" ?cell "inv1f" ?view "layout" ?mode "a")
geSelectAllFig(cell)
leHiFlatten()
#geSave()
#hiCloseWindow(w)

cell = dbOpenCellViewByType("PTS18_KIT10" "inv2f" "layout")
w = geOpen(?window hiGetCurrentWindow() ?lib "PTS18_KIT10" ?cell "inv2f" ?view "layout" ?mode "a")
geSelectAllFig(cell)
leHiFlatten()





cell = dbOpenCellViewByType("PTS18_KIT10" "inv1f" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

cell = dbOpenCellViewByType("PTS18_KIT10" "inv2f" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))


cell = dbOpenCellViewByType("PTS18_KIT10" "inv3f" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

cell = dbOpenCellViewByType("PTS18_KIT10" "and2f" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

cell = dbOpenCellViewByType("PTS18_KIT10" "and3f" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

cell = dbOpenCellViewByType("PTS18_KIT10" "nand2f" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

cell = dbOpenCellViewByType("PTS18_KIT10" "nand3f" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

cell = dbOpenCellViewByType("PTS18_KIT10" "eor2f" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

cell = dbOpenCellViewByType("PTS18_KIT10" "eor3f" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

cell = dbOpenCellViewByType("PTS18_KIT10" "Opampf" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

cell = dbOpenCellViewByType("PTS18_KIT10" "enor2f" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

cell = dbOpenCellViewByType("PTS18_KIT10" "enor3f" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

cell = dbOpenCellViewByType("PTS18_KIT10" "dffrstf" "layout")
leLayerAndNot(cell list("NHD" "drawing") list("Nwell" "drawing") list("VTNE" "drawing"))
leLayerAnd(cell list("y0" "flight") list("Nwell" "drawing") list("VTPE" "drawing"))
leLayerAnd(cell list("y1" "flight") list("Poly" "drawing") list("y4" "flight"))
leLayerAnd(cell list("y1" "flight") list("Diff" "drawing") list("y5" "flight"))
leLayerSize(cell list("y4" "flight") -0.3 list("Cont" "drawing"))
leLayerSize(cell list("y5" "flight") -0.45 list("Cont" "drawing"))
leLayerSize(cell list("y2" "flight") -0.45 list("Via" "drawing"))

