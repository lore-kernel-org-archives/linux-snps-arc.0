From: Tudor.Ambarus@microchip.com (Tudor.Ambarus@microchip.com)
Date: Thu, 22 Nov 2018 17:45:39 +0000
Subject: [PATCH v2 0/2] MTD: spi-nor: add support for sst26wf016,
 sst26wf032
In-Reply-To: <1542641133.4940.5.camel@synopsys.com>
References: <20180910114628.19156-1-Eugeniy.Paltsev@synopsys.com>
 <1540216028.19916.6.camel@synopsys.com> <20181022155635.2175a595@bbrezillon>
 <1542641133.4940.5.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <60792e70-a530-3403-f144-c430639d01f1@microchip.com>
To: linux-snps-arc@lists.infradead.org

Hi, Eugeniy,

This is just to let you know that I'm getting familiar with the individual block
lock support. You'll have my review in the first part of next week.

Thank you for your patience,
ta

On 11/19/2018 05:25 PM, Eugeniy Paltsev wrote:
> Hi Boris,
> 
> As 4.20-rc1 is already out I guess you can pick this patches to spi-nor/next?
> 
> Thanks.
> 
> On Mon, 2018-10-22@15:56 +0200, Boris Brezillon wrote:
>> +Tudor
>>
>> Hi Eugeniy,
>>
>> Sorry, it's already too late for 4.20, and I won't apply patches to the
>> spi-nor/next branch before 4.20-rc1 is out.
>>
>> Tudor, Marek, can I have a Reviewed-by/Acked-by on this patchset?
>>
>> Thanks,
>>
>> Boris
>>
>>>
>>> On Mon, 2018-09-10@14:46 +0300, Eugeniy Paltsev wrote:
>>>> Add support for the SST sst26wf016 and sst26wf032 flash IC:
>>>>
>>>> sst26wf*** flash series block protection implementation differs from other
>>>> SST series, so we add implementation for sst26wf*** lock/unlock/is_locked
>>>> functions.
>>>>
>>>> Add sst26wf016 and sst26wf032 flash IC info to spi_flash_ids list.
>>>>
>>>> Eugeniy Paltsev (2):
>>>>   mtd: spi-nor: Add support of sst26wf* flash ICs protection ops
>>>>   mtd: spi-nor: add support for sst26wf016, sst26wf032
>>>>
>>>>  drivers/mtd/spi-nor/spi-nor.c | 179 ++++++++++++++++++++++++++++++++++++++++++
>>>>  include/linux/mtd/spi-nor.h   |   4 +
>>>>  2 files changed, 183 insertions(+)
>>>>   
>>
>>
