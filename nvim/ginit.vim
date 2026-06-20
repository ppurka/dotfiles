" Some GUI parameters for nvim-qt
if !exists("g:neovide")

if exists(":GuiAdaptiveFont")
    GuiAdaptiveFont     1
endif
if exists(":GuiPopupmenu")
    GuiPopupmenu        1
endif
if exists(":GuiScrollBar")
    GuiScrollBar        1
endif
if exists(":GuiTabline")
    GuiTabline          1
endif
if exists(":GuiTablineBuffers")
    GuiTablineBuffers   0
endif
if exists(":GuiRenderLigatures")
    GuiRenderLigatures  1
endif

endif   " end if not neovide
