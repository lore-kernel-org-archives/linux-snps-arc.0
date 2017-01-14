From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Sat, 14 Jan 2017 20:01:32 +0100
Subject: [uclibc-ng-devel] ARC uClibc-ng testsuite runs empty ?
In-Reply-To: <EB86EB452ADE4B44B294F7149B8A277702249BD7@DE02WEMBXB.internal.synopsys.com>
References: <f806e391-de89-5636-ab91-d4eb46e4f482@synopsys.com>
 <20170111204849.GH1913@waldemar-brodkorb.de>
 <dde21784-c3e4-5a53-6d10-0ac640d18192@synopsys.com>
 <20170111224018.GB20925@waldemar-brodkorb.de>
 <EB86EB452ADE4B44B294F7149B8A277702249BD7@DE02WEMBXB.internal.synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170114190131.GO20925@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi,
Cupertino Miranda wrote,

> Hi Waldemar,
> 
> I have looked into the OpenADK uclibc-tests segmentation fault at hand.
> Although, I haven't fully tested the patch I think it is a fix for the
> issue.
> 
> Considering how long I took to look into this problem, I decided to
> provide you a patch immediately for you to try it.
> BTW, in my case, it fails a little further, but because of some
> undefined references.
> Maybe it is not really a problem on the toolchain.

Works for me! Thanks.
But what do you mean with not a problem with toolchain when
a change to binutils fixes it for me?
Can you explain why this happens for OpenADK but not for buildroot?

best regards
 Waldemar
