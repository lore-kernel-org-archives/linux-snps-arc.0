Return-Path: <SRS0=h9uo=GS=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A55F0C433E0
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 03:34:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67B1A22BEA
	for <linux-snps-arc@archiver.kernel.org>; Fri, 15 Jan 2021 03:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 67B1A22BEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B+G0BzXEebEg6nWB+8Uvu91kJFTyGlI9m6Bm/PTEjkc=; b=VXL3LbHk3K/nwp7m0T/pvlF+L
	1D0RBPkV84wki1oRcQIq1Pq/MiQsL3C81Am9Krbvu24Z7qGs6eF1P72a4nS4kO/dfgYukTAE2TW/I
	DYPQPhSL/VP2ykwdqzo7VkuMCyF/kkPWqdDwrRozNc02q+38Lnas37mVg2xLO61bBHH6sTZTsNS8p
	4FSixOFn5DrG4K267WwdWd7yQ+ahwrfOrQFHb2Ejp4mLry+PX3+FTzJQcunfFJmyil/ADrZkHWTLE
	w/VYZUmwmcRTSxe1SEi8j3Zr3fG4qVaDNl8NuoF409RqQWd9itdKXqVRkzxMtOceugi+yMUyFZdjy
	aRy9hwKeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Fsm-0004ti-Lt; Fri, 15 Jan 2021 03:34:40 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Fsi-0004sE-34
 for linux-snps-arc@lists.infradead.org; Fri, 15 Jan 2021 03:34:39 +0000
Received: by mail-pj1-x1035.google.com with SMTP id ce17so2132508pjb.5
 for <linux-snps-arc@lists.infradead.org>; Thu, 14 Jan 2021 19:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=W07ZLPVszbueA12F97uxqmYwsZjLziE6s+z1n5bz+MA=;
 b=wzlU1v608Bp/5Fbh2LlphjOSHK6mVDaFC9eNHaDC2tGh7ihu4qx096kwF8127c89Ll
 jthd9Pm03WUosaLQezx/FRs71g/jon1IpEWnRmEIJEaa3/RqTfuKh6EMgw46I8CXq3D9
 /yeQBRNBhq99IYpe4/dgheqrWnGGRqaYp/pD0KqlsmA1/e3f3WRIf+s3I5FSkj6zEi7s
 mSj3ocJxC5OWg1FORIgSX/GK+xHgCI/Dhp8fJw5qax5XWl3Z/oGS5Gv9uAB9MWHMXIod
 s7Jvto4y8yKloaXd1xK705vZEuAc5yfmVaCbXy26Vk1daNcozz+ePsuEWmbi/gaCCTJB
 l6Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=W07ZLPVszbueA12F97uxqmYwsZjLziE6s+z1n5bz+MA=;
 b=tK3Qd7rgtMICFiWnm1W/ZgmhTm0EPoRA0cCe/yVfr17GLbCJfalivPNbz+kTjA1yVT
 UP2K3eSUhIKc8DKwVb3Emz9vRKjxFp8FxZv85iOp3ukCMXCttKda7Wrna4A8y2JGJiBM
 chpahvGT6BwyARWBKAsALshQ0ElF13moIeEM0di5bfj8mVybEa+5STN+jy+CtAhSOUL/
 tio4u4EAZOMkPvhpPFJ6X5pDCfU8zci99RHeimBdnvJ6U9ah2kRtjnMppPLLQYuJFARf
 pdrkEJd0ghy5dA/k3e8XGyrBOwIBSJaupmTAWBQtV/1shwRbXNkugSBQc4dXihNtFbm2
 hloQ==
X-Gm-Message-State: AOAM5306aIbRKLrPS45thu7MRVPjDP5xT6BbM8hhBJ/JrfTknSsLxPNW
 gj3L3lS8CpGAMQJx/HBzVlMV/Q==
X-Google-Smtp-Source: ABdhPJyYdlMuN2pkKJ7RYKVFFcTi9PZ8+oVHWdgcn5YANMzdEyqNgbQgng2M+wNGbbyh/9Rvip/U2A==
X-Received: by 2002:a17:90a:4cc5:: with SMTP id
 k63mr8252416pjh.202.1610681673757; 
 Thu, 14 Jan 2021 19:34:33 -0800 (PST)
Received: from localhost ([122.172.85.111])
 by smtp.gmail.com with ESMTPSA id w19sm6454293pgf.23.2021.01.14.19.34.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 14 Jan 2021 19:34:32 -0800 (PST)
Date: Fri, 15 Jan 2021 09:04:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH 03/18] arch: arc: Remove CONFIG_OPROFILE support
Message-ID: <20210115033430.rzyja2diwp7lbmni@vireshk-i7>
References: <cover.1610622251.git.viresh.kumar@linaro.org>
 <906d9d40746bb1b60823a288d00820cb50d29138.1610622251.git.viresh.kumar@linaro.org>
 <16e1ec02-e6da-b49d-ee21-c98660605cf8@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <16e1ec02-e6da-b49d-ee21-c98660605cf8@synopsys.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_223436_518805_41669BA4 
X-CRM114-Status: GOOD (  11.93  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Arnd Bergmann <arnd@kernel.org>, Robert Richter <rric@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "anmar.oueja@linaro.org" <anmar.oueja@linaro.org>,
 "oprofile-list@lists.sf.net" <oprofile-list@lists.sf.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 William Cohen <wcohen@redhat.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 14-01-21, 17:51, Vineet Gupta wrote:
> On 1/14/21 3:35 AM, Viresh Kumar wrote:
> > The "oprofile" user-space tools don't use the kernel OPROFILE support
> > any more, and haven't in a long time. User-space has been converted to
> > the perf interfaces.
> >
> > Remove the old oprofile's architecture specific support.
> >
> > Suggested-by: Christoph Hellwig <hch@infradead.org>
> > Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> 
> Acked-by: Vineet Gupta <vgupta@synopsys.com>
> 
> I presume this doesn't need to go through ARC tree.

Yes.

-- 
viresh

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
