From: marc.zyngier@arm.com (Marc Zyngier)
Date: Wed, 26 Oct 2016 17:36:35 +0100
Subject: [PATCH v2 4/5] ARC: MCIP: Set an initial affinity value in
 idu_irq_map
In-Reply-To: <e656b0e5-419e-7984-7b5d-2115955cef4b@synopsys.com> (Vineet
 Gupta's message of "Wed, 26 Oct 2016 09:17:34 -0700")
References: <1477313194-2310-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1477313194-2310-4-git-send-email-yuriy.kolerov@synopsys.com>
 <39eae1ef-85d1-6dfb-b9fc-a052012c1fbf@synopsys.com>
 <127dbe3b-c9a9-3718-a711-128505ee363f@arm.com>
 <e656b0e5-419e-7984-7b5d-2115955cef4b@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <861sz39iek.fsf@arm.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Oct 26 2016@05:17:34 PM, Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> On 10/26/2016 07:05 AM, Marc Zyngier wrote:
>> It definitely feels weird to encode the interrupt affinity in the DT
>> (the kernel and possible userspace usually know much better than the
>> firmware). What is the actual reason for storing the affinity there?
>
> The IDU intc supports various interrupt distribution modes (Round
> Robin, send to one cpu only etc) whcih in turn map to affinity
> setting. When doing the DT binding, we decided to add that this to DT
> to get the "seed" value for affinity - which user could optionally
> changed after boot. This seemed like a benign design choice at the
> time.

Right. But is this initial setting something that the kernel has to
absolutely honor? The usual behavior is to let kernel pick something
sensible, and let the user mess with it afterwards.

Is there any part of the kernel that would otherwise depend on this
affinity being set to a particular mode? If the answer is "none", then I
believe we can safely ignore that part of the binding (and maybe
deprecate it in the documentation).

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny.
