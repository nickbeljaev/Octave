## Copyright (C) 1996, 1997 John W. Eaton
##
## This file is part of Octave.
##
## Octave is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 2, or (at your option)
## any later version.
##
## Octave is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, write to the Free
## Software Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
## 02110-1301, USA.

## -*- texinfo -*-
## @deftypefn {Function File} {} __axis_label__ (@var{caller}, @var{text})
## Utility function for @code{xlabel}, @code{ylabel}, and @code{zlabel}.
## @end deftypefn

## Author: jwe

function retval = __axis_label__ (caller, txt)

  ## If we have an even number of arguments, they should be
  ## property-value pirs.

  if (nargin == 2)
    if (ischar (txt))
      ca = gca ();
      set (ca, caller, txt);
      if (nargout > 0)
	retval = get (ca, caller);
      endif
    endif
  else
    print_usage ();
  endif

endfunction
