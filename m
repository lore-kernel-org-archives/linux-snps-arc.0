From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 23 Jul 2018 16:36:57 +0000
Subject: arch/arc/ allmodconfig
References: <e074d0ae-6d79-d21a-2278-15d516bb943e@infradead.org>
 <C2D7FE5348E1B147BCA15975FBA23075012B0724EB@US01WEMBX2.internal.synopsys.com>
 <AM0PR05MB42600653CF591791731CCCD8DA510@AM0PR05MB4260.eurprd05.prod.outlook.com>
 <DB6PR05MB4597A63819F227B17652B5B2B2560@DB6PR05MB4597.eurprd05.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B07F319@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Ofer,

On 07/23/2018 01:34 AM, Ofer Levi(SW) wrote:
> Hi Vineet, randy
>
> Indeed this structure is missing, following is a patch based on linux-4.17.9.
> Sorry about that.
>
> Thanks
>
>
> diff -uprN linux-4.17.9.org/arch/arc/plat-eznps/include/plat/ctop.h linux-4.17.9/arch/arc/plat-eznps/include/plat/ctop.h
> --- linux-4.17.9.org/arch/arc/plat-eznps/include/plat/ctop.h    2018-07-22 16:16:09.000000000 +0300
> +++ linux-4.17.9/arch/arc/plat-eznps/include/plat/ctop.h        2018-07-23 11:18:12.179402620 +0300
> @@ -143,6 +143,15 @@ struct nps_host_reg_gim_p_int_dst {
>  };
>  
>  /* AUX registers definition */
> +struct nps_host_reg_aux_dpc {
> +       union {
> +               struct {
> +                       u32 ien:1, men:1, hen:1, reserved:29;
> +               };
> +               u32 value;
> +       };
> +};
> +
>  struct nps_host_reg_aux_udmc {
>         union {
>                 struct {

Thx for this change. Can you please send a proper patch with changelog, citing the
issue as Reported-by etc.
Also if Mellanox is interested in maintaining the NPS port going fwd, someone (you
?) should add their name to MAINTAINERS file under arch/arc/plat-eznps and send
that patch as well.

Thx,
-Vineet


>
>
>
>
>> -----Original Message-----
>> From: Meir Lichtinger
>> Sent: Friday, July 20, 2018 10:19
>> To: Vineet Gupta <Vineet.Gupta1 at synopsys.com>; Randy Dunlap
>> <rdunlap at infradead.org>; LKML <linux-kernel at vger.kernel.org>; linux-
>> snps-arc at lists.infradead.org; Ofer Levi(SW) <oferle at mellanox.com>
>> Cc: Leon Romanovsky <leonro at mellanox.com>
>> Subject: RE: arch/arc/ allmodconfig
>>
>> Hi Vineet,
>> Ofer Levi is now the maintainer of arch/arc/plat-eznps
>>
>> Ofer,
>> Please take care of the issue below
>>
>> Thanks
>>
>>
>> -----Original Message-----
>> From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com]
>> Sent: Thursday, July 19, 2018 19:22
>> To: Randy Dunlap <rdunlap at infradead.org>; LKML <linux-
>> kernel at vger.kernel.org>; Vineet Gupta <Vineet.Gupta1 at synopsys.com>;
>> linux-snps-arc at lists.infradead.org
>> Cc: Elad Kanfi <eladkan at mellanox.com>; Leon Romanovsky
>> <leonro at mellanox.com>
>> Subject: Re: arch/arc/ allmodconfig
>>
>> +CC some folks from Mellanox
>>
>> On 07/18/2018 10:37 PM, Randy Dunlap wrote:
>>> Hi,
>>>
>>> When I try to (cross-)build arch/arc/ allmodconfig, I get a syntax error here:
>>>
>>> ./arch/arc/plat-eznps/mtm.c: In function 'mtm_enable_core':
>>> ../arch/arc/plat-eznps/mtm.c:113:30: error: storage size of 'dpc' isn't known
>>>   struct nps_host_reg_aux_dpc dpc;
>>>                               ^~~
>>>
>>> There is no struct nps_host_reg_aux_dpc in the kernel tree.
>>>
>>> Can you do something about this, please?
>> Thx for the report Randy. I'm calling out Mellanox folks to see if they can
>> provide a fixup, else we will revert the corresponding change.
>>
>> @Elad, upstream commit 3f9cd874dcc8705 "ARC: [plat-eznps] avoid toggling
>> of DPC register" added reference to struct nps_host_reg_aux_dpc but the
>> definition is missing. Can you please provide a fixup as I have no idea of that
>> platform specific struct.
>>
>> @ Leon, reaching our to you, since it seems you removed Elad from
>> MAINTAINERS file, so I'm not sure if he is still at Mellanox.
>> The two folks I worked with on EZCHiip Linux port Noam Camus and Gilad
>> have left Mellanox.
>> If you or someone from Mellanox are interested in maintaining this platform,
>> please update the arch/arc/plat-eznps section of MAINTAINERS file.
>>
>>
>> Thx,
>> -Vineet
