From: Alexey.Brodkin@synopsys.com (Alexey Brodkin)
Date: Mon, 3 Jun 2019 11:04:49 +0000
Subject: [PATCH] kbuild: use more portable 'command -v' for cc-cross-prefix
In-Reply-To: <20190603104902.23799-1-yamada.masahiro@socionext.com>
References: <20190603104902.23799-1-yamada.masahiro@socionext.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CY4PR1201MB012052D53B42622F45E39143A1140@CY4PR1201MB0120.namprd12.prod.outlook.com>
To: linux-snps-arc@lists.infradead.org

Hi Masahiro-san,

> -----Original Message-----
> From: linux-snps-arc <linux-snps-arc-bounces at lists.infradead.org> On Behalf Of Masahiro Yamada
> Sent: Monday, June 3, 2019 1:49 PM
> To: linux-kbuild at vger.kernel.org
> Cc: Michal Marek <michal.lkml at markovi.net>; Vineet Gupta <vgupta at synopsys.com>; Alexey Brodkin
> <abrodkin at synopsys.com>; linux-kernel at vger.kernel.org; linux-stable <stable at vger.kernel.org>; Masahiro
> Yamada <yamada.masahiro at socionext.com>; linux-snps-arc at lists.infradead.org
> Subject: [PATCH] kbuild: use more portable 'command -v' for cc-cross-prefix

[snip]
 
> Fixes: bd55f96fa9fc ("kbuild: refactor cc-cross-prefix implementation")
> Cc: linux-stable <stable at vger.kernel.org> # 5.1
> Reported-by: Alexey Brodkin <abrodkin at synopsys.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro at socionext.com>
> ---

Thanks for the prompt fix - it does the trick, now no junk in the console!

Tested-by: Alexey Brodkin <abrodkin at synopsys.com>
