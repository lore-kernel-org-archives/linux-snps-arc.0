From: khilman@baylibre.com (Kevin Hilman)
Date: Tue, 05 Feb 2019 12:14:12 -0800
Subject: [PATCH 2/2] arc: hsdk_defconfig: enable CONFIG_ARC_UBOOT_SUPPORT
In-Reply-To: <4881796E12491D4BB15146FE0209CE64681D4DC3@DE02WEMBXB.internal.synopsys.com>
References: <1549355535-22052-1-git-send-email-clabbe@baylibre.com>
 <1549355535-22052-3-git-send-email-clabbe@baylibre.com>
 <1549366931.27724.26.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075014642EBE9@US01WEMBX2.internal.synopsys.com>
 <4881796E12491D4BB15146FE0209CE64681D4DC3@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <7h4l9ivvqj.fsf@baylibre.com>
To: linux-snps-arc@lists.infradead.org

Alexey Brodkin <alexey.brodkin at synopsys.com> writes:

> Hi Vineet, Corentin,
>
>> -----Original Message-----
>> From: Vineet Gupta <vgupta at synopsys.com>
>> Sent: Tuesday, February 5, 2019 7:42 PM
>> To: Eugeniy Paltsev <paltsev at synopsys.com>; clabbe at baylibre.com
>> Cc: linux-kernel at vger.kernel.org; alexey.brodkin at synopsys.com; khilman at baylibre.com; linux-snps-
>> arc at lists.infradead.org
>> Subject: Re: [PATCH 2/2] arc: hsdk_defconfig: enable CONFIG_ARC_UBOOT_SUPPORT
>> 
>> On 2/5/19 3:42 AM, Eugeniy Paltsev wrote:
>> > Hi Corentin,
>> >
>> > In case of devboards (like HSDK) we really often disable bootloader and load
>> > Linux image in memory via JTAG. Enabling CONFIG_ARC_UBOOT_SUPPORT by
>> > default will break it as we will try to interpret some junk in a registers
>> > as a pointers to bootargs/etc which aren't set by anyone in case of JTAG using.
>> >
>> > So it isn't a good idea to have CONFIG_ARC_UBOOT_SUPPORT enabled by default.
>> 
>> Right.
>> 
>> It is difficult to accommodate everyone's needs (often conflicting) in a single
>> defconfig.
>> Can you folks create an out-of-tree defconfig or some such.
>
> I do think there's a proper solution which [hopefully] makes both parties happy.
> Eugeniy is about to send-out a patch which allows us to not care about
> garbage in R0/R2 when running after U-Boot.

OK, cool, that sounds like a good workaround for the JTAG use case.

Just curious: what is the more common case for end-users?  u-boot or
JTAG?

At least on every other arch/board we use in kernelCI, u-boot is the
*much* more common load path than JTAG.  IMO, I would suggest that in
the case of unresolvable conflicts like, u-boot should be the normal
path, and JTAG would be the special case.

Anyways, hopefully the patch from Eugeniy works and gets rid of the
conflict. 

Related: if you end up accepting this series, they'll also need to be
backported to stable branches if we want to support them in kernelCI.

Kevin
