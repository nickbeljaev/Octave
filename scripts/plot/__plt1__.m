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
## @deftypefn {Function File} {} __plt1__ (@var{h}, @var{x1}, @var{fmt}, @var{key})
## @end deftypefn

## Author: jwe

function __plt1__ (h, x1, fmt, key)

  if (nargin < 2 || nargin > 4)
    print_usage ();
  endif

  if (nargin < 3 || isempty (fmt))
    fmt = {""};
  endif

  if (nargin < 4 || isempty (key))
    key = {""};
  endif

  if (! iscellstr (fmt))
    error ("__plt1__: fmt must be a cell array of character strings");
  endif

  if (! iscell (key))
    error ("__plt1__: fmt must be a cell array");
  endif

  [nr, nc] = size (x1);
  if (nr == 1)
    x1 = x1.';
    tmp = nr;
    nr = nc;
    nc = tmp;
  endif
  x1_i = imag (x1);
  if (any (any (x1_i)))
    x2 = x1_i;
    x1 = real (x1);
  else
    x2 = x1;
    x1 = (1:nr)';
  endif

  __plt2__ (h, x1, x2, fmt, key);

endfunction
