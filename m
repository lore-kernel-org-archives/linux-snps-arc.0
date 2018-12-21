From: mhocko@kernel.org (Michal Hocko)
Date: Fri, 21 Dec 2018 14:27:53 +0100
Subject: [PATCH 2/2] ARC: show_regs: fix lockdep splat for good
In-Reply-To: <20181221130404.GF16107@dhcp22.suse.cz>
References: <1545159239-30628-1-git-send-email-vgupta@synopsys.com>
 <1545159239-30628-3-git-send-email-vgupta@synopsys.com>
 <20181220130450.GB17350@dhcp22.suse.cz>
 <C2D7FE5348E1B147BCA15975FBA23075014642389B@US01WEMBX2.internal.synopsys.com>
 <20181221130404.GF16107@dhcp22.suse.cz>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20181221132753.GB4842@dhcp22.suse.cz>
To: linux-snps-arc@lists.infradead.org

On Fri 21-12-18 14:04:04, Michal Hocko wrote:
[...]
> Yes, but you are building on a broken concept I believe. What
> implications does re-enabling really have? Now you could reschedule and
> you can move to another CPU. Is this really safe? I believe that yes
> because the preemption disabling is simply bogus. Which doesn't sound
> like a proper justification, does it?

Well, thinking about it a bit more. What is the result of calling
preempt_enable outside of preempt_disabled section? E.g. __warn which
doesn't disable preemption AFAICS.
-- 
Michal Hocko
SUSE Labs
