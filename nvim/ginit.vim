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

" Right Click Context Menu (Copy-Cut-Paste) - inbuilt in neovim-0.10 now
"""nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
"""inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
"""vnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
"xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>

endif   " end if not neovide
