From: schwab@linux-m68k.org (Andreas Schwab)
Date: Tue, 18 Dec 2018 23:36:07 +0100
Subject: [PATCH 17/21] ARC: testsuite fix: stdlib/tst-makecontext
In-Reply-To: <1545167083-16764-18-git-send-email-vgupta@synopsys.com> (Vineet
 Gupta's message of "Tue, 18 Dec 2018 13:04:39 -0800")
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-18-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87ftuu799k.fsf@igel.home>
To: linux-snps-arc@lists.infradead.org

On Dez 18 2018, Vineet Gupta <vineet.gupta1@synopsys.com> wrote:

> diff --git a/sysdeps/unix/sysv/linux/arc/setcontext.S b/sysdeps/unix/sysv/linux/arc/setcontext.S
> index 3f503c661d95..6ec2ec0ddc79 100644
> --- a/sysdeps/unix/sysv/linux/arc/setcontext.S
> +++ b/sysdeps/unix/sysv/linux/arc/setcontext.S
> @@ -79,6 +79,8 @@ weak_alias(__setcontext, setcontext)
>  
>  ENTRY(__startcontext)
>  
> +	cfi_register (blink, r15)
> +

You should precede that with a dummy .cfi_label (see
sysdeps/riscv/start.S) to force the CFI into the FDE instead of the
CIE.  Also, can you use cfi_undefined instead?

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
