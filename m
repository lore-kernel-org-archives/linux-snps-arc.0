From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 26 Oct 2016 10:21:46 -0700
Subject: [PATCH v2 4/5] ARC: MCIP: Set an initial affinity value in
 idu_irq_map
In-Reply-To: <861sz39iek.fsf@arm.com>
References: <1477313194-2310-1-git-send-email-yuriy.kolerov@synopsys.com>
 <1477313194-2310-4-git-send-email-yuriy.kolerov@synopsys.com>
 <39eae1ef-85d1-6dfb-b9fc-a052012c1fbf@synopsys.com>
 <127dbe3b-c9a9-3718-a711-128505ee363f@arm.com>
 <e656b0e5-419e-7984-7b5d-2115955cef4b@synopsys.com> <861sz39iek.fsf@arm.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <486a41ac-1bbf-c0f2-662e-3fea1d1f446b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 10/26/2016 09:36 AM, Marc Zyngier wrote:
> On Wed, Oct 26 2016@05:17:34 PM, Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>> On 10/26/2016 07:05 AM, Marc Zyngier wrote:
>>> It definitely feels weird to encode the interrupt affinity in the DT
>>> (the kernel and possible userspace usually know much better than the
>>> firmware). What is the actual reason for storing the affinity there?
>>
>> The IDU intc supports various interrupt distribution modes (Round
>> Robin, send to one cpu only etc) whcih in turn map to affinity
>> setting. When doing the DT binding, we decided to add that this to DT
>> to get the "seed" value for affinity - which user could optionally
>> changed after boot. This seemed like a benign design choice at the
>> time.
> 
> Right. But is this initial setting something that the kernel has to
> absolutely honor? 

Not necessarily.

> The usual behavior is to let kernel pick something
> sensible, and let the user mess with it afterwards.

Right !


> Is there any part of the kernel that would otherwise depend on this
> affinity being set to a particular mode? If the answer is "none", then I
> believe we can safely ignore that part of the binding (and maybe
> deprecate it in the documentation).

Not really. It was relevant for initial bring up of IDU software and hardware.
e.g. checking that uart behind idu works fine in both modes for very first user
mode prints, which is before you could make the init script cmds to change the
affinity etc. But that bridge has long been crossed.

So agree that we will ignore the affinity settings from DT and deprecate the binding.

Thx for steering us in the right direction. Much appreciated.

-Vineet
