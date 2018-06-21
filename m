From: Gustavo.Pimentel@synopsys.com (Gustavo Pimentel)
Date: Thu, 21 Jun 2018 17:26:04 +0100
Subject: [PATCH v2] ARC: Add PCIe support for ARC HSDK platform
In-Reply-To: <f845c9f6-a020-5a4c-3a66-52e36c9f3d72@synopsys.com>
References: <e1d274a5ed756f86ced3df50538ef8c7e67ef4b6.1529589452.git.gustavo.pimentel@synopsys.com>
 <f845c9f6-a020-5a4c-3a66-52e36c9f3d72@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <69393589-e549-29f0-6272-b263539b82e8@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 21/06/2018 17:07, Vineet Gupta wrote:
> On 06/21/2018 07:06 AM, Gustavo Pimentel wrote:
>> Add PCI support to the ARC HSDK platform allowing to use the generic PCI
>> setup functions.
>>
>> Signed-off-by: Gustavo Pimentel <gustavo.pimentel at synopsys.com>
>> Acked-by: Alexey Brodkin <abrodkin at synopsys.com>
> 
> Queued to #for-curr after minor fixed up to commit msg subject "ARC: [plat-hsdk]"
> 
> Curious, how exactly are you going to use PCI on hsdk ? What is the use case.

The ARC HSDK board is mounted on top of a HAPS DX7 or HAPS-80 using the HT3
connectors. The HAPS DX7 or HAPS-80 provides the PCIe Root Complex using the
Synopsys DesignWare PCIe IP.

Basically I'm migrating the existing use case from ARC AXS101 to ARC HSDK.

> 
>> ---
>>  arch/arc/plat-hsdk/Kconfig | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arc/plat-hsdk/Kconfig b/arch/arc/plat-hsdk/Kconfig
>> index 19ab3cf..556bc5e 100644
>> --- a/arch/arc/plat-hsdk/Kconfig
>> +++ b/arch/arc/plat-hsdk/Kconfig
>> @@ -9,3 +9,4 @@ menuconfig ARC_SOC_HSDK
>>  	bool "ARC HS Development Kit SOC"
>>  	select CLK_HSDK
>>  	select RESET_HSDK
>> +	select MIGHT_HAVE_PCI
> 
