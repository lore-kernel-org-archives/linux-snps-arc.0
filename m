From: fweimer@redhat.com (Florian Weimer)
Date: Tue, 18 Dec 2018 22:28:08 +0100
Subject: [PATCH 14/21] ARC: Enable __start as entry point vs. canonical
 _start
In-Reply-To: <1545167083-16764-15-git-send-email-vgupta@synopsys.com> (Vineet
 Gupta's message of "Tue, 18 Dec 2018 13:04:36 -0800")
References: <1545167083-16764-1-git-send-email-vgupta@synopsys.com>
 <1545167083-16764-15-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <87h8fay17b.fsf@oldenburg2.str.redhat.com>
To: linux-snps-arc@lists.infradead.org

* Vineet Gupta:

> ARC linker scripts have defined __start as entry point so to not break
> ABI for uClibc et al we allow __start for glibc as well

I think this change and the test suite fixes should be folded into the
initial addition of these files.  Or is there a reason for not doing
this?

Thanks,
Florian
