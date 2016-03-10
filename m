From: Lada.Trimasova@synopsys.com (Lada Trimasova)
Date: Thu, 10 Mar 2016 18:57:48 +0000
Subject: [PATCH] arc: use little endian accesses
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E8F1A0@us01wembx1.internal.synopsys.com>
References: <1457544064-16167-1-git-send-email-ltrimas@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8EDF9@us01wembx1.internal.synopsys.com>
 <1457595846.2868.10.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8F1A0@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1457636268.457.34.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet, Alexey, Arnd,
On Thu, 2016-03-10@09:55 +0000, Vineet Gupta wrote:

Can you or Lada provide more details as to exactly what is not working - what
driver to be precise 8250 or dw-8250.
And where exactly the failure shows up. I want to understand this more
Noam told me off list that he has no issues with both big endian ARC + 8250 in
systemc model or silicon.

-Vineet



Driver is 8250, kernel is built for BE arc, nsim option in model "nsim_isa_big_endian = 1".

With current "readl" and "writel" implementation for ARC we read word from memory without any endianess manipulation. So in case of little endian architecture we get what we want: the first memory byte is the low byte in the word. But in case of big endian architecture the word endianess is swapped: the first memory byte is the high word byte.

And for example, let's see what happens when we use "readl" in  function "serial8250_early_in" in driver/tty/serial/8250.

Take a look to one line from memory dump:
0xf0000010: 0x0b    0x00    0x00    0x00    0x60    0x00    0x00    0x00

When kernel is built for little endian architecture, we read this data in status register in function "serial_putc" using "readl" function in driver/tty/serial/8250 as:
r0: 0x0000006
The low byte is 0x0b, so the condition "if ((status & BOTH_EMPTY) == BOTH_EMPTY)"  is true, as BOTH_EMPTY is some mask with low bytes set.

When kernel is built with "CPU_BIG_ENDIAN" and model nsim option is "nsim_isa_big_endian=1", we read this data as:
r0: 0x6000000
So as you can see the low byte is 0x00 and above mentioned condition never becomes true, we can't continue initialization.


Regards,
Lada
