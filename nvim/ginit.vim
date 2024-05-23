" Some GUI parameters for nvim-qt
if (g:neovide != v:true)

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

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
"xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>

endif   " end if not neovide
