From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 21 May 2018 09:59:17 -0700
Subject: ARC compact700 NPS platform - EZ_MachineCheck exception handler
In-Reply-To: <DB6PR05MB4597A3B8BC5BE80BD039B0AAB2950@DB6PR05MB4597.eurprd05.prod.outlook.com>
References: <DB6PR05MB4597A3B8BC5BE80BD039B0AAB2950@DB6PR05MB4597.eurprd05.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <0c84cd14-19dc-a22c-271c-11cbd18ded3a@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 05/21/2018 07:14 AM, Ofer Levi(SW) wrote:
> Resending, due to typo in LKML mail  address.

Also please CC linux-snps-arc at lists.infradead.org for any ARC Linux related posts.

>   
>   The EV_MachineCheck exception handler is halting the core for exceptions
>   which are not tlb_overlap_fault.
>   Since for the NPS platform each core is running a single thread in ZOL (Zero
>   Overhead Linux) isolation mode, we feel that most of the time it is safe to
>   resume execution instead of halting the core.

Most of the time is not good enough when dealing with OS code :-(
A Machine check excepting implies something went terribly wrong. Some of those 
cases can be handled gracefully (such as duplicate TLB entry), but others can't so 
continuing despite it is recipe for disaster. Perhaps your chip has some spurious 
Machine check exceptions ?

>   I would appreciate it if you could review the change  below

Next time please send a real patch so I know right away what was changed.

> and let me know
>   what you think, if this change is valid or if we missed or overlooked
>   something.
>   We are not looking to push this change upstream, but will be used on some
>   systems.

Hmm, but you have to explain why those machine checks are fine !

>   
>   Please see below our implementation after label 1.
>   
>   Thanks
>   Ofer
>   
>   ENTRY(EV_MachineCheck)
>   
>   	EXCEPTION_PROLOGUE
>   
> ...
>   	brne    r3, ECR_C_MCHK_DUP_TLB, 1f
>   
>   	bl      do_tlb_overlap_fault
>   	b       ret_from_exception
>   
>   1:
>   	FAKE_RET_FROM_EXCPN

You don't need this.

>   	bl		do_machine_check  ; using DO_ERROR_INFO macro

We don't have above function in code. There's do_machine_check_fault() which calls 
die() -> flag 1 - so it would halt the kernel and would never return here.
So your patch is broken in implementation as well.

>   	b       ret_from_exception
>   
>   END(EV_MachineCheck)
>
>
