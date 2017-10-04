From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 4 Oct 2017 11:38:01 -0700
Subject: [PATCH v2] ARC: reset: introduce AXS10x reset driver
In-Reply-To: <1507111778.11691.9.camel@pengutronix.de>
References: <20170914142842.12225-1-Eugeniy.Paltsev@synopsys.com>
 <1505736441.9807.8.camel@pengutronix.de>
 <ce7885ab-b87e-ca07-234f-b63811afd86c@synopsys.com>
 <1505753484.9807.18.camel@pengutronix.de>
 <1507111778.11691.9.camel@pengutronix.de>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <976729bf-5985-e989-183b-70cd28a3a983@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Philipp,

On 10/04/2017 03:09 AM, Philipp Zabel wrote:
>> Maybe it is better to do this the other way around? I can put this patch
>> on a stable reset/arc branch for you to merge before applying the reset
>> DT updates.
> 
> Have you come to a decision on this?
> 
> Just in case, I have removed the AXS10x driver from the reset/next
> branch and put it on its own branch:
> 
>    git://git.pengutronix.de/git/pza/linux.git reset/arc
> 
> This branch is immutable and I'll merge it into reset/next before
> submitting the branch for v4.15-rc1.

Thanks for creating this !

Here's the plan. I have some changes queued up for 4.14-rc4 (which includes a 
adding a reset workaround since the driver is not in for 4.14).
Once that is merged in mainline this week, I will create my for-next based on 
4.14-rc4 + git pull --no-ff ur-branch + reverts for reset hack above.

OK ?

-Vineet
