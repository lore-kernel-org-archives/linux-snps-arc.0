From: noamca@mellanox.com (Noam Camus)
Date: Thu, 25 May 2017 12:03:45 +0000
Subject: [PATCH 10/10] ARC: [plat-eznps] Handle memory error as an
 exception
In-Reply-To: <1495711858.5393.37.camel@synopsys.com>
References: <1495679660-9598-1-git-send-email-noamca@mellanox.com>
 <1495679660-9598-11-git-send-email-noamca@mellanox.com>
 <1495710896.5393.32.camel@synopsys.com>
 <DB5PR05MB1638C447032283FC639A30E8AAFF0@DB5PR05MB1638.eurprd05.prod.outlook.com>
 <1495711858.5393.37.camel@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <DB5PR05MB1638AFD967BFE03E278E320AAAFF0@DB5PR05MB1638.eurprd05.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

>From: Alexey Brodkin [mailto:Alexey.Brodkin at synopsys.com] 
>Sent: Thursday, May 25, 2017 14:31 PM
...
>> > Why don't you just make simulator behaving exactly as your real chip?
>> I can't change simulator core behavior. nSIM is a Synopsys proprietary code.

>Well probably it worth discussing with nSIM team if they may have any suggestions on how to align nSIM behavior with your real HW?
We already talked with them, nothing we can do at this point.
What about turning mem_service into weak symbol and have my own platform copy (just like we do with res_service)?

-Noam 
