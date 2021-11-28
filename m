Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8AAC433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 28 Nov 2021 04:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Q4vXxDtGhLUcwrQ9kwYKmzSbWurQ9tAIMb2UkX4rWk=; b=rsP4jAftM/h3FX
	thWIAekgO0T8OqDTZi8m4EjYCAeO7xch/KkMfZEovwsl9ydkHf97ZtTv5pq+tqyJh/y2ZkYgR1C6K
	qW5pd/adrQ8zzLMVHEyTD3eD4pSJe4WbmgubwM/GXq2F7t+RMbKUJUs9vxrV/Cm1+Dj0ZuE85WjzQ
	ScPgCn2E2n+sc8g3FdgAeDYXp/6MBN3uZ+wno5zNnmf1J3QDBMxEUCfVK29rpL03xY5iArnZJ7Kwk
	sGbOeD0xzV2pu4vPfYoWc+sk4k2cFTHIZZn7X/XNn9HmjTjJ3rGConBR/73NYuDgXoU7bDzy0RMT+
	Mm87i5lSBA8wS2OspLJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrCGh-00F3tR-Vv; Sun, 28 Nov 2021 04:58:27 +0000
Received: from rere.qmqm.pl ([91.227.64.183])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrCGT-00F3rs-N7; Sun, 28 Nov 2021 04:58:15 +0000
Received: from remote.user (localhost [127.0.0.1])
 by rere.qmqm.pl (Postfix) with ESMTPSA id 4J1wvh31dgzNL;
 Sun, 28 Nov 2021 05:47:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
 t=1638074864; bh=T0svUg/TJeCaOj3VBZ/3tRgBnlIZMjU65z9Fv+g5zQQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nn7s8QPTQ/loie98xkMYWvJAWdNi0ygFbehqQ63G9aASvWbHHSf28+XNOM2IsqPek
 Id9Qk7aFHuFwrGibBi8TresAAu9XqBcHIi12aTTvDPBLXczkWFqaVeOOJqwU7nzdju
 cV9IwxL2w6Fd22ryYwl1Sh9x2PviA4Kf1ikAu3uR5SMygCLmnTRZxshC+MEAGrH0Kv
 tsp5I9URKJw3bR68w4MVuWQ2xdmfd6DgYPrQCMsS55RcJLwTkVCCw/V2t3AdcHjMnW
 QCHQOrGKek5wpaMAmZUhPLRcHZ38Wx/IlUleKYu8VrTTTyi1x1pbkvgBzAZLAICths
 2w9BfRFMcSpxg==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.103.3 at mail
Date: Sun, 28 Nov 2021 05:47:43 +0100
From: =?iso-8859-2?B?TWljaGGzoE1pcm9zs2F3?= <mirq-linux@rere.qmqm.pl>
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 kvm@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/9] all: replace bitmap_weigth() with
 bitmap_{empty,full,eq,gt,le}
Message-ID: <YaMJ7x8viyKyYk6w@qmqm.qmqm.pl>
References: <20211128035704.270739-1-yury.norov@gmail.com>
 <20211128035704.270739-4-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211128035704.270739-4-yury.norov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211127_205813_943778_CC3992C4 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Nov 27, 2021 at 07:56:58PM -0800, Yury Norov wrote:
> bitmap_weight() counts all set bits in the bitmap unconditionally.
> However in some cases we can traverse a part of bitmap when we
> only need to check if number of set bits is greater, less or equal
> to some number.
> =

> This patch replaces bitmap_weight() with one of
> bitmap_{empty,full,eq,gt,le), as appropriate.
> =

> In some places driver code has been optimized further, where it's
> trivial.
[...]

I think this patch needs to be split. bitmap_full/empty() conversions
can be separated (don't need the bitmap_weight_*() functions) and
not all changes are trivial. Besides, gathering and checking all the
acks needed into one patch seems problematic.

Best Regards,
Micha=B3=A0Miros=B3aw

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
