From: vgupta@synopsys.com (Vineet Gupta)
Date: Sun, 13 Aug 2017 23:04:44 +0530
Subject: Adding new ARC platforms (was Re: Handling stub code for new
 platforms)
In-Reply-To: <d4e20a2b-e269-45f1-0d83-d3ef8dcfdc4b@adaptrum.com>
References: <97916c54-b30b-c366-a8c5-38673c924a5c@adaptrum.com>
 <f45ce545-4e12-7d90-2c5f-7465024741df@synopsys.com>
 <d4e20a2b-e269-45f1-0d83-d3ef8dcfdc4b@adaptrum.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <3f0bdafa-93cb-f9b7-2d2b-f54198094657@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 08/11/2017 10:55 PM, Alexandru Gagniuc wrote:
> I was hoping to avoid the addition of extra source files for zero code gain, 
> though your proposal does work. However, since the platform would be added 
> unconditionally, would it make more sense to add the
> .compatible = "adaptrum,anarion"

Actual Abilis TB10x is similar in terms of need for special platform callbacks, 
but they do need Kconfig glue to pull in bunch of drivers, your platform doesn't ?

-Vineet
