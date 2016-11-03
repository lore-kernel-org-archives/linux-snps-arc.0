From: daniel.lezcano@linaro.org (Daniel Lezcano)
Date: Thu, 3 Nov 2016 17:50:32 +0100
Subject: [PATCH 9/9] clocksource: import ARC timer driver
In-Reply-To: <ff516208-8014-f12a-2081-cbfb69dd6a2d@synopsys.com>
References: <35bde193-8492-83e0-fb03-8385d8afd007@synopsys.com>
 <1477954096-770-1-git-send-email-vgupta@synopsys.com>
 <1477954096-770-10-git-send-email-vgupta@synopsys.com>
 <20161101204257.GG1506@mai>
 <188a2912-3369-19a3-86af-cbb154ff7e44@synopsys.com>
 <20161102001925.GH1506@mai>
 <2dcf87ce-a278-8ef8-3c8e-3cf7124603c9@synopsys.com>
 <ff516208-8014-f12a-2081-cbfb69dd6a2d@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20161103165032.GA1859@mai>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 03, 2016@09:40:23AM -0700, Vineet Gupta wrote:
> On 11/01/2016 06:03 PM, Vineet Gupta wrote:
> >>> Because of the git mv you, diff didn't include bulk of driver code which would
> >>> >> make for bulk of review anyways. So perhaps in v2 I don't do the git mv. OK ?
> >> > 
> >> > That means I will review and comment existing code. It is not a problem for me
> >> > if you agree to do the changes.
> > Sure, the whole point is to make things better as an outcome of review. I have no
> > issues changing code provided we don't add major performance regressions.
> 
> So just wondering if I could have some comments on the initial import of driver
> before I send out a v2.

Yeah, ok. Let me comment the other patches of the series and then you can send a V2.
 
> The issue is git mv didn't show bulk of code being moved. Shall I send a v2 with a
> different ordering so I introduce the driver first, with new headers, new Kconfig
> items etc and then as a subsequent patch prune those bits from arch/arc/* ?
> 
> -Vineet
