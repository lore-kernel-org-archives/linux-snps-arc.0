Return-Path: <SRS0=+YGD=GJ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390FBC433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Jan 2021 23:36:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E186E22D01
	for <linux-snps-arc@archiver.kernel.org>; Wed,  6 Jan 2021 23:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E186E22D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J0/8leIhtM2w89awW7xdQglJRsRzTSU7RfxSUzkfpNI=; b=hXbWy7BTp9ow4hrrlvHTxiLtt
	sKM7h1+7NhU5kurTiErQrEQ22mj3G+D1hiLB39FCJwg/yuW+VNCElBfEXjPqR7zsDnewP1EmzRlJH
	BsUYLvXQCP3iYYx5+iJFS4Zsztq2+ANus66RX0TGPS9AaTPuS3U2JJTV7vpnqTRX52KZ5A1ldFKd7
	8M6WWwEMIJriaXLpTdSpJlfHrHzvN7n4hnL1RPOwH3kugM5GgVaIc8/o4Vm2Kn6v5mUqextaSbz3+
	2TY+FlTJpBSQAh/0BcYD2v4Sccwu7fzENrpPvfqHSQkgGIlIrc0DxDIZpoQwu+oobsKqkVqIO+FZQ
	itczlEsZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxIMB-0006J1-IP; Wed, 06 Jan 2021 23:36:47 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxIM9-0006IH-6L
 for linux-snps-arc@lists.infradead.org; Wed, 06 Jan 2021 23:36:46 +0000
Received: by mail-pg1-x52d.google.com with SMTP id i5so3360129pgo.1
 for <linux-snps-arc@lists.infradead.org>; Wed, 06 Jan 2021 15:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:newsgroups:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=J7Eq4Crap1XNnquwBWJgU7Gq2lMLJrkQQZ+4V+b8zVo=;
 b=Ikhj1y7Vjrt3Pb1Kb1VlRzH8pFfUGIHUcN2BphVXdCtY/IauGLy5PP/3cf6gnZuElR
 Qvdp1wvAb4ZIbtzIQw1quUsfOrSjZ+NeezH0kGZZ1V8wPbHqCys9mcpRX8xHXO1rZws1
 lW3cxUsrGp1PSXpCN6Nhlo0jrDQj5rhd/cppcmQLjnBmKBHqdwt3ZlfY2qZQ9Hck1YHw
 tSxz5MWFMtk7DFyY2sp3P/XX9vG/Ep6angk2sDL9xJXIoKNFNzC5vQgtyOxQptXWGNxJ
 6cPkUuwtdwlWPqYvqjOwB3IoMlLu4klebSjp2i3iKZd1CSNd4UKMPH5xTvefOE6UT7OV
 YUmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:newsgroups:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=J7Eq4Crap1XNnquwBWJgU7Gq2lMLJrkQQZ+4V+b8zVo=;
 b=jbROKBoj+uB+10FYCeB2c24sJyDcbve9xl0KxAnT1blADEIlq85rQPEPDpl2tSPqWV
 gvgZeKZyXnIB7Mjn2BZFzqNvHANacQtaep1iuP7QQxW2DWWmjU6IMCOsW/9EjzkT7IVf
 5PTh5W3Zp7Ca6sTPbMa2rAkKOa5/YZLac9RvDaBQZxaJ70aFmV0Yhltrq0amQD36Xgnp
 efGKiCPC08aDG3X+EH5/joIiHywAj5mM569VvGhb+lh9EgggCrK+GTS0+JLdxvHeRs+T
 9L6OCyT0UKaCK4IBpR9J9jFs5yTSmTgM7vIPIpou9MOsvSLV5dqtjIHUN2rXD9rJeEpo
 p5ZA==
X-Gm-Message-State: AOAM533/cDQmOrpREyWHa4NsjykHiXFrFmO9O+m48szLxJF7OMLqUedP
 2YI5TPZRnSXKygCynPJ/+ayL0M3d7R37xCgd
