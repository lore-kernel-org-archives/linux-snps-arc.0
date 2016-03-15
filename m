From: Joao.Pinto@synopsys.com (Joao Pinto)
Date: Tue, 15 Mar 2016 12:06:31 +0000
Subject: [PATCH] ARC: Don't source drivers/pci/pcie/Kconfig ourselves
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075F4E8FE8F@us01wembx1.internal.synopsys.com>
References: <1458040615-10697-1-git-send-email-andreas.ziegler@fau.de>
 <C2D7FE5348E1B147BCA15975FBA23075F4E8FE8F@us01wembx1.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <56E7FAC7.7030001@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 3/15/2016 11:38 AM, Vineet Gupta wrote:
> On Tuesday 15 March 2016 04:47 PM, Andreas Ziegler wrote:
>> Commit 5f8fc43217a0 ("PCI: Include pci/pcie/Kconfig directly from
>> pci/Kconfig") in linux-next changed drivers/pci/Kconfig to include
>> drivers/pci/pcie/Kconfig itself, so that architectures do not need
>> to source both files themselves. ARC just recently gained PCI support
>> through commit 6b3fb77998dd ("ARC: Add PCI support"), but this change
>> was based on the old behaviour of the Kconfig files. This makes
>> Kconfig now spit out the following warnings:
>>
>> drivers/pci/pcie/Kconfig:61:warning: choice value used outside its choice group
>> drivers/pci/pcie/Kconfig:67:warning: choice value used outside its choice group
>> drivers/pci/pcie/Kconfig:74:warning: choice value used outside its choice group
>>
>> This change updates the Kconfig file for ARC, dropping the now
>> unnecessary 'source' statement, which makes the warning disappear.
>>
>> Signed-off-by: Andreas Ziegler <andreas.ziegler at fau.de>
> 
> Thx for the fix Andreas.
> 
> @Bjorn sorry you might to have to pick this one up as well.
> If not, that's fine too - I'll queue it up once ARC PCI hits upstream.
> 
> Thx,
> -Vineet
> 
>> ---
>>  arch/arc/Kconfig | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
>> index 69d05f5..282efec 100644
>> --- a/arch/arc/Kconfig
>> +++ b/arch/arc/Kconfig
>> @@ -592,7 +592,6 @@ config PCI_SYSCALL
>>  	def_bool PCI
>>  
>>  source "drivers/pci/Kconfig"
>> -source "drivers/pci/pcie/Kconfig"
>>  
>>  endmenu
>>  
> 

Acked-by: Joao Pinto <jpinto at synopsys.com>
