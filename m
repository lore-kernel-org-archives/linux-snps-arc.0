From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Thu, 12 Jul 2018 08:32:34 +0000
Subject: [PATCH] ARC: Improve handling of fatal signals in do_page_fault()
In-Reply-To: <20180629182005.10243-1-abrodkin@synopsys.com>
References: <20180629182005.10243-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <cad7f596e41dbfef8d1ee465b13704d738e116bb.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On Fri, 2018-06-29@11:20 -0700, Alexey Brodkin wrote:
> This was triggered by investigation of a deadlock after OOM killer invocation,
> see [1] for more details.
> 
> Looks like our handling of fatal signal in do_page_fault() has some issues:
> 
> 1. We only want to do special (read "early") handling of fatal signal
>    if handle_mm_fault() returned VM_FAULT_RETRY so that we don't loop
>    in retry loop endlessly, otherwise we'll handle that signal normally
>    on exit from exception handler.
> 
> 2. up_read() is not needed as indeed it will be done in __lock_page_or_retry()
>    in mm/filemap.c.
> 
> With above comments in mind simplified version should be like that:
> ------------------------------->8---------------------------
> 	if (fatal_signal_pending(current)
> 		if (fault & VM_FAULT_RETRY)
> 			if (user_mode(regs))
> 				return;
> ------------------------------->8---------------------------
> 
> But looks like there's a room for improvement, see [2].
> Instead of proceeding forward and then inevitably hitting retry path we
> short-cut right to kernel fix-up code in no_context.
> 
> [1] http://lists.infradead.org/pipermail/linux-snps-arc/2018-February/003403.html
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=746a272e44141af24a02f6c9b0f65f4c4598ed42
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>

I should have put that in commit message right away:)

This patch fixes OOM lock-up we were seeing previously,
see STAR 9001304674 "OOM killer hangs system".

-Alexey
