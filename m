Return-Path: <SRS0=8MwS=H4=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945BEC433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Feb 2021 15:58:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 165B064EE1
	for <linux-snps-arc@archiver.kernel.org>; Fri, 26 Feb 2021 15:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 165B064EE1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CRqGTZzm2QY+mqGqUdTzWN7a5HaAvr/dwWsTIeqfrV8=; b=bphLwrCiHGWcmGzZ2kya7Zz4N
	gPnuvkO4hBe1EkNKM0Ay4jh/SGYuhIlySANV0WyaNFV7FtFCF6k3S9aOWw/kHmfZCJyui1c8wd0q+
	s9Ps4HDQwdgLkKrN0lKF5yj2VkMX4tCcv9wIa3SLKoeo2v7Ch11Evcl2+unM7yEInpoIpByJwj95w
	T6swmpPRAaQIVd7+plVe3QGywWndh/IUCLrEkd6v8dRMRDUkyw69Rpd45eeELphYSoT+aVxLxxZfZ
	YxXALaqKINtb/8LMepl7NPdZtAT5gpOL05zi/eGN0Whm+trmWuec+7LPSLs//fEiqjkUVUTL4aF+u
	N2hyNLaYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFfVY-0007iX-Cq; Fri, 26 Feb 2021 15:58:24 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFfVW-0007hq-CW
 for linux-snps-arc@lists.infradead.org; Fri, 26 Feb 2021 15:58:23 +0000
Received: by mail-pg1-x52b.google.com with SMTP id t25so6464379pga.2
 for <linux-snps-arc@lists.infradead.org>; Fri, 26 Feb 2021 07:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:newsgroups:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cL2jRszptyaFleZfPTTi6Fg/7dXOmLqZ2LY4BGw17jI=;
 b=rU0wdONoW9CpT+7pVVEN6WIr9BO6DrxmkoFRHi+LjPxSfnNACU66v4cTCl/KQUpaXl
 s93CHIwBDerJ4TdHxltfeDbCcHxTHUu9O0HQVGIYlJAl/4Wle1xz9LU5vQJlZjnABQpu
 HB/6yYQiLHgiiEbO0Vwpk7QyRrttJWRMJC+zWHyF4a90+qgASbhwHFTwL3zrvoDZ3cLv
 pRcV8Z5SHd3TMkBZBX+sdk34JWrvWPBNSOqew47WsHp2ylXN8KN7TgR1dD6lpsu8RVFZ
 U5Dc4Fv5PPsc4eHzoESTUBXeYM4PmKxBM3qx7lR7hcYWP/TOWcue7tvHVb6C65MORrOz
 daiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:newsgroups:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=cL2jRszptyaFleZfPTTi6Fg/7dXOmLqZ2LY4BGw17jI=;
 b=WfHF1NZgKUR2cbShCGOz+6moTjzPceEBsZJbdHJFfdOTrzHKnYeuRg/f+SqBp5bHoX
 dWgBLLllewihmEmWdI7z5+jYKFmSJAjk2DYzYe/V/BimpPP0VFwJFz2SiuNVnU5rUa49
 6yShOjBd/brDq5sI59GQYRXwM7eelxumjexVBnP7yQld7u8YAOmZITo6KSvTRiv2Qwha
 vXJhCwOfc4x3lUUkOagv2z5fgD26df1De4aaBc3I5eJCAIJ7jGsqOkSX+grvra3wCnU0
 uLEtXMkcx7N/OkXgGIYtS2tfRz6k+cleHwPOICzNLtG6jQufy/Ea4myHnwObuN6fF1XK
 7V6A==
X-Gm-Message-State: AOAM5329ZNuRTKFQ/xYe0I2VE9AlKXRA5824Z2ym6UjbHdmHCuo3xEja
 8Wjlf+h9+skPCR1mP14bQEY=
X-Google-Smtp-Source: ABdhPJybnvbQ/cMvUmOS+gcm3tZI7U+Vda06Y7qesCJQKI/Bo0OnK6aflngH9h6fQAX7ZFqmin596Q==
X-Received: by 2002:a63:304:: with SMTP id 4mr1970079pgd.280.1614355098901;
 Fri, 26 Feb 2021 07:58:18 -0800 (PST)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id 140sm10122296pfv.83.2021.02.26.07.58.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Feb 2021 07:58:18 -0800 (PST)
Subject: Re: ARC rebootstrap prereq (was Re: switching ARC to 64-bit time_t )
To: "debian-cross@lists.debian.org" <debian-cross@lists.debian.org>,
 GNU C Library <libc-alpha@sourceware.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "debian-glibc@lists.debian.org" <debian-glibc@lists.debian.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Newsgroups: gmane.comp.lib.glibc.alpha, gmane.linux.debian.devel.glibc,
 gmane.linux.kernel.arc
References: <8a9784b3-fc52-adc3-4595-33142b059388@synopsys.com>
 <20200220001136.2f14236e@jawa>
 <CAK8P3a1b73K+RjfHONWLy_dFUucXxwd+0jTnHmkf6YqwRjit4w@mail.gmail.com>
 <20200220162735.GA26634@alf.mars>
 <2c3d76a7-fa94-d16e-2803-a98a4761e427@gmail.com>
 <20200326055408.GA31088@alf.mars>
 <775ecf3d-bc33-ff9c-347d-3b2f0db6c509@synopsys.com>
 <20200826154354.GC8835@alf.mars> <20200826211627.GA3969691@aurel32.net>
 <72128fcf-2409-ef98-4e77-bc2ac40ccada@synopsys.com>
 <YDjDqP4IXxtL886p@alf.mars>
From: Vineet Gupta <vgupta@synopsys.com>
Message-ID: <c0cadd1d-717b-70a5-edc0-f7d25aa2cb70@synopsys.com>
Date: Fri, 26 Feb 2021 07:58:15 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDjDqP4IXxtL886p@alf.mars>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_105822_445842_72F59FAA 
X-CRM114-Status: GOOD (  14.91  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Helmut,

On 2/26/21 1:47 AM, Helmut Grohne wrote:
> 
> Unfortunately, no. Debian has started freezing in preparating of the
> bullseye release. Only up to version 2.31 is packaged and Aurelien seems
> a little busy these days. If I recall correctly, 2.32 drops some
> backwards compatibility stuff that Debian still relies on $somewhere,
> but is transitioning away already.

2.32 also brings in 64-bit time_t/offset support (at least the ARC ABI 
is) so there might be even more work in rest of ecosystem.

> So it's not just dumping 2.32
> together with the 2.31 packaging in experimental.
> 
> Before that happens, there is little I can do to help. With 2.31, we
> still get:
> | checking sysdep dirs... configure: error: The arc is not supported.

At one point you were contemplating diff'ing between glibc 2.31 and 2.32 
and trying to apply that to unstable package w/o bumping the version. 
But how about we take 2.31 as baseline and use the prio ARC port (same 
32-bit time_t ABI) to kick things forward if just as a hack. We would 
then be able to shake out any other potential downstream blockers)

> I'm still interested in supporting the arc bootstrap. Please get back
> with me when we can move on.

Thx, that is appreciated.

> You can check Debian's glibc version at
> https://tracker.debian.org/pkg/glibc at any time in the version column.

Noted.

Thx,
-Vineet


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
