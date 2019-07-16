From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Tue, 16 Jul 2019 20:39:43 +0000
Subject: [GIT PULL] ARC updates for 5.3-rc1
In-Reply-To: <99fc2ead-d7d8-1c54-b493-02e79e2fc24e@synopsys.com>
References: <99fc2ead-d7d8-1c54-b493-02e79e2fc24e@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c370f648-b9f6-a845-d3cd-170fc3ae8c2f@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 7/16/19 1:22 PM, Vineet Gupta wrote:
> Hi Linus,
> 
> Bunch of changes for ARC, some long due, for the new release. Please pull.
> 
> Thx,
> -Vineet

Sorry almost forgot, you would run into some merge conflict due to collisions
between do_page_fault() rework and force_sig_fault() argument change, but should
be easy to resolve. I'll give it all a spin once u merge it.

Thx,
-Vineet
