/*

Copyright (C) 2016-2017 John W. Eaton

This file is part of Octave.

Octave is free software; you can redistribute it and/or modify it
under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 3 of the License, or
(at your option) any later version.

Octave is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with Octave; see the file COPYING.  If not, see
<http://www.gnu.org/licenses/>.

*/

#if ! defined (octave_signal_wrappers_h)
#define octave_signal_wrappers_h 1

#include <sys/types.h>

#if ! defined (__cplusplus)
#  include <stdbool.h>
#endif

#if defined __cplusplus
extern "C" {
#endif

typedef void octave_sig_handler (int);

extern int octave_kill_wrapper (pid_t pid, int signum);

extern char * octave_strsignal_wrapper (int signum);

extern bool octave_have_kill (void);

extern bool octave_get_sig_number (const char *signame, int *signum);

extern octave_sig_handler *
octave_set_signal_handler_by_name (const char *signame,
                                   octave_sig_handler *handler,
                                   bool restart_syscalls);

octave_sig_handler *
octave_set_signal_handler_internal (int sig, octave_sig_handler *handler,
                                    bool restart_syscalls);

extern int octave_num_signals (void);

extern void * octave_block_child (void);

extern void octave_unblock_child (void *context);

extern void octave_block_interrupt_signal (void);

extern void octave_unblock_interrupt_signal (void);

extern void octave_save_signal_mask (void);

extern void octave_restore_signal_mask (void);

extern int octave_raise_wrapper (int signum);

#if defined __cplusplus
}
#endif

#endif
