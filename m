From: rdunlap@infradead.org (Randy Dunlap)
Date: Fri, 29 Jun 2018 23:08:31 -0700
Subject: [PATCH] arc/Kconfig: include mm/Kconfig inside "ARC system
 configuration"
In-Reply-To: <e2876cca-ea7f-25fd-8e32-c691717a8b7b@synopsys.com>
References: <1530279747-25320-1-git-send-email-rppt@linux.vnet.ibm.com>
 <4c84ef6c-fa71-8b74-826a-d81dac8c71e7@infradead.org>
 <20180629192838.GE4799@rapoport-lnx>
 <e18f80e1-fc59-9487-95eb-7cb6cda976c5@infradead.org>
 <20180629205716.GG4799@rapoport-lnx>
 <e2876cca-ea7f-25fd-8e32-c691717a8b7b@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c190ac79-4668-424e-67d2-1c49a88f23e7@infradead.org>
To: linux-snps-arc@lists.infradead.org

On 06/29/2018 02:12 PM, Vineet Gupta wrote:
> On 06/29/2018 01:57 PM, Mike Rapoport wrote:
>> I think that would be something like this:
>> diff --git a/arch/arc/Kconfig b/arch/arc/Kconfig
>> index e81bcd271be7..44a20141639a 100644
>> --- a/arch/arc/Kconfig
>> +++ b/arch/arc/Kconfig
>> @@ -556,12 +556,14 @@ endmenu
>>  
>>  endmenu	 # "ARC Architecture Configuration"
>>  
>> +menu "Memory Management"
>>  source "mm/Kconfig"
>>  
>>  config FORCE_MAX_ZONEORDER
>>  	int "Maximum zone order"
>>  	default "12" if ARC_HUGEPAGE_16M
>>  	default "11"
>> +endmenu # "Memory Management"
>>  
>>  source "net/Kconfig"
>>  source "drivers/Kconfig"
>>
> 
> Awesome, this is exactly we want - care to send a formal patch ?
> 
> -Vineet

Mike, I interpret this as a reply to you.

And you can add:
Tested-by: Randy Dunlap <rdunlap at infradead.org>
Acked-by: Randy Dunlap <rdunlap at infradead.org>

and possibly:
Suggested-by: Randy Dunlap <rdunlap at infradead.org>


thanks,
-- 
~Randy
