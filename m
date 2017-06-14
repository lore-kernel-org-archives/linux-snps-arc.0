From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 14 Jun 2017 15:39:35 -0700
Subject: [PATCH v2 01/12] ARC: [plat-eznps] Handle memory error as an
 exception
In-Reply-To: <1497362636-30353-2-git-send-email-noamca@mellanox.com>
References: <1497362636-30353-1-git-send-email-noamca@mellanox.com>
 <1497362636-30353-2-git-send-email-noamca@mellanox.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a6b528bb-390b-26c9-fb0a-4c209117f12b@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 06/13/2017 07:03 AM, Noam Camus wrote:
> From: Noam Camus <noamca at mellanox.com>
> 
> On ARC700, user mode memory error is treated as L2 interrupt, but NPS
> hardware treats it as Machine Check exception.
> 
> Address this by defining an NPS specific bus error handler.

This still leaves too much to dig thru. I've rewritten the changelog here and pushed !

-Vineet
