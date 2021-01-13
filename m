Return-Path: <SRS0=QS8D=GQ=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CB28C433E0
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Jan 2021 22:07:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9EB023370
	for <linux-snps-arc@archiver.kernel.org>; Wed, 13 Jan 2021 22:07:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9EB023370
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1awDZK0XZmI5xZHBzDdyxfQaIWmgVHgIv7dezl0aUCA=; b=beNB/OWBBrxBOpKtXHglgXjKo
	fgVLR/4XBsTSmu8OWIxMEPFluiALJMkXNYaN8TEuR5vvd/dURT6oEOKxfJTS28RgG7ESUFB6A+xFC
	uxPN0wyFkX8oJ4QDneIBDdRn7+M9KtNNvJP3OgkrAVPWNbERWZgLC2E4s8kxsYxce9K0u+9wyMPXh
	RrzfUGQ63u+/aFA8ObTBsKnQOPCq9wZpsSoOYDqNALMZraA/M7vUSdErbNeb2KCrnZiAT5hVZ45PB
	0+p2f2WF6waVqvo7YPBb6utp9TR1hNM06AYWoG+2Pr4Z/MO+oFbGu732Gbh4SZKNwXT4gnUrcWqKf
	HJU1RGuqA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzoJ0-00076e-Nh; Wed, 13 Jan 2021 22:07:54 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzoIw-000753-Mw
 for linux-snps-arc@lists.infradead.org; Wed, 13 Jan 2021 22:07:52 +0000
Received: by mail-ed1-x52f.google.com with SMTP id by27so3589688edb.10
 for <linux-snps-arc@lists.infradead.org>; Wed, 13 Jan 2021 14:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=Fjx4x9CJD2wWjKON/wheiuq+1EzL46Iryc22xTN24oY=;
 b=va4GwRxtMiYIKSA/SqIIQIDY1vPL/tulMkOywZckEhLZbkhHpEMpYvfhLrH13087EN
 kXM2l8Jf61kJJXZttzxj3aSr3wdcXQ3NiOK/1XYg5lwTvXKffuuaxQKICLn8mwRhoiez
 7KNyrcUunR+dYvmVagw8isyRG7MvR5ZtxwcoZgoSZ5lKIx5/3EejSzfQlYdS0zYagmev
 cPIsk0AJvOACpUU+da4NawTYTwixhknA+O6n4rxx5TmITa1OIsGTEg86Y9Xol9aSUYWP
 tJMSk0r8RKd98RiFQc/HOsUK2zSr4NVbZSraJ+tgb4CMpTMF87CAs02UeyIbmSdq3xqG
 KXgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=Fjx4x9CJD2wWjKON/wheiuq+1EzL46Iryc22xTN24oY=;
 b=Vk8zjv7QqrnDN4Dv6gtxIMBvRsd6b0qqCY6tf8fEpto1CmVO566akNME7lPlL9SwKc
 mHHhMFFZo/CxwnPOKSSW9tOLDEhYpM4HM8a+2f3SwEzKfRllweOs39VIq7W/GUhFmhHH
 arIYvJttXfV+YUkqrSlWGEB7NQf2tJAPLaBah4lXDcVXl9dMD5stQka+L4ompcnupFwT
 k991MaDUxcDY5aP2uiAwCqAWiqmMwnVhBsWSNOE1KGYS+YmXGJeMjjjGo4qwA5l4u937
 apQaaANCiBjj0zG9KKnzkc/xwKzSURqZ/dNG3K7lwmfW9ITqfMlcAROEkb0bdiUzW2Wk
 v6lw==
X-Gm-Message-State: AOAM5337cSGMWbkpQqBfMv2BajW0Rc7WoFn7z+5Rx/pH4x9QGs3HORiF
 PQupYtj0d3kAj7+yaojD5f0=
X-Google-Smtp-Source: ABdhPJxUKBGh3JepPbB6R+MrqeDdFx9YTBcgjZ4Pvjh9UD5YwM/YStAH0Z8jRgQKOwNMRp6Mt1XMwQ==
X-Received: by 2002:a50:c34b:: with SMTP id q11mr449809edb.214.1610575667713; 
 Wed, 13 Jan 2021 14:07:47 -0800 (PST)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 b14sm1403781edu.3.2021.01.13.14.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 14:07:46 -0800 (PST)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1kzoIr-0004d2-QY; Wed, 13 Jan 2021 23:07:45 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Vineet Gupta <vgupta@synopsys.com>
Subject: Re: ARC no console output (was Re: [PATCH 1/2] init/console: Use
 ttynull as a fallback when there is no console)
References: <20201111135450.11214-1-pmladek@suse.com>
 <20201111135450.11214-2-pmladek@suse.com>
 <d2a3b3c0-e548-7dd1-730f-59bc5c04e191@synopsys.com>
 <8735zdm86m.fsf@jogness.linutronix.de>
 <50ade852-c598-6476-1f4b-9a3f8d11d143@synopsys.com>
 <X/c/ONCYz2QQdvOP@alley>
 <466644f5-bed7-caef-9fcd-e66208f65545@synopsys.com>
Date: Wed, 13 Jan 2021 23:07:45 +0100
In-Reply-To: <466644f5-bed7-caef-9fcd-e66208f65545@synopsys.com> (Vineet
 Gupta's message of "Thu, 7 Jan 2021 09:58:05 -0800")
Message-ID: <87turkfq32.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_170750_801298_374524AF 
X-CRM114-Status: GOOD (  15.30  )
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

>>>>> "Vineet" == Vineet Gupta <vgupta@synopsys.com> writes:

 > On 1/7/21 9:04 AM, Petr Mladek wrote:
 >> On Thu 2021-01-07 08:43:16, Vineet Gupta wrote:
 >>> Hi John,
 >>> 
 >>> On 1/7/21 1:02 AM, John Ogness wrote:
 >>>> Hi Vineet,
 >>>> 
 >>>> On 2021-01-06, Vineet Gupta <vgupta@synopsys.com> wrote:
 >>>>> This breaks ARC booting (no output on console).
 >>>> 
 >>>> Could you provide the kernel boot arguments that you use? This series is
 >>>> partly about addressing users that have used boot arguments that are
 >>>> technically incorrect (even if had worked). Seeing the boot arguments of
 >>>> users that are not experiencing problems may help to reveal some of the
 >>>> unusual console usages until now.
 >>> 
 >>> 
 >>> Kernel command line: earlycon=uart8250,mmio32,0xf0005000,115200n8
 >>> console=ttyS0,115200n8 debug print-fatal-signals=1
 >> 
 >> This is strange, the problematic patch should use ttynull
 >> only as a fallback. It should not be used when a particular console
 >> is defined on the command line.

 > What happens in my case is console_on_rootfs() doesn't find
 > /dev/console and switching to ttynull. /dev is not present because
 > devtmpfs doesn't automount for initramfs.

But our initramfs/cpio logic ensures that the initramfs has a static
/dev/console device node, so how can that be?

https://git.buildroot.net/buildroot/tree/fs/cpio/cpio.mk#n25

-- 
Bye, Peter Korsgaard

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
