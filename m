From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 27 Jul 2018 20:14:31 +0000
Subject: arch/arc/ allmodconfig
References: <e074d0ae-6d79-d21a-2278-15d516bb943e@infradead.org>
 <C2D7FE5348E1B147BCA15975FBA23075012B0724EB@US01WEMBX2.internal.synopsys.com>
 <AM0PR05MB42600653CF591791731CCCD8DA510@AM0PR05MB4260.eurprd05.prod.outlook.com>
 <DB6PR05MB4597A63819F227B17652B5B2B2560@DB6PR05MB4597.eurprd05.prod.outlook.com>
 <C2D7FE5348E1B147BCA15975FBA23075012B07F319@us01wembx1.internal.synopsys.com>
 <20180723165110.GR3189@mtr-leonro.mtl.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B08679D@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 07/23/2018 10:02 AM, Leon Romanovsky wrote:
>>> diff -uprN linux-4.17.9.org/arch/arc/plat-eznps/include/plat/ctop.h linux-4.17.9/arch/arc/plat-eznps/include/plat/ctop.h
>>> --- linux-4.17.9.org/arch/arc/plat-eznps/include/plat/ctop.h    2018-07-22 16:16:09.000000000 +0300
>>> +++ linux-4.17.9/arch/arc/plat-eznps/include/plat/ctop.h        2018-07-23 11:18:12.179402620 +0300
>>> @@ -143,6 +143,15 @@ struct nps_host_reg_gim_p_int_dst {
>>>  };
>>>
>>>  /* AUX registers definition */
>>> +struct nps_host_reg_aux_dpc {
>>> +       union {
>>> +               struct {
>>> +                       u32 ien:1, men:1, hen:1, reserved:29;
>>> +               };
>>> +               u32 value;
>>> +       };
>>> +};
>>> +
>>>  struct nps_host_reg_aux_udmc {
>>>         union {
>>>                 struct {
>> Thx for this change. Can you please send a proper patch with changelog, citing the
>> issue as Reported-by etc.
>> Also if Mellanox is interested in maintaining the NPS port going fwd, someone (you
>> ?) should add their name to MAINTAINERS file under arch/arc/plat-eznps and send
>> that patch as well.
> Hi Vineet,
>
> Thanks for your feedback, I'll work with Ofer to make it happen.

Ping, folks can one of you please send a formal patch for this ?

-Vineet
