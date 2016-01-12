From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 12 Jan 2016 10:41:50 +0000
Subject: for-next
References: <HE1PR02MB138793412FB23A86E7E5AB51D6FE0@HE1PR02MB1387.eurprd02.prod.outlook.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075F4E8480F@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Friday 01 January 2016 04:14 AM, Noam Camus wrote:
>
> Hi Vineet,
>
>
>  Few things I encountered lately:
>
>  1. Too early invisible panic due to link base not matching DT.
>

You need to fix the DT which u already did.
How do you propose to fix this anyways - show me a patch ?

>  1. uapi/asm/ headers which uses CONFIG_* which are not declared by user
>     application.
>

I agree that we can align it better for BE/LE. Can u send a patch ?

But this is not fool proof for other things. e.g. for 4K page the config items are
different. Alexey initially wanted to make uClibc options same which I turned down
since I don't want to keep a dependency on namespace. kernel developers shd be
free to do stuff w/o worrying about trickling name change in other projects. And
this is not because I'm mainly a kernel developer :-) It is just about software
engineering !

>  1. bus error from user space is not L2 at nSIM.
>

You need to create a nsim STAR for that !

-Vineet

> Let me know your opinion here. 
>
> Happy new year
> Noam
>
>
