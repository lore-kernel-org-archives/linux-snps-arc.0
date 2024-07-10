Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0822DC3DA42
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 Jul 2024 08:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APcEZmTsd1rAoZ+0RhZ9WjBpEgrbq3DHB1Yh7tyeBMU=; b=wV0h+nyOhdPPeR
	Ke7xuG9o1IZb4jqMPguoNh28lqDq7cfUpYbS+OR+stbT7KH/ssx0vuLc/qatALhG3kD70PbSnsCbX
	RgWRQeWGX4qqgdVtEotVwVmYPBNuu6LLHs+RZcw9oN6ohKH9jEQHXeB/NKlyMCfiuok8WwH5JSxfh
	affzwc5yyuV99MMbSNbqsJJ5WtPmvaOGq7AP61Vk9YAKqTZFcK4Rzo+taTZItG+tm3syqgSryPvzc
	zlbpc8hdTyJejkBB8SU2VZ8PFl2ZtFg4qwg2JeluWXKZsAe5QkJA3JJ8h9hBluz3P9WL3n3BrGMD3
	2J1o27RxXFePJIDvo6og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRT9V-00000009zQ7-13fM;
	Wed, 10 Jul 2024 08:58:17 +0000
Received: from fout4-smtp.messagingengine.com ([103.168.172.147])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRT94-00000009zDK-0pxv;
	Wed, 10 Jul 2024 08:57:52 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id BC0751381C26;
	Wed, 10 Jul 2024 04:57:48 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 10 Jul 2024 04:57:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1720601868; x=1720688268; bh=lt/fTYVo1r
	XzmeyPprLYJqd44kchp17M6qZOeedxiX0=; b=vElaDc5Zc4T0Bucn0BpOSB6GZ0
	hjNAgO3T5KaLmjz60FKHB4Cc7LinLJmzsc6RD4gS509+0qqW9TiguqDbOe6n1QH7
	J11fG0VOjxBsEX+UDwCBaxZNZSsL/Eidk7IDp3EE5NZPbOaPPStHgOvzD3LeqXmu
	7UfdC+foZq6/5knFTUYNrVxWJ0JcPXPfpbRsMV1zT0nr8OmrhD6etqIYPSXdaSdk
	k7LEdU/zq8ZmkW7LIxAR0GRe4RievqOm3RsDQmiMGUN8u3f3HjBqcgWRKLhflT07
	jy8vU5NNqiCi6a1shhok0mcPRLwSNBoa2c71l99xz4WSW9z0xwuBina45+Nw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720601868; x=1720688268; bh=lt/fTYVo1rXzmeyPprLYJqd44kch
	p17M6qZOeedxiX0=; b=IHNtdTc2MwgAHu+xsleVLRgFnL8zU2pqZI8wFXBO4G+z
	w7duvlyY1ZInZUOFYw/zHAMZZ1iz6uKfGYfjjmAG+balX3StBpo5ycfaUxigvTR+
	Vq8azfJ9B+A44C1vVXZ0vhtvPpka7EeglroUGLl8yIiV+HwPbZGN8XrIkqmyFQEa
	a9PWgOU3o8GqsJiMNTX7qHWBAQuO/ZnZdVWpQLeP/bNxu3JE1i5jCfxsHMbsiMd9
	XdiMVReUHd9OXaUru1txg9lHxpikSz+1xtseAoEmdsHFcWwjBZUKfnd1bh2/F8bp
	uuLuJRjKjr6zR6IFvoCBkHzCkxkEdxYrx3c45QFaaA==
