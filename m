From: wbx@uclibc-ng.org (Waldemar Brodkorb)
Date: Mon, 3 Apr 2017 05:24:16 +0200
Subject: [uclibc-ng-devel] [PATCH] ldso: don't discard sysmbols for
 DODEBUG builds
In-Reply-To: <1490984540-10031-1-git-send-email-vgupta@synopsys.com>
References: <1490984540-10031-1-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170403032416.GG5361@waldemar-brodkorb.de>
To: linux-snps-arc@lists.infradead.org

Hi Vineet,
Vineet Gupta wrote,

> the --discard-* toggles take away the symbols which comes in the way
> when staring at objdumps for debugging low level issues
> 
> So don't discard symbols for DODEBUG builds

Applied and pushed,
 Thanks
  Waldemar
