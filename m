From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 21 Nov 2018 19:41:56 +0000
Subject: Misaligned Access
References: <13D59CF9CEBAF94592A12E8AE55501350113CD10@DE02WEMBXB.internal.synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B0B4CD5@US01WEMBX2.internal.synopsys.com>
 <9ffd1270-ad92-88b7-eb53-85c65fe971dd@synopsys.com>
 <f8c469e7-9e1d-18d6-4e56-ba4338462048@synopsys.com>
 <ebe7f165-2901-2885-0583-c7be53329372@synopsys.com>
 <4881796E12491D4BB15146FE0209CE6468198AC6@DE02WEMBXB.internal.synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA230750146415496@US01WEMBX2.internal.synopsys.com>
 <661a4323-5768-4977-5434-ab644c5418aa@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641580A@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

+CC lkml, Arnd : subject matter expert

On 11/21/18 10:06 AM, Vitor Soares wrote:
> I use the follow function to get data from a RX Fifo.
>
>
> static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
>                         u8 *bytes, int nbytes)
> {
>      readsl(master->regs + RX_TX_DATA_PORT, bytes, nbytes / 4);

So the semantics are reading the same fifo register N times, to get the N words,
hence read*s*l is appropriate. That however expects the buffer to be 4 bytes
aligned, hence your issue. You can't possibly use the reads*b* as we want the

The obvious but crude hack is to use a temp array for readsl and then copy over
using memcpy, but I'm sure there are better ways, @Arnd ? To summarize is issue is
a driver triggering unaligned access due to the misinteraction of API (driver get
an unaligned u8 *) which goes against expectations of io accessor readl  (needed
since the register contents are 4 bytes)


>      if (nbytes & 3) {
>          u32 tmp;
>
>          readsl(master->regs + RX_TX_DATA_PORT, &tmp, 1);
>          memcpy(bytes + (nbytes & ~3), &tmp, nbytes & 3);
>      }
> }
>
>
> and the pointer u8 *bytes is what is unaligned and breaks when inside of 
> realdsl() it does:
>
>      *buf++ = x;
>
>
> Note that the u8 *bytes pointer is the __u8 *buf of the i2c_msg struct.
