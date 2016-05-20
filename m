From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 20 May 2016 04:48:19 +0000
Subject: linux-4.5-rc3/arch/arc/kernel/unwind.c:629: undefined behaviour ?
References: <DUB128-W14BBCF3C8444D1C16443DE9CD50@phx.gbl>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4EAC475@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

What compiler are you using - for me it builds clean here !

-Vineet

On Monday 08 February 2016 07:07 PM, David Binderman wrote:
> Hello there,
>
> [linux-4.5-rc3/arch/arc/kernel/unwind.c:629]: (warning) Invalid test for overflow 'ptr+len<ptr'. Condition is always false unless there is overflow, and overflow is Undefined Behaviour.
>
> Source code is
>
>         if (ptr + len < ptr || ptr + len> end)
>             return -1;
>
> Suggest code rework.
>
>
> Regards
>
> David Binderman
>
>  		 	   		  
