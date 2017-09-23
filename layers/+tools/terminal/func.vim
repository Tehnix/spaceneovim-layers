command! -nargs=0 -bar SpaceNeovimTerminalShellCmd call feedkeys(":! ")
command! -nargs=0 -bar SpaceNeovimTerminalOpen rightbelow split | terminal
