From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 3 Apr 2019 16:44:32 +0000
Subject: [PATCH] ARC: [hsdk] Make it easier to add PAE40 region to DTB
References: <1554232683-8173-1-git-send-email-vgupta@synopsys.com>
 <1554309241.2797.20.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA230750146440077@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 4/3/19 9:34 AM, Eugeniy Paltsev wrote:
>> -		reg = <0x80000000 0x40000000>;  /* 1 GiB */
>> +		reg = <0x0 0x80000000 0x0 0x40000000>;  /* 1 GB lowmem */
>> +		/*     0x1 0x00000000 0x0 0x40000000>;     1 GB highmem */
> Could you please get rid of comment with reference for PAE40/HIGHMEM region in this patch?
> It gives wrong expectations that if we uncomment it and enable PAE40 in config we'll get working system.
> But it isn't true - we also need to remap AXI apertures appropriately.

Well I didn't have to do any remapping for successfully running a cross glibc
testsuite over ssh.
This was v5.1-rc1 + HIGHMEM+ PAE + patch to disable ioc + this patch for DT update.

Perhaps the remapping is needed when you are remapping DDR to 0 (for HIGHMEM + !PAE)

> Otherwise kernel will crush somewhere. Moreover kernel will crush for different reasons in case of launch
> via U-boot and via MDB (because we remap AXI apertures in U-boot for internal purposes).

This was all via mdb !

> If you really want to keep this - I can send you patch with AXI apertures remapping we need to apply firstly.

Well I can drop the last commented line but I don't want to do wholesale changes
to DT for enabling DT, so would liek to keep the rest of the patch anyways.

But sure send over the AXI remapping stuff - is that described in hsdk specs ?

-Vineet
