From: krzk@kernel.org (Krzysztof Kozlowski)
Date: Thu, 8 Jun 2017 18:47:05 +0200
Subject: [PATCH 17/35] ARC: defconfig: Cleanup from old Kconfig options
In-Reply-To: <21f04170-a56a-d2e1-b866-e50298a0713a@synopsys.com>
References: <20170608160836.12196-1-krzk@kernel.org>
 <20170608161049.12421-17-krzk@kernel.org>
 <21f04170-a56a-d2e1-b866-e50298a0713a@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170608164705.dht66jsedfgvvnkm@kozik-lap>
To: linux-snps-arc@lists.infradead.org

On Thu, Jun 08, 2017@09:31:54AM -0700, Vineet Gupta wrote:
> On 06/08/2017 09:10 AM, Krzysztof Kozlowski wrote:
> > Remove old, dead Kconfig option INET_LRO. It is gone since
> > commit 7bbf3cae65b6 ("ipv4: Remove inet_lro library").
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk at kernel.org>
> 
> Acked-by: vineet Gupta <vgupta at synopsys.com>
> 
> Do you want me to pick this up via ARC tree ?

Yes, please.

Best regards,
Krzysztof
