From: noamca@mellanox.com (Noam Camus)
Date: Sun, 4 Jun 2017 06:10:08 +0000
Subject: [PATCH v2 11/11] ARC: [plat-eznps] Handle memory error as an
 exception
In-Reply-To: <529402c7-e75e-8640-fbc1-37d8efd92dd9@synopsys.com>
References: <1495954328-28736-1-git-send-email-noamca@mellanox.com>
 <1495954328-28736-12-git-send-email-noamca@mellanox.com>
 <529402c7-e75e-8640-fbc1-37d8efd92dd9@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <HE1PR05MB16256147FA9004024943E5FAAAF50@HE1PR05MB1625.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

> From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com] 
> Sent: Friday, June 2, 2017 22:04 PM

>> diff --git a/arch/arc/plat-eznps/Kconfig b/arch/arc/plat-eznps/Kconfig 
>> index feaa471..c5f946c 100644
>> --- a/arch/arc/plat-eznps/Kconfig
>> +++ b/arch/arc/plat-eznps/Kconfig
>> @@ -32,3 +32,14 @@ config EZNPS_MTM_EXT
>>   	  any of them seem like CPU from Linux point of view.
>>   	  All threads within same core share the execution unit of the
>>   	  core and HW scheduler round robin between them.
>> +
>> +config EZNPS_MEM_ERROR
>> +       bool "ARC-EZchip Memory error as an exception"
>> +       depends on ARC_PLAT_EZNPS
>> +       default n
>> +       help
>> +         On the real chip of the NPS, user memory errors are handled
>> +         as a machine check exception, whereas on simulator platform
>> +         for NPS, it handled as an interrupt level 2 (like legacy arc
>> +         real chip architecture).This configuration will cause the kernel
>> +         to handle memory error as a machine check exception.

>Do you really need a Kconfig option here. AFAIKR you guys had some magic in platform code to determine whether running on sim or hw - can that be not used ?
We do not have this anymore, needed to create dedicated one here.

...

>> diff --git a/arch/arc/plat-eznps/entry.S b/arch/arc/plat-eznps/entry.S 
>> index 328261c..03e2892 100644
>> --- a/arch/arc/plat-eznps/entry.S
>> +++ b/arch/arc/plat-eznps/entry.S
>> @@ -68,3 +68,17 @@ ENTRY(res_service)
>>   
>>   	j	stext
>>   END(res_service)
>> +
>> +#if defined(CONFIG_EZNPS_MEM_ERROR)
>> +ENTRY(mem_service)
>> +	; SW workaround to cover up on a difference between
>> +	; NPS real chip and simulator behaviors.
>> +	; NPS real chip will activate a machine check exception
>> +	; in case of memory error, while the simulator will
>> +	; trigger a level 2 interrupt. Therefor this code section
>> +	; should be reached only in simulation mode.
>> +	; DEAD END: display Regs and HALT
>> +
>> +	j EV_MachineCheck
>> +END(mem_service)
>> +#endif


>Just squash the weak symbol patch in here - not worth a separate patch !
Ok , no problem.

-Noam
