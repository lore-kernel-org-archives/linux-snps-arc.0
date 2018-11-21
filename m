From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Wed, 21 Nov 2018 19:27:17 +0000
Subject: [PATCH] arc: [devboards] Add support of NFSv3 ACL
References: <20181120103019.12852-1-abrodkin@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA2307501464157E0@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 11/20/18 2:30 AM, Alexey Brodkin wrote:
> By default NFSv3 doesn't support ACL (Access Control Lists)
> which might be quite convenient to have so that
> mounted NFS behaves exactly as any other local file-system.
>
> In particular missing support of ACL makes umask useless.
> This among other thigs fixes Glibc's "nptl/tst-umask1".
>
> Signed-off-by: Alexey Brodkin <abrodkin at synopsys.com>
> Cc: Cupertino Miranda <cmiranda at synopsys.com>
> Cc: stable at vger.kernel.org

Applied, with stable restricted to 4.14+
