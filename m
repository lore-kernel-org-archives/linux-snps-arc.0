From: alex.g@adaptrum.com (Alexandru Gagniuc)
Date: Wed, 2 Aug 2017 10:20:56 -0700
Subject: snps, dwmac interrupt storm (Was: ARC770: "unexpected IRQ trap at
 vector 00" during boot)
In-Reply-To: <f8fe08e7-aafb-6dfa-48b7-56c7bcd8f66a@synopsys.com>
References: <2b9507b2-58b7-1739-23df-973e7c865ef3@adaptrum.com>
 <4881796E12491D4BB15146FE0209CE6467DBE119@DE02WEMBXB.internal.synopsys.com>
 <5422227b-6ca3-b4f4-91a6-b760a4b98861@adaptrum.com>
 <4881796E12491D4BB15146FE0209CE6467DBED94@DE02WEMBXB.internal.synopsys.com>
 <222b10ef-2bd6-9212-5982-427854f0c19c@synopsys.com>
 <0c96e559-d0a8-8b1c-96e4-63799fb13d57@adaptrum.com>
 <f8fe08e7-aafb-6dfa-48b7-56c7bcd8f66a@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <9bef8225-70ae-f72e-fc5b-e66191cd2b2e@adaptrum.com>
To: linux-snps-arc@lists.infradead.org

On 08/01/2017 11:23 PM, Vineet Gupta wrote:
> On 08/02/2017 03:03 AM, Alex wrote:
>> On 07/25/2017 08:08 PM, Vineet Gupta wrote:
>> I have tried the workarouns I mentioned on top of linux 4.9.34, and it
>> works exactly as expected. however, on top of 4.13-rc3 [1], the story
>> is a lot different. As soon as I release the GMAC from reset, the boot
>> stops. I can single-step through JTAG, and see that the GMAC sends an
>> interrupt storm. The kernel doesn't have time to move on with the
>> dwmac initialization and register the interrupt, and that's that.
>
> I'm a bit confused here. Are you saying that your current patchset for
> ARC is broken on 4.13.x due to "something" while it was working with 4.9.

4.9: GOOD
4.13-rc3: BAD

>> I'd file this under both 'regression' and 'bug' categories.
>
> Sure - the question where is the bug/regression, is it in ARC port,
> driver updates or yet something else in the kernel.

Something else.

>> Not sure what changed under the hood from 4.9 to 4.13-rc3 to cause
>> such a drastically different behavior. I can't really do much else as
>> workarounds, since the GMAC registers are not writable while the GMAC
>> is in reset.
>
> We had a fair bit of churn in intc department in 4.10 and 4.11 but most
> of those were related to the IDU intc found only on HS38x cores, not on
> ARC700. To really narrow down the regression, perhaps try a dirty bisect
> trick (which works for me sometimes). Squash all the Adaptrum changes
> into 1 patch - I presume that same patch applies to 4.9 as to 4.13
> (otherwise u need to improvise). git bisect between 4.9 (good) and
> 4.13-rcx (bad) and patch -p1 < ur-patch at each stage.

I found the culprit, as evidenced in [Exhibit A]. I'm not really sure 
how that code is designed to work, but I'm suspecting before the change, 
the IRQ would get masked on the first hit, but now it's no longer masked.

I have reverted the patch in question on top of my 4.13 development 
branch and I can confirm that the issue is resolved.

Alex


# [Exhibit A]: Git output after two hours of hardcore bisecting:

bf22ff45bed664aefb5c4e43029057a199b7070c is the first bad commit
commit bf22ff45bed664aefb5c4e43029057a199b7070c
Author: Jeffy Chen <jeffy.chen at rock-chips.com>
Date:   Mon Jun 26 19:33:34 2017 +0800

     genirq: Avoid unnecessary low level irq function calls

     Check irq state in enable/disable/unmask/mask_irq to avoid unnecessary
     low level irq function calls.

     This has two advantages:
         - Conditionals are faster than hardware access

         - Solves issues with the underlying refcounting of the pinctrl
           infrastructure

     Suggested-by: Thomas Gleixner <tglx at linutronix.de>
     Signed-off-by: Jeffy Chen <jeffy.chen at rock-chips.com>
     Signed-off-by: Thomas Gleixner <tglx at linutronix.de>
     Cc: tfiga at chromium.org
     Cc: briannorris at chromium.org
     Cc: dianders at chromium.org
     Link: 
http://lkml.kernel.org/r/1498476814-12563-2-git-send-email-jeffy.chen at rock-chips.com

:040000 040000 ec5072725f8be0a3906e949aa0172cb3e00729d6 
27847e81e1c424a62938404fd48bea3c439d74c0 M      kernel
