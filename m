From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 6 Sep 2016 13:21:21 -0700
Subject: WTF: patch "[PATCH] ARC: Support syscall ABI v4" was seriously
 submitted to be applied to the 4.7-stable tree?
In-Reply-To: <20160906193810.GB22028@kroah.com>
References: <1473080592214136@kroah.com>
 <584a8fcd-6876-de0d-3c5e-8b4dad12c49d@synopsys.com>
 <20160906193810.GB22028@kroah.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7ab12d76-875a-c06f-08e3-ef628edda1b9@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 09/06/2016 12:39 PM, gregkh@linuxfoundation.org wrote:
> On Tue, Sep 06, 2016@09:50:46AM -0700, Vineet Gupta wrote:
>> On 09/05/2016 06:03 AM, gregkh@linuxfoundation.org wrote:
>>> The patch below was submitted to be applied to the 4.7-stable tree.
>>>
>>> I fail to see how this patch meets the stable kernel rules as found at
>>> Documentation/stable_kernel_rules.txt.
>>>
>>> I could be totally wrong, and if so, please respond to 
>>> <stable at vger.kernel.org> and let me know why this patch should be
>>> applied.  Otherwise, it is now dropped from my patch queues, never to be
>>> seen again.
>> Hi Greg,
>>
>> We are about to switch to new version of GNU tools (gcc 6.x based) which
>> unfortunately has a non compatible ABI change - as described in the patch.
>>
>> Some of our customers are going to stick with older kernels and thus this helps
>> them upgrade to newer tools with their existing baseline kernels.
> That's nice, but it's a new feature.  Stick with old userspace for older
> kernels, and use new kernels for new userspace if you so desire.

I understand your point. This is what we did at the time of upstreaming the kernel
- and was something I was hoping to avoid this time because this is a flag day
change. People get locked into kernel version or tools - when the kernel code
itself didn't really change a bit.

But if this really is against the norms of stable backports, then I suppose we
can't do much ?

Thx,
-Vineet

>
> We do allow some new gcc fixes to be backported, but that's always where
> we have found bugs, or build warnings.  Not "we need to support gcc6 for
> old kernels", as really, if someone wants to update userspace, they
> don't update their kernel?
>
> thanks,
>
> greg k-h
>
