Return-Path: <SRS0=cuW9=GL=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3250C433DB
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Jan 2021 03:48:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41A1C236F9
	for <linux-snps-arc@archiver.kernel.org>; Fri,  8 Jan 2021 03:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41A1C236F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AofLE4kelO4dC2p/xHPCDO47KJATEBOmNy/0sN2coc0=; b=sRcMk3WVbVNY6ptKxxkIuDbfG
	/PJ1R7YJI3TgwlUG5CKFtXH6jnvrJmxjTdqN8cTtJQzKvL/4x8Y5aaQ5x4E9Fo2k/1sICzoa8s9do
	1XjeXbJWMqTbpnMFLss0FvBYaNohM3Y1eEuEw9wdFc5ig1mltOMuJCJm+zZVOVNcq+x5DpWXTKEEa
	Y5DNHJHp5ohr4YMBF/vBjEgkdrQHBSP1SzqjXj3xNSqnE4Yjv99bRJyVTA66XEgqFzoqYx/azqnpm
	B/EbUZXJEJBM0CvkuDb7vXaWKD/WLKqO8OLDjfZsM17tGOLQrs5HGXcjtTsvIHWcl1hduVZqQi18h
	5o4WIm73g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxile-0006LD-3Y; Fri, 08 Jan 2021 03:48:50 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxilc-0006K6-5E
 for linux-snps-arc@lists.infradead.org; Fri, 08 Jan 2021 03:48:49 +0000
Received: by mail-pj1-x1031.google.com with SMTP id z12so2940993pjn.1
 for <linux-snps-arc@lists.infradead.org>; Thu, 07 Jan 2021 19:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=pvFJBy06CLz3+t4PqJc62iFp4e7lY1y9gXn28qJswE4=;
 b=H4e7W7/jBppjt29pWS9EOOptTbmFaGg3EJpqr1ISOxtqkA5hrOj5eWjS6Y9b8Uzv0a
 PljjkLdumX6b3D5+oLzvdS1CAzmDevN2bvVJfp6w9f8EHFhwvR7Ra6cL5NydOoNJdle9
 YS2J2qPYZerQjJ0vPlZziA0zwa/iEP8GPuglhZUaR7nKP13ieai9Kr803MhIYHhPCsVU
 vz6oUGjVQ/yFYKmHCUCJxZd+gINoWyaB9vSihX6A013YOZ7VElpIiPiqYfgurZcl60HZ
 MVX7fSVDmovetAG5yKQ45fRkbbvUvnwoU0aBe0lUv+j4KqAIZmrlchKMKksyJ1tQgd2Y
 QGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=pvFJBy06CLz3+t4PqJc62iFp4e7lY1y9gXn28qJswE4=;
 b=nDLWAqLYI2NF1E50bkoOnJMpSn9f9H/W/o+ApKkFxv/KYPiZSEwAMOh3dARgcAZU2Y
 X/3ojNrAD/py4VtcCaWtKsq94FMFK73S+jyYpqO642oow7TADtYU9gn4VwdH9m/hw0VO
 nPQKCl6mIR1OH9lJqHrEXvqC0Q2Q7ozqB1K7oJxPyBGO7o6DsajsE5rsXnqFy/CEmx8i
 JqY+Jf7+/P8wxZ/lFthGl2ivvC1BrfUge1VBFV99rHA6FRa8FM1HQeIh3Ypjl5KUleLY
 aD4UFjGkuLzKU7igwj29OrKU9xymWBx5nvAfdhmhCU63ETGFIOLs+DANE51eWPGgsAhI
 XRVA==
X-Gm-Message-State: AOAM532ONtWJXt6v6R3JgEkBUfs8UsKDu3NFLcWJ2c2SFtJgYOeVpt6G
 ae5tBPSwXjPlVubQdQQRhjs=
X-Google-Smtp-Source: ABdhPJzamCNlkOjHaM4E4P/X1nySTrEpI7Nd5nS7fK80jAWW++uws3uB1b+uFqI4FDVD7Y+3hqMDRg==
X-Received: by 2002:a17:90a:6f01:: with SMTP id
 d1mr1668731pjk.155.1610077726066; 
 Thu, 07 Jan 2021 19:48:46 -0800 (PST)
Received: from localhost ([2409:10:2e40:5100:6e29:95ff:fe2d:8f34])
 by smtp.gmail.com with ESMTPSA id v10sm3253257pjr.47.2021.01.07.19.48.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 19:48:44 -0800 (PST)
Date: Fri, 8 Jan 2021 12:48:42 +0900
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: Re: ARC no console output (was Re: [PATCH 1/2] init/console: Use
 ttynull as a fallback when there is no console)
Message-ID: <X/fWGjYI5LapMdGW@jagdpanzerIV.localdomain>
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
 <8735zdm86m.fsf@jogness.linutronix.de>
 <50ade852-c598-6476-1f4b-9a3f8d11d143@synopsys.com>
 <X/c/ONCYz2QQdvOP@alley>
 <466644f5-bed7-caef-9fcd-e66208f65545@synopsys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <466644f5-bed7-caef-9fcd-e66208f65545@synopsys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_224848_219131_8845013D 
X-CRM114-Status: GOOD (  20.04  )
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
Cc: linux-arch@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 John Ogness <john.ogness@linutronix.de>,
 Shreyas Joshi <shreyas.joshi@biamp.com>, linux-kernel@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, buildroot@busybox.net,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, shreyasjoshi15@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On (21/01/07 09:58), Vineet Gupta wrote:
> On 1/7/21 9:04 AM, Petr Mladek wrote:
> > On Thu 2021-01-07 08:43:16, Vineet Gupta wrote:
> > > Hi John,
> > > 
> > > On 1/7/21 1:02 AM, John Ogness wrote:
> > > > Hi Vineet,
> > > > 
> > > > On 2021-01-06, Vineet Gupta <vgupta@synopsys.com> wrote:
> > > > > This breaks ARC booting (no output on console).
> > > > 
> > > > Could you provide the kernel boot arguments that you use? This series is
> > > > partly about addressing users that have used boot arguments that are
> > > > technically incorrect (even if had worked). Seeing the boot arguments of
> > > > users that are not experiencing problems may help to reveal some of the
> > > > unusual console usages until now.
> > > 
> > > 
> > > Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8
> > > console=ttyS0,115200n8 debug print-fatal-signals=1
> > 
> > This is strange, the problematic patch should use ttynull
> > only as a fallback. It should not be used when a particular console
> > is defined on the command line.
> 
> What happens in my case is console_on_rootfs() doesn't find /dev/console and
> switching to ttynull. /dev is not present because devtmpfs doesn't automount
> for initramfs.

I wonder if we'll move the nulltty fallback logic into printk code [1]
will it fix the problem?

[1] https://lore.kernel.org/lkml/X6x%2FAxD1qanC6evJ@jagdpanzerIV.localdomain/

	-ss

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
