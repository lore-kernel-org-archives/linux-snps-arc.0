From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 10 Mar 2016 05:19:37 +0000
Subject: [PATCH] arc: use little endian accesses
References: <1457544064-16167-1-git-send-email-ltrimas@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8EDF9@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E8EE1D@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Thursday 10 March 2016 10:35 AM, Vineet Gupta wrote:
> +CC Noam
>
> On Wednesday 09 March 2016 10:51 PM, Lada Trimasova wrote:
>> > Memory access primitives should use cpu_to_le16, cpu_to_le32, le16_to_cpu
>> > and le32_to_cpu because it is not really guaranteed that drivers handles
>> > any ordering themselves.
> That is the driver issue. readxx as API simply returns data in native endianness.
> We've had EZChip running big endian and so far and they didn't need this change.
>
>> > For example, serial port driver doesn't work when kernel is build for
>> > arc big endian architecture.
> Last I tested Big Endian on SDP with 8250 part + 8250 driver it was working fine.
> I presume this is the systemC model for device and standard 8250 driver and very
> likely the model is not fixed endian or something.
>
> Alexey knows about this stuff - this was discussed on lkml back in 2013 when he
> was fighting the Xilinx systemAce driver endian issues
>

Do you need "native-endian" DT entry in nsimosci DT bindings for uart ?
