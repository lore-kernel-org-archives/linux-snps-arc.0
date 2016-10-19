From: noamca@mellanox.com (Noam Camus)
Date: Wed, 19 Oct 2016 08:01:02 +0000
Subject: [PATCH] ARC: Adjust cpuinfo for non-continuous cpu ids
In-Reply-To: <d6f85fd9-cb45-8962-709d-9f287bb587ab@synopsys.com>
References: <1476798435-8357-1-git-send-email-noamca@mellanox.com>
 <d6f85fd9-cb45-8962-709d-9f287bb587ab@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB6PR0501MB25185DA455C733162BB7521CAAD20@DB6PR0501MB2518.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

> From: Vineet Gupta [mailto:Vineet.Gupta1 at synopsys.com] 
> Sent: Tuesday, October 18, 2016 8:49 PM

>>
>> num_possible_cpus() returns how many CPUs may be present on system.
>> However we want the highest possible CPU number.
>
>Highest possible number "Detected" at boot ? Can you explain a bit more !

While trying to provide explanation I decided to "rethink" on this patch.
Its effect is not visible to you due to another "local" patch I use which justify this patch.
I need to reconsider both patches (maybe I will even remove both of them).

Thanks for the feedback.
Noam 
