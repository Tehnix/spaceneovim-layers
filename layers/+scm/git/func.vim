function! PushToCurrentBranch()
  execute ":Gwrite"
  let branch = fugitive#statusline()
  let branch = substitute(branch, '\c\v\[?GIT\(([a-z0-9\-_\./:]+)\)\]?', $BRANCH.' \1', 'g')
  execute ":Git push origin" . branch
endfunction

command! PushToCurrentBranch call PushToCurrentBranch()
