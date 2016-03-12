From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Sat, 12 Mar 2016 10:53:23 +0530
Subject: [PATCH V3] net: ezchip: adapt driver to little endian architecture
In-Reply-To: <20160303.172043.676796529681577242.davem@davemloft.net>
References: <1457014066-27651-1-git-send-email-ltrimas@synopsys.com>
 <20160303.172043.676796529681577242.davem@davemloft.net>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56E3A7CB.2020001@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 04 March 2016 03:50 AM, David Miller wrote:
> From: Lada Trimasova <Lada.Trimasova at synopsys.com>
> Date: Thu,  3 Mar 2016 17:07:46 +0300
> 
>> Since ezchip network driver is written with big endian EZChip platform it
>> is necessary to add support for little endian architecture.
>>
>> The first issue is that the order of the bits in a bit field is
>> implementation specific. So all the bit fields are removed.
>> Named constants are used to access necessary fields.
>>
>> And the second one is that network byte order is big endian.
>> For example, data on ethernet is transmitted with most-significant
>> octet (byte) first. So in case of little endian architecture
>> it is important to swap data byte order when we read it from
>> register. In case of unaligned access we can use "get_unaligned_be32"
>> and in other case we can use function "ioread32_rep" which reads all
>> data from register and works either with little endian or big endian
>> architecture.
>>
>> And then when we are going to write data to register we need to restore
>> byte order using the function "put_unaligned_be32" in case of
>> unaligned access and in other case "iowrite32_rep".
>>
>> The last little fix is a space between type and pointer to observe
>> coding style.
>>
>> Signed-off-by: Lada Trimasova <ltrimas at synopsys.com>
> 
> Applied to net-next, thanks.
> 

@Lada, could you provide the corresponding arch/arc/{boot/dts,configs}/ updates so
we can switch over to this device-model/driver for OSCI platform for 4.6.

Thx,
-Vineet
