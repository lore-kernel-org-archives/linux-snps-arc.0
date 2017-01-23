From: Vineet.Gupta1@synopsys.com (Vineet Gupta)
Date: Mon, 23 Jan 2017 13:14:04 -0800
Subject: [PATCH 13/20] arc: migrate exception table users off module.h and
 onto extable.h
In-Reply-To: <20170122163244.11740-14-paul.gortmaker@windriver.com>
References: <20170122163244.11740-1-paul.gortmaker@windriver.com>
 <20170122163244.11740-14-paul.gortmaker@windriver.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <b8c3cef5-ad62-1e2f-499c-b80816a88469@synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 01/22/2017 08:32 AM, Paul Gortmaker wrote:
> This file was only including module.h for exception table related
> functions.  We've now separated that content out into its own file
> "extable.h" so now move over to that and avoid all the extra header
> content in module.h that we don't really need to compile this file.
> Since the file does have some EXPORT_SYMBOL, we add export.h include.
> 
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker at windriver.com>

Acked-by: Vineet Gupta <vgupta at synopsys.com>

Thx,
-Vineet
