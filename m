From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Tue, 7 Nov 2017 15:33:02 +0000
Subject: [PATCH] ARCv2: Accomodate NS48 MMUv5 by releaxing MMU ver checking
In-Reply-To: <1509996651-7174-1-git-send-email-vgupta@synopsys.com>
References: <1509996651-7174-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1510068782.8417.10.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,

Subject contains one typo: NS48 -> HS48.

On Mon, 2017-11-06@11:30 -0800, Vineet Gupta wrote:
> 
> HS48 cpus will have a new MMUv5, although Linux is currently not
> explicitly supporting the newer features (so remains at V4).
> The existing software/hardware version check is very tight and causes
> boot abort. Given that the MMUv5 hardware is backwards compatible,
> relax the boot check to allow current kernel support level to work
> with new hardware.

I don't terribly like this approach with assuming all ARCv2 MMUs are
backward-compatible. This time v5 is indeed backward compatible with
v4 from our stand-point. But what if v6 becomes non-compatible to
both v4 and v6?

That said I'd prefer to add each particular MMU version explicitly like
we used to do previously.

Your intention to make built today binaries future-proof is understood but
again if following MMUs become non-compatible we'll need to rewrite this code
again.

One better option would be more precise encoding of MMU version in hardware
such that based on combination of features we may decide if we may handle it.

-Alexey