X-ME-Sender: <xms:CU2OZtUZS9duTLybtLEjKFdaMSRkCFbANioPF2RVtxMDgWW0WqVXbQ>
    <xme:CU2OZtl5gfIoLfrZ9z6Mba3YM7-UiIYfgWhjPEMQcbEzgWOyXG9AyqtMiPLqLUZ1m
    R0cNRxcl5Cbgdp3Hc8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfedugddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:CU2OZpYvBg6NeqezJ_1Y3OV0VK_2AKn1UDwnzoDmmbITnlsj8aypPw>
    <xmx:CU2OZgVzjr4HBNlxUYnWoLnXwaV1g5GGCjgT9vsyzXWpdgEUXXap_A>
    <xmx:CU2OZnk73biMVuO72udsYhhDDSs9kRL0Ezf3bcNHGzrqQnwnT2sK2w>
    <xmx:CU2OZtekE7zuLdid4cWFK96thjCQjauEHD6khKqmzgiMDMNOQudQtQ>
    <xmx:DE2OZhvCsORzsRusPbb4ghNUKhzWWPHTcU6ETVqu8SjoqHNiXfuHvRLB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AB154B6008D; Wed, 10 Jul 2024 04:57:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <93c84e97-b307-4486-8dfb-e966c96751a1@app.fastmail.com>
In-Reply-To: <c8c882ad-d508-40b7-9af5-b2a2ddf777c1@sirena.org.uk>
References: <20240704143611.2979589-1-arnd@kernel.org>
 <20240704143611.2979589-11-arnd@kernel.org>
 <c8c882ad-d508-40b7-9af5-b2a2ddf777c1@sirena.org.uk>
Date: Wed, 10 Jul 2024 10:57:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mark Brown" <broonie@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: Linux-Arch <linux-arch@vger.kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>,
 "Nicolas Schier" <nicolas@fjasle.eu>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Brian Cain" <bcain@quicinc.com>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>, "Dinh Nguyen" <dinguyen@kernel.org>,
 "Jonas Bonn" <jonas@southpole.se>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Stafford Horne" <shorne@gmail.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christian Brauner" <brauner@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-riscv@lists.infradead.org, "Aishwarya TCV" <Aishwarya.TCV@arm.com>,
 shuah <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 10/17] arm64: generate 64-bit syscall.tbl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_015750_438540_CEBC62CC 
X-CRM114-Status: GOOD (  18.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jul 9, 2024, at 19:23, Mark Brown wrote:
> On Thu, Jul 04, 2024 at 04:36:04PM +0200, Arnd Bergmann wrote:
>
>>  #define __ARCH_WANT_SYS_CLONE
>> +#define __ARCH_WANT_NEW_STAT
>>  
>> -#ifndef __COMPAT_SYSCALL_NR
>> -#include <uapi/asm/unistd.h>
>> -#endif
>> +#include <asm/unistd_64.h>
>
> It looks like this is causing widespread build breakage in kselftest in
> -next for arm64, there are *many* errors in the form:
>
> In file included from test_signals_utils.c:14:
> /build/stage/build-work/usr/include/asm/unistd.h:2:10: fatal error: 
> unistd_64.h: No such file or directory
>     2 | #include <unistd_64.h>
>       |          ^~~~~~~~~~~~~
>
> which obviously looks like it's tied to the above but I've not fully
> understood the patch/series yet.  Build log at:
>

Thanks for the report! I just panicked a bit and thought I had
done something entirely wrong here, but after having a closer
look it turned out to be a silly typo:

diff --git a/arch/arm64/include/uapi/asm/unistd.h b/arch/arm64/include/uapi/asm/unistd.h
index 038dddf8f554..df36f23876e8 100644
--- a/arch/arm64/include/uapi/asm/unistd.h
+++ b/arch/arm64/include/uapi/asm/unistd.h
@@ -1,2 +1,2 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#include <unistd_64.h>
+#include <asm/unistd_64.h>

I'm folding the fix into the tree now, in addition to the Acks
I received and another small fixup.

I checked that arm64 is the only architecture that has this
particular bug, and I tried building kselftest now, which seems
to work better. There are still a few warnings and errors
I get doing that, but I suspect those are all preexisting
issues.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
