From: marc.zyngier@arm.com (Marc Zyngier)
Date: Wed, 9 Nov 2016 09:36:13 +0000
Subject: [RFC] ARCv2: MCIP: Deprecate setting of affinity in Device Tree
In-Reply-To: <86621069-d68c-a87e-508f-d1e7b7c8948f@synopsys.com>
References: <1478261791-2793-1-git-send-email-yuriy.kolerov@synopsys.com>
 <86621069-d68c-a87e-508f-d1e7b7c8948f@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <f6fc7248-f573-344d-4b85-98735965e265@arm.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

On 08/11/16 20:57, Vineet Gupta wrote:
> +CC MarcZ
> 
> Hi Marc,
> 
> I have a question below
> 

[...]

> So as discussed in a prior thread, we no longer support setting the default
> affinity via DT (so removed from xlate function). However we are now using the
> domain map function to set "seed" affinity based on cpu_online_mask(). Will that
> be the wrong place again to do this too.
> Also as Yuriy notes above, it is not guaranteed that all cpus will be online when
> the map function is called. So then better to set to boot cpu only : wondering
> what approach you guys take for ARM ?

For global interrupts (that can target any CPU), we make them affine to
the boot CPU, and let userspace move them around if required. Note that
we do not support round-robin on any of our recent interrupt
controllers, but maybe that's an acceptable configuration for you.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
