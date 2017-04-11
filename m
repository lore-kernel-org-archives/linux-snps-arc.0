From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Tue, 11 Apr 2017 22:11:46 +0200
Subject: [uclibc-ng-devel] [PATCH] Same iteration variable used for inner
 and outer loop
In-Reply-To: <20170406095725.18604-1-cmiranda@synopsys.com>
References: <20170406095725.18604-1-cmiranda@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170411201146.GC5361@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Cupertino,
Cupertino Miranda wrote,

> Inner loop was using same counter variable (i) as the outer loop, therefore
> making outer loop terminate before it visited all of the ELF program segments.
> Surrounding code in this inner loop clearly shows the intention that this loop
> should not affect the outer one, therefore leading me to the conclusion that
> this should be a bug an not expected code.
> 
> This bug was detected due to some other bug in ARC binutils that kept setting
> TEXTREL for any PIE application.
> 
> Apart from the but, I have also moved the debug message inside of the TEXTREL
> condition as mprotect is only really called if TELTREL is set.

Thanks.

Applied and pushed,
 Waldemar
