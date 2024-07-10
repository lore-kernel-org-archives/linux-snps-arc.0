Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0909EC3DA45
	for <linux-snps-arc@archiver.kernel.org>; Wed, 10 Jul 2024 10:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RYJGBz/L4VIDZDhD0Qe8+Z4cxN3nab/wVNMK/NnEiiU=; b=26CQ5sBo7Ogqll
	lGker2d/GOtS1rUotnPAUdQ/foTm2+4Q3tUoBch8PkqJfccjESmUpa/8EYN8m3bKrWBkStyiyeFZO
	U91bVC4CfHUodJbix0yJVJuWTxAQMIEIzizaJ69C4j9f1On5118ypr/G41XA32Cmv0cuCVgA8uzDz
	utZI4FQTms52LdFhjKh4/OxZyef11rCublqtKeGRXAoG+g5sgdPXHQgcFBN2HnGr4AOWIYAZylmsM
	ebWs9ZZUr6J+kXFuxBlJefpsdOQMBSkMdW6eO4wpx4O7OoaI8El5hzjmHdpFRwbdfNvZPhrKBb6Oo
	63J8dUuhCuUZuMPRWAUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRUYH-0000000ABlC-1NgN;
	Wed, 10 Jul 2024 10:27:57 +0000
Received: from fout5-smtp.messagingengine.com ([103.168.172.148])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRUXy-0000000ABhx-3v53;
	Wed, 10 Jul 2024 10:27:40 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 7FA5213807ED;
	Wed, 10 Jul 2024 06:27:37 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 10 Jul 2024 06:27:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1720607257; x=1720693657; bh=y7I9x5O068
	rIa6OwNh1cKNoYpCATZicSDmRnAUguLsU=; b=LyoeV7gWDoZN30PXCwvf8Wxeg6
	VhoBTVUhVW1s1omN6d8MKzk7jEzeXh8G5o3fMq2+GFZyBVg/9/7OEhye+/coWt2O
	XfAhCV6pfHeQn17iPTTX2lKtnsu7/SS85QVlYeEFAIh8HBt+aTgpZe20ljb+djY9
	KkAzG4mjhKV0qUKdG0gR+2CejXzNw/FxE5kv6+1kjsvhxagXsgNXyayRyPdaQbeQ
	4TBQPDKF3YFf+VvY9c/rWAvGbZGkMYb+IU1xgJ04tc8Lwn7CByXKIAgP2f3v93aA
	AoojIIDVoBGSZB+yjz8jXJf75ilDChNU4VltOrQAj2Dm90JSVQOz8ktykirw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720607257; x=1720693657; bh=y7I9x5O068rIa6OwNh1cKNoYpCAT
	ZicSDmRnAUguLsU=; b=TQea+NHxpLxXt64jCbNK563C0E1TLCjGTuZN4XWClfBX
	Q+hiwNI0APwrfFgBUmFeN+FlkT0ajXZjAbuIrQNBXBMSAspspDtA+vFl5wSJsH6E
	cf197a4HNOG7bQXAR4Io3DEpsVFMTnNaNAdR20K7xWSpjgQ7DH48OO1jWq65WdVZ
	KocA8mDU0G6OXbyBpcTXLQml76zE9t4F4YwV0CnWbjiN2MSuT46ZA1ZodsAUvB1Y
	EMkXZXgPKUePYdiFfv6KLd+xOkVCBcPaKAeZ1lDw51o7t4aMsNfmIySSOVLdSNYT
	RR8pYHgQg1azc7LSxH3IoyoJBkXtKrOxBa0ztmnx8Q==
X-ME-Sender: <xms:FWKOZu7OEleYA2ZaQhHK0YTUnp8ZCDHU5Qv_qlmoFX318_1KRZ1MzQ>
    <xme:FWKOZn4LSmiq1Nz2uEK5cmUYFupZB_cnhbb__NNmw8e_CrlbvFEeBRejSUSAy3RoL
    fmzX2g8WT0vglJEYbo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrfedugddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:FWKOZtdwYsGl2L1-gJ_SxX2LvVQtIBz8P-0pqaYJsEiEIkuD8KivmA>
    <xmx:FWKOZrKhYoVjzenA5bi3dxmDRoOXqMLEY13McAvD4kG-Wyq4f5hJDw>
    <xmx:FWKOZiKJoBDOxda2I585qtzs7LQ5PYxoOCjycASUr7Si107QHnftyQ>
    <xmx:FWKOZsyLzbfGhHPd5czHKWB7WVZYFT3G51G187eTM8ruvcR7PmmdPw>
    <xmx:GWKOZurc55eLY785N_cbAB-SOzxSp53CmaIywxCCzaSOw7ZJQ6KRTTUf>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C869EB6008F; Wed, 10 Jul 2024 06:27:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <9b269c2a-c6b5-4fa0-801b-e5e1c3ccb671@app.fastmail.com>
In-Reply-To: <20240704143611.2979589-13-arnd@kernel.org>
References: <20240704143611.2979589-1-arnd@kernel.org>
 <20240704143611.2979589-13-arnd@kernel.org>
Date: Wed, 10 Jul 2024 12:27:13 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Arnd Bergmann" <arnd@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>
Cc: "Masahiro Yamada" <masahiroy@kernel.org>,
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
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 12/17] csky: convert to generic syscall table
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_032739_339154_CD90F2BC 
X-CRM114-Status: UNSURE (   8.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, Jul 4, 2024, at 16:36, Arnd Bergmann wrote:
> -
> -#define __NR_set_thread_area	(__NR_arch_specific_syscall + 0)
> -__SYSCALL(__NR_set_thread_area, sys_set_thread_area)
> -#define __NR_cacheflush		(__NR_arch_specific_syscall + 1)
> -__SYSCALL(__NR_cacheflush, sys_cacheflush)
> +#include <asm/unistd_32.h>
> +#define __NR_sync_file_range2 __NR_sync_file_range

A small update: I have folded this fixup into this patch
and the hexagon one, to ensure we don't define both
__NR_sync_file_range2 and __NR_sync_file_range. I already
have patches to clean this up further to avoid both the
#undef and #define, but that is part of a larger rework
that is not ready before the merge window.

     Arnd

diff --git a/arch/csky/include/uapi/asm/unistd.h b/arch/csky/include/uapi/asm/unistd.h
index 794adbc04e48..44882179a6e1 100644
--- a/arch/csky/include/uapi/asm/unistd.h
+++ b/arch/csky/include/uapi/asm/unistd.h
@@ -1,4 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 
 #include <asm/unistd_32.h>
-#define __NR_sync_file_range2 __NR_sync_file_range
+
+#define __NR_sync_file_range2 84
+#undef __NR_sync_file_range
diff --git a/arch/hexagon/include/uapi/asm/unistd.h b/arch/hexagon/include/uapi/asm/unistd.h
index 6f670347dd61..a3b0cac25580 100644
--- a/arch/hexagon/include/uapi/asm/unistd.h
+++ b/arch/hexagon/include/uapi/asm/unistd.h
@@ -29,4 +29,5 @@
 
 #include <asm/unistd_32.h>
 
-#define __NR_sync_file_range2 __NR_sync_file_range
+#define __NR_sync_file_range2 84
+#undef __NR_sync_file_range

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
