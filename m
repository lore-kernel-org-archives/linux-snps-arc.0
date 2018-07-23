From: rdunlap@infradead.org (Randy Dunlap)
Date: Mon, 23 Jul 2018 12:45:26 -0700
Subject: arch/arc/ allmodconfig
In-Reply-To: <DB6PR05MB4597A63819F227B17652B5B2B2560@DB6PR05MB4597.eurprd05.prod.outlook.com>
References: <e074d0ae-6d79-d21a-2278-15d516bb943e@infradead.org>
 <C2D7FE5348E1B147BCA15975FBA23075012B0724EB@US01WEMBX2.internal.synopsys.com>
 <AM0PR05MB42600653CF591791731CCCD8DA510@AM0PR05MB4260.eurprd05.prod.outlook.com>
 <DB6PR05MB4597A63819F227B17652B5B2B2560@DB6PR05MB4597.eurprd05.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <82c3e518-a579-7df9-4c3f-8ecb5615b6d7@infradead.org>
To: linux-snps-arc@lists.infradead.org

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
> 

Thanks, this fixes the build error.

I will not that outlook is not the best email client that you could use for
sending Linux patches.  I don't know if you generated the patch with spaces
or tabs being used for indentation, but above, it contains all leading spaces
for indentation, which is Not Good.


-- 
~Randy
