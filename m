From: eugeniy.paltsev@synopsys.com (Eugeniy Paltsev)
Date: Mon, 1 Apr 2019 18:12:20 +0000
Subject: [PATCH] ARC: PAE40: don't panic and instead turn off hw ioc
In-Reply-To: <C2D7FE5348E1B147BCA15975FBA23075014643FA2D@US01WEMBX2.internal.synopsys.com>
References: <1553892336-29596-1-git-send-email-vgupta@synopsys.com>
 <1554141887.2797.3.camel@synopsys.com>
 <C2D7FE5348E1B147BCA15975FBA23075014643FA2D@US01WEMBX2.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <1554142339.2797.5.camel@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On Mon, 2019-04-01@11:08 -0700, Vineet Gupta wrote:
> On 4/1/19 11:04 AM, Eugeniy Paltsev wrote:
> > > +		if (IS_ENABLED(CONFIG_HIGHMEM) || is_pae40_enabled())
> > 
> > As for today PAE40 couldn't be enabled without HIGHMEM for ARC, so probably we can
> > simplify this to
> > 
> > ----------------------------->8----------------------------------
> > if (IS_ENABLED(CONFIG_HIGHMEM))
> > 	ioc_enable = 0;
> 
> That is true, but mentioning both sort of documents the requirements.
> Also these checks are compile time only so don't add any extra code whatsoever.

OK, I'm fine with it. Let's check both conditions explicitly.

> -Vineet
> 
-- 
 Eugeniy Paltsev
