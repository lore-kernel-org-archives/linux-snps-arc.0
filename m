From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 10 Mar 2016 09:55:49 +0000
Subject: [PATCH] arc: use little endian accesses
References: <1457544064-16167-1-git-send-email-ltrimas@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8EDF9@us01wembx1.internal.synopsys.com>
 <1457595846.2868.10.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E8F1A0@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 10 March 2016 01:14 PM, Alexey Brodkin wrote:
>>> For example, serial port driver doesn't work when kernel is build for
>>> arc big endian architecture.
>> Last I tested Big Endian on SDP with 8250 part + 8250 driver it was working fine.
>> I presume this is the systemC model for device and standard 8250 driver and very
>> likely the model is not fixed endian or something.
> Model is indeed little-endian. We build it only once and than changing
> only "nsim_isa_big_endian" property (which changes only CPU core endianess) may use
> it equally well with little- and big-endian builds of Linux kernel.

Can you or Lada provide more details as to exactly what is not working - what
driver to be precise 8250 or dw-8250.
And where exactly the failure shows up. I want to understand this more
Noam told me off list that he has no issues with both big endian ARC + 8250 in
systemc model or silicon.

-Vineet
