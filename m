From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 18 Jan 2018 14:50:22 -0800
Subject: [PATCH] ARC: Add a knob to control usage of dual-issue
In-Reply-To: <1516302661.8324.32.camel@synopsys.com>
References: <20180118134831.41489-1-abrodkin@synopsys.com>
 <7d97edc0-d0ee-326b-bcd2-c6731aa953b2@synopsys.com>
 <1516302661.8324.32.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <67318494-971f-0e3f-31e6-d19c59950cd5@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/18/2018 11:11 AM, Alexey Brodkin wrote:
> Hi Vineet,
>
> On Thu, 2018-01-18@10:54 -0800, Vineet Gupta wrote:
>> On 01/18/2018 05:48 AM, Alexey Brodkin wrote:
>>> HS48 core starts with dual-issue enabled but in some cases like
>>> debugging as well as benchmarking it might be useful to disable
>>> dual-issue for a particular run.
>>>
>>> Note:
>>>     1. To disable dual-issue user has to change a value of a global variable
>>>        in target's memory right before start of Linu kernel execution
>>>        (most probably via JTAG)
>>>
>>>     2. Disabling happens very early on boot and to get it back enabled it's
>>>        required to restart Linux kernel. I.e. with this change we don't allow
>>>        toggling dual-issue state in random moments of run-time
>> But we need access to a debugger anyways to change this global variable.
>> If you already have that won't it be better to change the aux register itself from
>> the debugger itself.
>> I don't really see how the global variable way of toggle adds any value here ?
> I think there's some sense in a global variable.
>
> 1. Not sure if OpenOCD/GDB pair for ARC allows to read/write random AUX regs.
>     Probably allows but I guess we'll need a new .xml description which lists EXEC_CTRL
>     AUX reg. Correct me if I'm wrong here.

Not sure of this a strong argument ...

>
> 2. If somebody wants to disable dual-issue persistently (here I mean building an image
>     which had dual-issue disabled and there's no need to alter anything after image loading)

Ok this is more reasonable !
But can we do this in early boot code then. There's a fair bit of code leading up 
to where we are doing now so I'd prefer we do it just as we do for disabling L1 
caches.
Please note that SLC / IOC are special - as much as I liked to do them super early 
- we can't as there's fair bit of code bloat / mem size etc which we don't knwo 
that early.

>     then it's possible just to change a simple and very obvious line in arch/arc/kernel/setup.c
>     other than trying to guess what could be good place in sources to stick that AUX reg write.
>     Note we don't explicitly do reads of AUX_EXEC_CTRL instead we just use READ_BCR macro so
>     for newcomers it might not be immediately obvious what to do and where.
>     Add the fact that logic of the flag is reversed...
>
> -Alexey
