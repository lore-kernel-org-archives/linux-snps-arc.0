From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 21 Nov 2018 20:15:54 +0000
Subject: Misaligned Access
References: <13D59CF9CEBAF94592A12E8AE55501350113CD10@DE02WEMBXB.internal.synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B0B4CD5@US01WEMBX2.internal.synopsys.com>
 <9ffd1270-ad92-88b7-eb53-85c65fe971dd@synopsys.com>
 <f8c469e7-9e1d-18d6-4e56-ba4338462048@synopsys.com>
 <ebe7f165-2901-2885-0583-c7be53329372@synopsys.com>
 <4881796E12491D4BB15146FE0209CE6468198AC6@DE02WEMBXB.internal.synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA230750146415496@US01WEMBX2.internal.synopsys.com>
 <661a4323-5768-4977-5434-ab644c5418aa@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075014641580A@US01WEMBX2.internal.synopsys.com>
 <CAK8P3a1Gszsg7Wky+7Z8TuOtAtZR2ia-QjYm01-wWKRmYfdm7Q@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014641664A@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/21/18 12:12 PM, Arnd Bergmann wrote:
> On Wed, Nov 21, 2018@8:42 PM Vineet Gupta <vineet.gupta1@synopsys.com> wrote:
>> +CC lkml, Arnd : subject matter expert
>>
>> On 11/21/18 10:06 AM, Vitor Soares wrote:
>>> I use the follow function to get data from a RX Fifo.
>>>
>>>
>>> static void dw_i3c_master_read_rx_fifo(struct dw_i3c_master *master,
>>>                         u8 *bytes, int nbytes)
>>> {
>>>      readsl(master->regs + RX_TX_DATA_PORT, bytes, nbytes / 4);
>> So the semantics are reading the same fifo register N times, to get the N words,
>> hence read*s*l is appropriate. That however expects the buffer to be 4 bytes
>> aligned, hence your issue. You can't possibly use the reads*b* as we want the
>>
>> The obvious but crude hack is to use a temp array for readsl and then copy over
>> using memcpy, but I'm sure there are better ways, @Arnd ? To summarize is issue is
>> a driver triggering unaligned access due to the misinteraction of API (driver get
>> an unaligned u8 *) which goes against expectations of io accessor readl  (needed
>> since the register contents are 4 bytes)
> Is this again on ARC or some other architecture that cannot do unaligned
> access to normal RAM? On ARMv7 or x86, you should never see a problem
> because the CPU handles misaligned writes. On ARMv4/v5, the readsl()
> implementation internally aligns the access to the output buffer so it
> will work correctly.

This is indeed on ARC: on ARC700 unaligned access to RAM was never supported and
on HS38x cores, it is configurable, so the API probably needs to support both cases.

Thx,
-Vineet
