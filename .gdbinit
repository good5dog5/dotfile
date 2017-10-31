set confirm off
set auto-load safe-path /

set print array on
set print array-indexes on
set print asm-demangle on
set print demangle on
set print object on
set print pretty on
set print static-members on
set print symbol-filename on
set print thread-events off
set print vtbl on


# helpers
define chr
  printf "[%c]", $arg0
end

define hex
  printf "0x%x", $arg0
end

define ord
  printf "[%d]", $arg0
end

define bin
  p/t $arg0
end

# aliases
define px
  p/x $arg0
end
define ps
  p/s $arg0
end
define pu
  p/u $arg0
end
define pb
  p/t $arg0
end
define py
  python-interactive
end
define pc
  x/8i $pc-10
end
define plist
  set var $n = $arg0
  while $n
    printf "%d ", $n->data
    set var $n = $n->link
  end
  printf "\n"
end

