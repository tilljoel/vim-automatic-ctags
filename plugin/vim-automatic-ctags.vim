if exists("g:automatic_ctags")
  finish
endif

if &compatible
  echohl ErrorMsg
  echohl none
  finish
endif

" Check for Ruby functionality.
if !has("ruby")
    echohl ErrorMsg
    echon "Sorry, automatic_ctags needs ruby"
  finish
endif

let g:automatic_ctags = "true"

function! AutomaticCtags()
  :ruby AutomaticCtags::generate
endfunction

command AutomaticCtags :call AutomaticCtags()

ruby << EOF

begin

  require 'automatic_ctags/automatic_ctags'
  #  $automatic_ctags = AutomaticCtags
rescue LoadError
  load_path_modified = false
  ::VIM::evaluate('&runtimepath').to_s.split(',').each do |path|
    if path.include?("automatic-ctags") and !$LOAD_PATH.include?(lib) and File.exist?(lib)
      $LOAD_PATH << lib
      load_path_modified = true
    end
  end

  retry if load_path_modified
end

EOF
