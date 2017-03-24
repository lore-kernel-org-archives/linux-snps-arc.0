From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Fri, 24 Mar 2017 13:35:55 -0700
Subject: [PATCH] arc: vdk: Fix support of UIO
In-Reply-To: <1490290485-16332-1-git-send-email-abrodkin@synopsys.com>
References: <1490290485-16332-1-git-send-email-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <a4b4c46b-f05f-4222-9433-1532ba1597c2@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 03/23/2017 10:34 AM, Alexey Brodkin wrote:
> MotherBoard section has its "ranges" set to 0xE000_0000-0xF000_0000.
> But UIO node maps 4 different areas in different memory locations
> and all outside MB's ranges.
> 
> That obviously breaks UIO mappings in runtime.
> 
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: Ruud Derwig <rderwig at synopsys.com>
> Cc: stable at vger.kernel.org


Added to for-curr.

Thx,
-Vineet
