From: joseph@codesourcery.com (Joseph Myers)
Date: Tue, 18 Dec 2018 22:56:27 +0000
Subject: [PATCH 01/21] longlong.h: sync from gcc to fix ARC inline asm
 constraints
In-Reply-To: <1545167083-16764-2-git-send-email-vgupta@synopsys.com>
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-2-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <alpine.DEB.2.21.1812182254560.30183@digraph.polyomino.org.uk>
To: linux-snps-arc@lists.infradead.org

On Tue, 18 Dec 2018, Vineet Gupta wrote:

> diff --git a/ChangeLog b/ChangeLog
> index 027b23493ed8..456e4b670c23 100644
> --- a/ChangeLog
> +++ b/ChangeLog
> @@ -2,6 +2,7 @@
>  
>  	* sysdeps/unix/make-syscalls.sh: Fix comment referencing
>  	syscall-template file.
> +	* stdlib/longlong.h: Fix asm constraints for ARC code.

I don't see the above context in the current checked-in ChangeLog file.  
Patch 1 in a series should be creating a new ChangeLog entry in any case, 
not adding to an existing one (and it's best not to include the ChangeLog 
entry in the diffs, only adding it at the final commit time, to avoid 
problems for people applying your patches).

-- 
Joseph S. Myers
joseph at codesourcery.com
