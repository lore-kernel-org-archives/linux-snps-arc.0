From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 3 Nov 2016 22:55:09 +0100
Subject: [PATCH v2 02/10] ARC: timer: gfrc, rtc: deuglify big endian code
In-Reply-To: <1478208701-30923-3-git-send-email-vgupta@synopsys.com>
References: <1478208701-30923-1-git-send-email-vgupta@synopsys.com>
 <1478208701-30923-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161103215509.GN1859@mai>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 03, 2016@02:31:33PM -0700, Vineet Gupta wrote:
> A standard "C" shift will be handled appropriately by the compiler
> dependin gon the endian used fo rbuild. So we don't need the

s/dependin gon/depending on/
s/fo rbuild/for build/

> explicit distinction in code
> 
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>
> ---
