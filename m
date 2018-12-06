From: paul.burton@mips.com (Paul Burton)
Date: Thu, 6 Dec 2018 18:05:41 +0000
Subject: [PATCH 1/2] mips/kgdb: prepare arch_kgdb_ops for constness
In-Reply-To: <20181206140902.ea6jlwqrbcwyxp5r@holly.lan>
References: <75bbcdd1e9277d66ebb06e349dda304bd01ce761.1543957194.git.christophe.leroy@c-s.fr>
 <20181206140902.ea6jlwqrbcwyxp5r@holly.lan>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181206180539.fezd6bqce36tgmie@pburton-laptop>
To: linux-snps-arc@lists.infradead.org

Hi Christophe & Daniel,

On Thu, Dec 06, 2018@02:09:02PM +0000, Daniel Thompson wrote:
> On Wed, Dec 05, 2018@04:41:09AM +0000, Christophe Leroy wrote:
> > MIPS is the only architecture modifying arch_kgdb_ops during init.
> > This patch makes the init static, so that it can be changed to
> > const in following patch, as recommended by checkpatch.pl
> > 
> > Suggested-by: Paul Burton <paul.burton at mips.com>
> > Signed-off-by: Christophe Leroy <christophe.leroy at c-s.fr>
> 
> From my side this is
> Acked-by: Daniel Thompson <daniel.thompson at linaro.org>
> 
> Since this is a dependency for the next patch I'd be happy to take via
> my tree... but would need an ack from the MIPS guys to do that.

For both patches in this series:

    Acked-by: Paul Burton <paul.burton at mips.com>

Thanks,
    Paul
