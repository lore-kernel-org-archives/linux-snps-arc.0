From: sudipm.mukherjee@gmail.com (Sudip Mukherjee)
Date: Thu, 21 Dec 2017 23:20:36 +0000
Subject: [PATCH v2] arch: define weak abort
In-Reply-To: <20171219135559.07104711eb9301f5f40a338f@linux-foundation.org>
References: <1513118956-8718-1-git-send-email-sudipm.mukherjee@gmail.com>
 <f098f672-7b51-26ea-c215-2c3edf72e62b@synopsys.com>
 <20171219135559.07104711eb9301f5f40a338f@linux-foundation.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20171221232036.GA4643@sudip-laptop>
To: linux-snps-arc@lists.infradead.org

On Tue, Dec 19, 2017@01:55:59PM -0800, Andrew Morton wrote:
> On Tue, 19 Dec 2017 13:39:22 -0800 Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> 

<snip>

> > Hmm, I realize there's a small gotcha with this, when testing with a different 
> > patch from Arnd. This needs an EXPORT_SYMBOL() as well !
> 
> Yup.  This?

Yes, just faced this when I was testing with the reverted patch on m32r.

> 
> From: Andrew Morton <akpm at linux-foundation.org>
> Subject: kernel/exit.c: export abort() to modules
> 
> gcc -fisolate-erroneous-paths-dereference can generate calls to abort()
> from modular code too.
> 
> Reported-by: Vineet Gupta <Vineet.Gupta1 at synopsys.com>
> Cc: Sudip Mukherjee <sudipm.mukherjee at gmail.com>
> Cc: Arnd Bergmann <arnd at arndb.de>
> Cc: "Alexey Brodkin" <Alexey.Brodkin at synopsys.com>
> Signed-off-by: Andrew Morton <akpm at linux-foundation.org>
> ---

Acked-by: Sudip Mukherjee <sudipm.mukherjee at gmail.com>

--
Regards
Sudip
