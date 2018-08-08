From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 8 Aug 2018 16:28:52 +0000
Subject: [PATCH] ARC: [plat-axs10x] Enable SWAP
References: <20180802085016.16000-1-abrodkin@synopsys.com>
 <14efb038-3fa4-9f92-740f-46ec982f2c8c@synopsys.com>
 <895ec9ce12151312c093a6676c68cd00a06df5aa.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075012B08A875@us01wembx1.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/08/2018 06:35 AM, Alexey Brodkin wrote:
> Exactly - in HSDK we happened to have SWAP from the very beginning
> so my intention was to align other boards so we get exactly the same
> behavior on all boards once SWAP was fixed by
> commit 6e3761145a9b ("ARC: Fix CONFIG_SWAP").

I figured this - the patch was pushed to my for-curr yesterday for 4.19 !
