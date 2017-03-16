From: till.smejkal@googlemail.com (Till Smejkal)
Date: Thu, 16 Mar 2017 10:29:09 -0700
Subject: [RFC PATCH 00/13] Introduce first class virtual address spaces
In-Reply-To: <alpine.DEB.2.20.1703160919170.3586@nanos>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170316172909.ux4u7dbspwlynsce@arch-dev>
To: linux-snps-arc@lists.infradead.org

On Thu, 16 Mar 2017, Thomas Gleixner wrote:
> Why do we need yet another mechanism to represent something which looks
> like a file instead of simply using existing mechanisms and extend them?

You are right. I also recognized during the discussion with Andy, Chris, Matthew,
Luck, Rich and the others that there are already other techniques in the Linux kernel
that can achieve the same functionality when combined. As I said also to the others,
I will drop the VAS segments for future versions. The first class virtual address
space feature was the more interesting part of the patchset anyways.

Thanks
Till