X-Google-Smtp-Source: ABdhPJzQ2nOrZN3OQezwWTal114R08A0zhGMDMyLMKuquAnZcndOTNQ2StMM0xwnZ4+WmLfAQbf7tg==
X-Received: by 2002:a63:c1e:: with SMTP id b30mr6870662pgl.72.1609976200772;
 Wed, 06 Jan 2021 15:36:40 -0800 (PST)
Received: from [192.168.50.50] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
 by smtp.gmail.com with ESMTPSA id b12sm3547242pft.114.2021.01.06.15.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Jan 2021 15:36:40 -0800 (PST)
Subject: ARC no console output (was Re: [PATCH 1/2] init/console: Use ttynull
 as a fallback when there is no console)
To: Petr Mladek <pmladek@suse.com>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Ogness <john.ogness@linutronix.de>
Newsgroups: gmane.linux.kernel
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
From: Vineet Gupta <vgupta@synopsys.com>
Message-ID: <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
Date: Wed, 6 Jan 2021 15:36:36 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201111135450.11214-2-pmladek@suse.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_183645_317175_91DA04C3 
X-CRM114-Status: GOOD (  23.85  )
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
Cc: linux-arch@vger.kernel.org,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Shreyas Joshi <shreyas.joshi@biamp.com>, linux-kernel@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, buildroot@busybox.net,
 arcml <linux-snps-arc@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, shreyasjoshi15@gmail.com,
 Guenter Roeck <linux@roeck-us.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

+CC Buildroot folks

Hi Petr,

On 11/11/20 5:54 AM, Petr Mladek wrote:
> stdin, stdout, and stderr standard I/O stream are created for the init
> process. They are not available when there is no console registered
> for /dev/console. It might lead to a crash when the init process
> tries to use them, see the commit 48021f98130880dd742 ("printk: handle
> blank console arguments passed in.").
> 
> Normally, ttySX and ttyX consoles are used as a fallback when no consoles
> are defined via the command line, device tree, or SPCR. But there
> will be no console registered when an invalid console name is configured
> or when the configured consoles do not exist on the system.
> 
> Users even try to avoid the console intentionally, for example,
> by using console="" or console=null. It is used on production
> systems where the serial port or terminal are not visible to
> users. Pushing messages to these consoles would just unnecessary
> slowdown the system.
> 
> Make sure that stdin, stdout, stderr, and /dev/console are always
> available by a fallback to the existing ttynull driver. It has
> been implemented for exactly this purpose but it was used only
> when explicitly configured.
> 
> Signed-off-by: Petr Mladek <pmladek@suse.com>

> --- a/init/main.c
> +++ b/init/main.c
> @@ -1470,8 +1470,14 @@ void __init console_on_rootfs(void)
>   	struct file *file = filp_open("/dev/console", O_RDWR, 0);
>   
>   	if (IS_ERR(file)) {
> -		pr_err("Warning: unable to open an initial console.\n");
> -		return;
> +		pr_err("Warning: unable to open an initial console. Fallback to ttynull.\n");
> +		register_ttynull_console();
> +
> +		file = filp_open("/dev/console", O_RDWR, 0);
> +		if (IS_ERR(file)) {
> +			pr_err("Warning: Failed to add ttynull console. No stdin, stdout, and stderr for the init process!\n");
> +			return;
> +		}


This breaks ARC booting (no output on console).

Our Buildroot based setup has dynamic /dev where /dev/console doesn't 
exist statically and there's a primoridla /init shell script which does 
following

/bin/mount -t devtmpfs devtmpfs /dev
exec 0</dev/console
exec 1>/dev/console
exec 2>/dev/console
exec /sbin/init "$@"

Buildroot has had this way of handling missing /dev/console since 2011 
[1] and [2].

Please advise what needs to be done to unbork boot. Otherwise this seems 
like a kernel change which breaks user-space and needs to be backed-out 
(or perhaps conditionalize on CONFIG_NULL_TTY. I'm surprised it hasn't 
been reported by any other  embedded folks

Thx,
-Vineet

[1] http://lists.busybox.net/pipermail/buildroot/2011-July/044505.html
[2] http://lists.busybox.net/pipermail/buildroot/2011-August/044832.html

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
