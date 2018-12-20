From: vineet.gupta1@synopsys.com (Vineet Gupta)
Date: Thu, 20 Dec 2018 18:38:26 +0000
Subject: [PATCH 1/2] ARC: show_regs: avoid page allocator
References: <1545159239-30628-1-git-send-email-vgupta@synopsys.com>
 <1545159239-30628-2-git-send-email-vgupta@synopsys.com>
 <20181220125730.GA17350@dhcp22.suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <C2D7FE5348E1B147BCA15975FBA23075014642386D@US01WEMBX2.internal.synopsys.com>
To: linux-snps-arc@lists.infradead.org

On 12/20/18 4:57 AM, Michal Hocko wrote:
>> Despite this, lockdep still barfs (see next change), but this patch
>> still has merit as in we use smaller/localized buffers now and there's
>> less instructoh trace to sift thru when debugging pesky issues.
> But show_regs is called from contexts which might be called from deep
> call chains (e.g WARN). Is it safe to allocate such a large stack there?

ARC has 8K pages and 256 additional bytes of stack usage doesn't seem absurdly
high to me !

-Vineet
