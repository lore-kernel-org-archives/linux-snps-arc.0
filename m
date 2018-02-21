From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 21 Feb 2018 15:42:36 -0800
Subject: [PATCH 1/3] ARC: mcip: halt GFRC together with ARC cores
In-Reply-To: <a4a20519-e8b0-3522-0528-6de2595635ed@synopsys.com>
References: <20180221094027.12674-1-Eugeniy.Paltsev@synopsys.com>
 <a4a20519-e8b0-3522-0528-6de2595635ed@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <8c86b9f9-a4b7-1217-7cf3-1d8891292679@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 02/21/2018 12:31 PM, Vineet Gupta wrote:
> Hi Eugeniy,
> 
>> Starting from ARC HS v3.0
> 
>  From the STAR fix, it seem this was fixed in HS 2.1c, so you should be able to 
> test it on HSDK, which was my next question: where and how did you test this and 
> verify that it works as we think it does. I tried the patch on HSDK and I still 
> see the rcu_preempt self-detected stall error splat when running hackbench and 
> pausing the target with Metaware debugger. Perhaps we need to write a small test 
> case to check what's going on. Also try that on AXS103 release which is definitely 
> HS 3.0 !

So I tried this on both.
  - HSDK   (HS 2.1c): Doesn't work
  - AXS103 (HS 3.0) : Works

Fortunately we can read (yet another BCR: GFRC_BUILD) and infer whether this is 
supported or not. So add that check in mcip_update_gfrc_halt_mask()

>> it's possible to tie GFRC to state of up-to 4
>> ARC cores with help of GFRC's CORE register where we set a mask for
>> cores which state we need to rely on.

On second thoughts, do we really have to do this per cpu. Just write 0xf once just 
as Alexey did in first iteration.

-Vineet
